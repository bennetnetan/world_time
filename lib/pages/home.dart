import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    // Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

        // Retrieve the arguments passed from the Loading screen
    final args = ModalRoute.of(context)!.settings.arguments;

    // Check if args is null and handle it
    if (args == null || args is! Map<String, dynamic>) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('No data available'),
        ),
      );
    }

    // Extract the data from the arguments
    final Map<String, dynamic> data = args;
    String location = data['location'];
    String flag = data['flag'];
    String time = data['time'];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,  120, 0, 0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                }, 
                label: const Text("Edit location"),
                icon: const Icon(Icons.edit_location),
                ),
                SizedBox(height: 20.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '$location',
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 2.0
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      '$time',
                      style: TextStyle(
                        fontSize: 50.0,
                        letterSpacing: 2.0
                      )
                      ),
                  ],
                ),
            ],
          ),
        )
        ),
    );
  }
}