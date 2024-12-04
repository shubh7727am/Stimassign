import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

class LocalPathStorage {

  static Future<void> saveCoordinates(List<Offset> coordinates) async {


    final prefs = await SharedPreferences.getInstance();


    List<String> coordinatesList =
    coordinates.map((offset) => '${offset.dx},${offset.dy}').toList();

    await prefs.setStringList('savedCoordinates', coordinatesList);

  }


  static Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();
  }


  static Future<List<Offset>> getCoordinates() async {
    final prefs = await SharedPreferences.getInstance();


    List<String>? stringList = prefs.getStringList('savedCoordinates');



    if (stringList == null || stringList.isEmpty) {
      return [];
    }


    return stringList.map((item) {
      final parts = item.split(',');

      if (parts.length == 2) {
        final dx = double.tryParse(parts[0]);
        final dy = double.tryParse(parts[1]);


        if (dx != null && dy != null) {
          return Offset(dx, dy);
        }
      }


      return const Offset(0, 0);
    }).toList();
  }
}
