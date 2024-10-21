import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

    int wer = 0;

  void getTime() async {
    final response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Nairobi'));
    Map data = jsonDecode(response.body) ;
    // print(data);
    // Get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    // Create a datetime object
    DateTime dt = DateTime.parse(datetime);
    dt = dt.add(Duration(hours: int.parse(offset)));
    print(dt);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Loading screen"),
    );
  }
}