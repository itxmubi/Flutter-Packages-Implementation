import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "I am a flutter Toast",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
            child: const Text("Click to Show Flutter Toast"),
          ),
        ],
      ),
    );
  }
}
