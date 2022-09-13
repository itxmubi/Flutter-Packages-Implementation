import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AutoSizeTextExample extends StatelessWidget {
  const AutoSizeTextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 300,
            height: 300,
            child: AutoSizeText(
              "This string will fdsfas adfd dsfasd fsf sdaf dsfsadf\n dsfa fdsf dasf df dfa dfs adf sdf sd fdas f\n df abe automatically resized to fit in two lines.",
              style: TextStyle(fontSize: 30),
              maxLines: 6,
            ),
          ),
        ),
      ),
    );
  }
}
