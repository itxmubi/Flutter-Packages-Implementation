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
              'This Text is written in Adamina',
              style: GoogleFonts.adamina(),
            ),
            Text(
              'This Text is written in  abhayaLibre',
              style: GoogleFonts.abhayaLibre(),
            ),
            Text(
              'This Text is written in lilyScriptOne',
              style: GoogleFonts.lilyScriptOne(),
            ),
            Text(
              'This Text is written in bizUDGothic',
              style: GoogleFonts.bizUDGothic(),
            ),
            Text(
              'This Text is written in baskervville',
              style: GoogleFonts.baskervville(),
            ),
            Text(
              'This Text is written in sourceSansPro',
              style: GoogleFonts.sourceSansPro(),
            ),
            Text(
              'This Text is written in windSong',
              style: GoogleFonts.windSong(),
            ),
            Text(
              'This Text is written in gildaDisplay',
              style: GoogleFonts.gildaDisplay(),
            ),
            Text(
              'This Text is written in merriweatherSans',
              style: GoogleFonts.merriweatherSans(),
            ),
            Text(
              'This Text is written in libreBarcode39ExtendedText',
              style: GoogleFonts.libreBarcode39ExtendedText(),
            ),
            Text(
              'This Text is written in licorice',
              style: GoogleFonts.licorice(),
            ),
            Text(
              'This Text is written in lifeSavers',
              style: GoogleFonts.lifeSavers(),
            ),
            Text(
              'This Text is written in lobsterTwo',
              style: GoogleFonts.lobsterTwo(),
            ),
            Text(
              'This Text is written in lindenHill',
              style: GoogleFonts.lindenHill(),
            ),
            Text(
              'You have Pushed the Button $_counter times',
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
