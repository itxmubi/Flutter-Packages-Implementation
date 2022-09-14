import 'package:flutter/material.dart';

import 'common/app_bar.dart';
import 'examples/common_use_cases_examples.dart';
import 'examples/controller_example.dart';
import 'examples/custom_child_examples.dart';
import 'examples/dialog_example.dart';
import 'examples/gallery/gallery_example.dart';
import 'examples/hero_example.dart';
import 'examples/inline_examples.dart';
import 'examples/network_images.dart';
import 'examples/rotation_examples.dart';

class HomeScreenPhotoView extends StatelessWidget {
  const HomeScreenPhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const ExampleAppBar(title: "Photo View"),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              "See bellow examples of some of the most common photo view usage cases",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildItem(
                  context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CommonUseCasesExamples(),
                      ),
                    );
                  },
                  text: "Common use cases",
                ),
                _buildItem(
                  context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const GalleryExample(),
                      ),
                    );
                  },
                  text: "Gallery",
                ),
                _buildItem(
                  context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HeroExample(),
                      ),
                    );
                  },
                  text: "Hero animation",
                ),
                _buildItem(
                  context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NetworkExamples(),
                      ),
                    );
                  },
                  text: "Network images",
                ),
                _buildItem(
                  context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ControllerExample(),
                      ),
                    );
                  },
                  text: "Controller",
                ),
                _buildItem(
                  context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InlineExample(),
                      ),
                    );
                  },
                  text: "Part of the screen",
                ),
                _buildItem(
                  context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CustomChildExample(),
                      ),
                    );
                  },
                  text: "Custom child",
                ),
                _buildItem(
                  context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DialogExample(),
                      ),
                    );
                  },
                  text: "Integrated to dialogs",
                ),
                _buildItem(
                  context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GestureRotationExample(),
                      ),
                    );
                  },
                  text: "Rotation Gesture",
                ),
                _buildItem(
                  context,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ProgrammaticRotationExample(),
                      ),
                    );
                  },
                  text: "Rotation Programmatic",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(context,
      {required String text, required VoidCallback onPressed}) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
      ),
    );
  }
}
