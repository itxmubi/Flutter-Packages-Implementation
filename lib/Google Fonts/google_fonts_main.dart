import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleFontsMain extends StatefulWidget {
  const GoogleFontsMain({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  GoogleFontsMainState createState() => GoogleFontsMainState();
}

class GoogleFontsMainState extends State<GoogleFontsMain> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
