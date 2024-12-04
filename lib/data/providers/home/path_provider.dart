

import 'dart:math';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stimassign/core/core_services/path_presis.dart';
import 'package:stimassign/core/utils/dimensions.dart';
import 'package:stimassign/data/repo/repo.dart';

import '../../models/home/path_model.dart';

class PathViewModel extends StateNotifier<PathModel?> {


  PathViewModel() : super(null){
    generateData();
  }



  Path createCatmullRomPath(List<Offset> points) {
    Path path = Path();

    // Start the path at the first point
    if (points.isNotEmpty) {
      path.moveTo(points[0].dx, points[0].dy);

      // Generate Catmull-Rom spline
      for (int i = 0; i < points.length - 1; i++) {
        int prev = (i == 0) ? i : i - 1;
        int next = (i == points.length - 1) ? i : i + 1;
        var p0 = points[prev];
        var p1 = points[i];
        var p2 = points[next];
        var p3 = (next + 1 < points.length) ? points[next + 1] : p2;



        // Calculate Bézier control points
        Offset control1 =
        Offset(p1.dx + (p2.dx - p0.dx) / 6, p1.dy + (p2.dy - p0.dy) / 6);
        Offset control2 =
        Offset(p2.dx - (p3.dx - p1.dx) / 6, p2.dy - (p3.dy - p1.dy) / 6);

        // Draw curve segment
        path.cubicTo(
            control1.dx, control1.dy, control2.dx, control2.dy, p2.dx, p2.dy);
      }
    }

   // pathCreation = path;

    return path;
  }


  List<Offset> generateRandomNodeOffsetPoints(int n, int minX, int maxX, int minY, int maxY) {
    List<Offset> points = [];
    Random rand = Random();
    int x = rand.nextInt(maxX - minX + 1) + minX;
    int y = 50;
    bool increaseX = true;

    for (int i = 0; i < n; i++) {
      points.add(Offset(x.toDouble(), y.toDouble()));

      if (increaseX) {
        x = rand.nextInt(maxX - x + 1) + x;
      } else {
        x = rand.nextInt(x - minX + 1) + minX;
      }
      increaseX = !increaseX;
      y = y + 100 + rand.nextInt(50);
    }
    return points;
  }


  void generateData()async{

   List<Offset> coordinates = await LocalPathStorage.getCoordinates();




   List<Offset> offsetPoints = [];

    if(coordinates.isEmpty){
      int n = Repository.daysData.length;
      int minX = Dimensions.safeWidth;
      int maxX = (Dimensions.screenWidth - Dimensions.safeWidth).toInt();
      int minY = Dimensions.safeHeight;
      int maxY = Dimensions.safeNodeHeight * n;

      offsetPoints = generateRandomNodeOffsetPoints(n+1, minX, maxX, minY, maxY);


      await LocalPathStorage.saveCoordinates(offsetPoints);
    }
    else{

      offsetPoints = coordinates;
    }





    Path pathGen = createCatmullRomPath(offsetPoints);


    state = PathModel(generatedPath: pathGen,randomPoints: offsetPoints);





  }





}

final pathProvider = StateNotifierProvider<PathViewModel, PathModel?>((ref) {
  return PathViewModel();
});
