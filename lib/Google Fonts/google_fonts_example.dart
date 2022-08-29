import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleFontsExample extends StatefulWidget {
  const GoogleFontsExample({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  GoogleFontsExampleState createState() => GoogleFontsExampleState();
}

class GoogleFontsExampleState extends State<GoogleFontsExample> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      Fluttertoast.showToast(
          msg: "Counter is incremented to $_counter ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hi, Welcome to google_fonts package example',
              style: GoogleFonts.adamina(),
            ),
            Text(
              'Hi, Welcome to google_fonts package example',
              style: GoogleFonts.abhayaLibre(),
            ),
            Text(
              'Hi, Welcome to google_fonts package example',
              style: GoogleFonts.lilyScriptOne(),
            ),
            Text(
              'Hi, Welcome to google_fonts package example',
              style: GoogleFonts.bizUDGothic(),
            ),
            Text(
              'Hi, Welcome to google_fonts package example',
              style: GoogleFonts.baskervville(),
            ),
            Text(
              'Hi, Welcome to google_fonts package example',
              style: GoogleFonts.sourceSansPro(),
            ),
            Text(
              'Hi, Welcome to google_fonts package example',
              style: GoogleFonts.windSong(),
            ),
            Text(
              'Hi, Welcome to google_fonts package example',
              style: GoogleFonts.gildaDisplay(),
            ),
            Text(
              'Hi, Welcome to google_fonts package example',
              style: GoogleFonts.merriweatherSans(),
            ),
            Text(
              'You have pushed the button this many times:',
              style: GoogleFonts.alike(
                textStyle: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            Text(
              '$_counter',
              style: GoogleFonts.lato(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
