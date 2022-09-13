import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ShowCase extends StatelessWidget {
  const ShowCase({Key? key}) : super(key: key);

  static const kits = <Widget>[
    SpinKitRotatingCircle(color: Colors.blue),
    SpinKitRotatingPlain(color: Colors.red),
    SpinKitChasingDots(color: Colors.yellow),
    SpinKitPumpingHeart(color: Colors.purple),
    SpinKitPulse(color: Colors.green),
    SpinKitDoubleBounce(color: Colors.orange),
    SpinKitWave(color: Colors.brown, type: SpinKitWaveType.start),
    SpinKitWave(color: Colors.blueGrey, type: SpinKitWaveType.center),
    SpinKitWave(color: Colors.deepPurple, type: SpinKitWaveType.end),
    SpinKitPianoWave(color: Colors.pink, type: SpinKitPianoWaveType.start),
    SpinKitPianoWave(color: Colors.amber, type: SpinKitPianoWaveType.center),
    SpinKitPianoWave(color: Colors.indigo, type: SpinKitPianoWaveType.end),
    SpinKitThreeBounce(color: Colors.lime),
    SpinKitThreeInOut(color: Colors.blue),
    SpinKitWanderingCubes(color: Colors.teal),
    SpinKitWanderingCubes(color: Colors.deepPurple, shape: BoxShape.circle),
    SpinKitCircle(color: Colors.deepOrange),
    SpinKitFadingFour(color: Colors.blue),
    SpinKitFadingFour(color: Colors.deepPurple, shape: BoxShape.rectangle),
    SpinKitFadingCube(color: Colors.purple),
    SpinKitCubeGrid(size: 51.0, color: Colors.pinkAccent),
    SpinKitFoldingCube(color: Colors.pink),
    SpinKitRing(color: Colors.blueGrey),
    SpinKitDualRing(color: Colors.grey),
    SpinKitSpinningLines(color: Colors.green),
    SpinKitFadingGrid(color: Colors.greenAccent),
    SpinKitFadingGrid(color: Colors.yellow, shape: BoxShape.rectangle),
    SpinKitSquareCircle(color: Colors.redAccent),
    SpinKitSpinningCircle(color: Colors.deepPurpleAccent),
    SpinKitSpinningCircle(
        color: Colors.deepOrangeAccent, shape: BoxShape.rectangle),
    SpinKitFadingCircle(color: Colors.deepPurple),
    SpinKitHourGlass(color: Colors.purple),
    SpinKitPouringHourGlass(color: Colors.blue),
    SpinKitPouringHourGlassRefined(color: Colors.brown),
    SpinKitRipple(color: Colors.red),
    SpinKitDancingSquare(color: Colors.black),
    // SpinKitWaveSpinner(color: Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text('SpinKit', style: TextStyle(fontSize: 24.0)),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: context.adaptiveCrossAxisCount,
          mainAxisSpacing: 46,
          childAspectRatio: 2,
        ),
        padding: const EdgeInsets.only(top: 32, bottom: 64),
        itemCount: kits.length,
        itemBuilder: (context, index) => kits[index],
      ),
    );
  }
}

extension on BuildContext {
  int get adaptiveCrossAxisCount {
    final width = MediaQuery.of(this).size.width;
    if (width > 1024) {
      return 8;
    } else if (width > 720 && width < 1024) {
      return 6;
    } else if (width > 480) {
      return 4;
    } else if (width > 320) {
      return 3;
    }
    return 1;
  }
}
