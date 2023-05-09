import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

class NFCFlutterKitExample extends StatefulWidget {
  const NFCFlutterKitExample({super.key});

  @override
  State<NFCFlutterKitExample> createState() => _NFCFlutterKitExampleState();
}

class _NFCFlutterKitExampleState extends State<NFCFlutterKitExample> {
  bool availability = false;

  checkavailability() async {
    final availabilityy = await FlutterNfcKit.nfcAvailability;

    if (availabilityy != NFCAvailability.available) {
      log("$availabilityy");
      setState(() {
        availability = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkavailability();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NFC Kit Flutter")),
      body: SafeArea(
        child: Column(children: [
          availability
              ? const Text("NFC is availableeeeeeeeeee")
              : const Text("Not Avaialableeeeeee"),
        ]),
      ),
    );
  }
}
