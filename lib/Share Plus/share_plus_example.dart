
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

// import 'image_previews.dart';


class SharePlusExample extends StatefulWidget {
  const SharePlusExample({Key? key}) : super(key: key);

  @override
  SharePlusExampleState createState() => SharePlusExampleState();
}

class SharePlusExampleState extends State<SharePlusExample> {
  String text = '';
  String subject = '';
  List<String> imagePaths = [];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            title: const Text('Share Plus Plugin Demo'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Share text:',
                      hintText: 'Enter some text and/or link to share',
                    ),
                    maxLines: 2,
                    onChanged: (String value) => setState(() {
                      text = value;
                    }),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Share subject:',
                      hintText: 'Enter subject to share (optional)',
                    ),
                    maxLines: 2,
                    onChanged: (String value) => setState(() {
                      subject = value;
                    }),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  // ImagePreviews(imagePaths, onDelete: _onDeleteImage),
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add image'),
                    onTap: () async {
                      // final imagePicker = ImagePicker();
                      // final pickedFile = await imagePicker.pickImage(
                      //   source: ImageSource.gallery,
                      // );
                      // if (pickedFile != null) {
                      //   setState(() {
                      //     imagePaths.add(pickedFile.path);
                      //   });
                      // }
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        onPressed: text.isEmpty && imagePaths.isEmpty
                            ? null
                            : () => _onShare(context),
                        child: const Text('Share'),
                      );
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        onPressed: text.isEmpty && imagePaths.isEmpty
                            ? null
                            : () => _onShareWithResult(context),
                        child: const Text('Share With Result'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ));
    
  }

  void _onDeleteImage(int position) {
    setState(() {
      imagePaths.removeAt(position);
    });
  }

  void _onShare(BuildContext context) async {

    final box = context.findRenderObject() as RenderBox?;

    if (imagePaths.isNotEmpty) {
      await Share.shareFiles(imagePaths,
          text: text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    }
  }

  void _onShareWithResult(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    ShareResult result;
    if (imagePaths.isNotEmpty) {
      result = await Share.shareFilesWithResult(imagePaths,
          text: text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    } else {
      result = await Share.shareWithResult(text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Share result: ${result.status}"),
    ));
  }
}