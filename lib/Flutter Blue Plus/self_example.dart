// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';

// class BluetoothSelfExample extends StatefulWidget {
//   const BluetoothSelfExample({super.key});

//   @override
//   State<BluetoothSelfExample> createState() => _BluetoothSelfExampleState();
// }

// class _BluetoothSelfExampleState extends State<BluetoothSelfExample> {
//   FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

//   scanDevices() async {
//     // Start scanning
//     flutterBlue.startScan(timeout: const Duration(seconds: 15));

// // Listen to scan results
//     var subscription = flutterBlue.scanResults.listen((results) {
//       // do something with scan results
//       log("<><>$results");
//       for (ScanResult r in results) {
//         log('${r.device.name} found! rssi: ${r.rssi}');
//       }
//     });

// // Stop scanning
//     // flutterBlue.stopScan();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Bluetooth Testing ")),
//       body: Column(children: [
//         const Text("Description here"),
//         StreamBuilder<BluetoothState>(
//             stream: FlutterBluePlus.instance.state,
//             initialData: BluetoothState.unknown,
//             builder: (c, snapshot) {
//               final state = snapshot.data;
//               if (state == BluetoothState.on) {
//                 return const Text("Bluetooth is Onnnn");
//               }
//               return const Text("Bluetooth is OFFFF");
//             }),
//         ElevatedButton(
//             onPressed: () {
//               scanDevices();
//             },
//             child: const Text("Scan Devices")),
//         // StreamBuilder<List<ScanResult>>(
//         //   stream: FlutterBluePlus.instance.scanResults,
//         //   initialData: const [],
//         //   builder: (c, snapshot) => Column(
//         //     children: snapshot.data!
//         //         .map(
//         //           (r) => ScanResultTile(
//         //             result: r,
//         //             onTap: () => Navigator.of(context)
//         //                 .push(MaterialPageRoute(builder: (context) {
//         //               r.device.connect();
//         //               return DeviceScreen(device: r.device);
//         //             })),
//         //           ),
//         //         )
//         //         .toList(),
//         //   ),
//         // ),
//       ]),
//     );
//   }
// }
