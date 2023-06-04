import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';


class AnotherFLushbarExample extends StatefulWidget {
  AnotherFLushbarExample({Key? key,}) : super(key: key);



  @override
  _AnotherFLushbarExampleState createState() => _AnotherFLushbarExampleState();
}

class _AnotherFLushbarExampleState extends State<AnotherFLushbarExample> {
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        
        title: Text("Another Flush Bar"),
      ),
      body: Center(
      
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello flushbar:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Flushbar(
            title: 'Hey Ninja',
            message:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
            duration: Duration(seconds: 3),
          ).show(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}