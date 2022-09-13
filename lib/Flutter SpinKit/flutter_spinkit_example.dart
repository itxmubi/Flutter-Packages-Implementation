import 'package:flutter/material.dart';
import 'package:flutter_packages_implementation/Flutter%20SpinKit/showcase.dart';
import 'package:flutter_packages_implementation/Flutter%20SpinKit/workspace.dart';

class FlutterSpinkitExample extends StatelessWidget {
  const FlutterSpinkitExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: LayoutBuilder(
              builder: (context, _) {
                return IconButton(
                  icon: const Icon(Icons.play_circle_filled),
                  iconSize: 50.0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const ShowCase(),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const Positioned.fill(
            child: Center(
              child: WorkSpace(),
            ),
          ),
        ],
      ),
    ));
  }
}
