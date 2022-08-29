import 'package:flutter/material.dart';

GlobalKey globalKey = GlobalKey();

class FlutterToastExample extends StatefulWidget {
  @override
  _FlutterToastExampleState createState() => _FlutterToastExampleState();
}

class _FlutterToastExampleState extends State<FlutterToastExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: const Text("Toast"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 24.0,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Flutter Toast Context"),
          ),
        ],
      ),
    );
  }
}
