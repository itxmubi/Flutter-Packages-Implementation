// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class EdgeDetetionExample extends StatefulWidget {
//   const EdgeDetetionExample({super.key});

//   @override
//    createState() => _EdgeDetetionExampleState();
// }

// class _EdgeDetetionExampleState extends State<EdgeDetetionExample> {
//   String? _imagePath;

//   @override
//   void initState() {
//     super.initState();
//   }

//   Future<void> getImage() async {
//     String? imagePath;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     // We also handle the message potentially returning null.
//     try {
//       // imagePath = (await EdgeDetection.detectEdge);
//       print("$imagePath");
//     } on PlatformException catch (e) {
//       imagePath = e.toString();
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     setState(() {
//       _imagePath = imagePath;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Center(
//                 child: ElevatedButton(
//                   onPressed: getImage,
//                   child: const Text('Scan'),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Text('Cropped image path:'),
//               Padding(
//                 padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
//                 child: Text(
//                   _imagePath.toString(),
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(fontSize: 14),
//                 ),
//               ),
//               Visibility(
//                 visible: _imagePath != null,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Image.file(
//                     File(_imagePath ?? ''),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
