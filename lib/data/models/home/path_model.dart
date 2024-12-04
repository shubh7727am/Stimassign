import 'dart:ui';

class PathModel {
  final Path generatedPath;
  List<Offset> randomPoints;
  PathModel({required this.generatedPath , this.randomPoints = const []});
}