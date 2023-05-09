import 'package:flutter/material.dart';
import 'package:flutter_packages_implementation/Percent%20Indicator/sample_circular_page.dart';
import 'package:flutter_packages_implementation/Percent%20Indicator/simple_linear_screen.dart';

class PercentInicatorExample extends StatefulWidget {
  const PercentInicatorExample({super.key});

  @override
  _PercentInicatorExampleState createState() => _PercentInicatorExampleState();
}

class _PercentInicatorExampleState extends State<PercentInicatorExample> {
  void _openPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Percent Indicator Example")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              color: Colors.blueAccent,
              child: const Text("Circular Library"),
              onPressed: () => _openPage(SampleCircularPage()),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
            ),
            MaterialButton(
              color: Colors.blueAccent,
              child: const Text("Linear Library"),
              onPressed: () => _openPage(const SampleLinearPage()),
            ),
          ],
        ),
      ),
    );
  }
}
