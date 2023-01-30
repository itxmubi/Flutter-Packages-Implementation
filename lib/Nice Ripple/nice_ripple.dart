import 'package:flutter/material.dart';
import 'package:nice_ripple/nice_ripple.dart';



class NiceRippleExample extends StatefulWidget {
  const NiceRippleExample({Key? key}) : super(key: key);

  @override
  State<NiceRippleExample> createState() => _NiceRippleExampleState();
}

class _NiceRippleExampleState extends State<NiceRippleExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NiceRipple(
        rippleColor: Colors.red,
        radius: 100,
        rippleShape: BoxShape.circle,
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOut,
        onTap: () {
          // your code here
        },
      ),
    );
  }
}