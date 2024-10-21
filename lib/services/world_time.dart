import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location; // Location name for UI
  late String time; // Time in the location
  String flag; // url for image asset
  String url; // url for api call

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
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

  }

}

WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');