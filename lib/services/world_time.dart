import 'package:http/http.dart';
import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class WorldTime {

  String location; // Location name for UI
  late String time; // Time in the location
  String flag; // url for image asset
  String url; // url for api call
  late bool isDayTime; // true if it's day time, false if it's night time

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    try {
      final response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body) ;
      // print(data);
      // Get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      // Create a datetime object
      DateTime dt = DateTime.parse(datetime);
      dt = dt.add(Duration(hours: int.parse(offset)));

      // Set the time property
      time = dt.toString();
      time = DateFormat.jm().format(dt);

      isDayTime = dt.hour > 6 && dt.hour < 20 ? true : false;

    } catch (e) {
      print("Caughgt error $e");
      time = "Could not get time data";
    }

  }

}

// WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');