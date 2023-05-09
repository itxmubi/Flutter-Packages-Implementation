import 'package:flutter/material.dart';
import 'package:flutter_packages_implementation/Shimmer/slide_to_unlock_screen.dart';

import 'loading_list_screen.dart';

class ShimmerExample extends StatefulWidget {
  const ShimmerExample({super.key});

  @override
  createState() => _ShimmerExampleState();
}

class _ShimmerExampleState extends State<ShimmerExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shimmer'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
              title: const Text('Loading List'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoadingListPage()));
              }),
          ListTile(
            title: const Text('Slide To Unlock'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SlideToUnlockPage()));
            },
          )
        ],
      ),
    );
  }
}
