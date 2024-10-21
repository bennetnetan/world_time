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

  void getData() async {
    final response = await get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    Map data = jsonDecode(response.body) ;
    print(data['title']);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Loading screen"),
    );
  }
}