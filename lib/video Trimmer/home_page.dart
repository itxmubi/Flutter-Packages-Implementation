import 'dart:io';

import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';

import 'trimmer_view.dart';

class TrimmerViewExample extends StatelessWidget {
  const TrimmerViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Trimmer"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("LOAD VIDEO"),
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              type: FileType.video,
            );
            if (result != null) {
              File file = File(result.files.single.path!);
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return TrimmerView(file);
                }),
              );
            }
          },
        ),
      ),
    );
  }
}