import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int wer = 0;

  void getData() async {
    // simulate a network request for a username
    String username = await Future.delayed(Duration(seconds: 3), () {
      return 'Yoshi';
    });

    // simulate network request ti get bio of the username
    String bio = await Future.delayed(Duration(seconds: 2), () {
      return 'Vegan, musician & egg collector';
    });

    print('$username - $bio');
  }

  @override
  void initState() {
    super.initState();
    getData();
    print("Hey there!");
  }

  @override
  Widget build(BuildContext context) {
    print("Build InitState function run");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("Choose a location", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
      ),
      // body: const Text("choose location screen"),
      body: ElevatedButton(
        onPressed: () {
          setState(() {
            wer += 1;
          });
        },
        child: Text('Counter is $wer'),
        ),
    );
  }
}