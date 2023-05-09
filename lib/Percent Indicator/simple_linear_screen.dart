import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SampleLinearPage extends StatefulWidget {
  const SampleLinearPage({super.key});

  @override
   createState() => _SampleLinearPageState();
}

class _SampleLinearPageState extends State<SampleLinearPage> {
  String state = 'Animation start';
  bool isRunning = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Linear Percent Indicators"),
        actions: [
          IconButton(
              icon: const Icon(Icons.stop),
              onPressed: () {
                setState(() {
                  isRunning = false;
                });
              })
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 50,
                  animation: isRunning,
                  lineHeight: 20.0,
                  animationDuration: 3000,
                  percent: 0.5,
                  animateFromLastPercent: true,
                  center: const Text("50.0%"),
                  progressColor: Colors.red,
                  widgetIndicator: const RotatedBox(
                      quarterTurns: 1,
                      child: Icon(Icons.airplanemode_active, size: 50)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 50,
                  lineHeight: 20.0,
                  animationDuration: 3000,
                  percent: 0.5,
                  animateFromLastPercent: true,
                  center: const Text("50.0%"),
                  linearGradient: const LinearGradient(
                    colors: <Color>[Color(0xffB07BE6), Color(0xff5BA2E0)],
                  ),
                  linearGradientBackgroundColor: const LinearGradient(
                    colors: <Color>[Color(0xffe5d6fa), Color(0xffc8dff8)],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: FittedBox(
                  child: LinearPercentIndicator(
                    width: 140.0,
                    fillColor: Colors.green,
                    linearGradient: const LinearGradient(
                      colors: [Colors.red, Colors.blue],
                    ),
                    lineHeight: 14.0,
                    percent: 0.7,
                    center: const Text(
                      "70.0%",
                      style: TextStyle(fontSize: 12.0),
                    ),
                    trailing: const Icon(Icons.mood),
                    barRadius: const Radius.circular(7),
                    backgroundColor: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: FittedBox(
                  child: LinearPercentIndicator(
                    width: 140.0,
                    fillColor: Colors.green,
                    lineHeight: 14.0,
                    percent: 0.5,
                    center: const Text(
                      "50.0%",
                      style: TextStyle(fontSize: 12.0),
                    ),
                    trailing: const Icon(Icons.mood),
                    barRadius: const Radius.circular(7),
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: FittedBox(
                  child: LinearPercentIndicator(
                    width: 140.0,
                    lineHeight: 40.0,
                    percent: 0.05,
                    center: const Text(
                      "5.0%",
                      style: TextStyle(fontSize: 12.0),
                    ),
                    barRadius: const Radius.circular(20),
                    backgroundColor: Colors.grey,
                    progressColor: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: LinearPercentIndicator(
                  animation: true,
                  animationDuration: 500,
                  lineHeight: 20.0,
                  leading: const Expanded(
                    child: Text("left content"),
                  ),
                  trailing: const Expanded(
                      child: Text(
                    "right content",
                    textAlign: TextAlign.end,
                  )),
                  percent: 0.2,
                  center: const Text("20.0%"),
                  progressColor: Colors.red,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 50,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2000,
                  percent: 0.9,
                  animateFromLastPercent: true,
                  center: const Text("90.0%"),
                  isRTL: true,
                  barRadius: const Radius.elliptical(5, 15),
                  progressColor: Colors.greenAccent,
                  maskFilter: const MaskFilter.blur(BlurStyle.solid, 3),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 50,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2500,
                  percent: 0.8,
                  center: const Text("80.0%"),
                  barRadius: const Radius.circular(5),
                  progressColor: Colors.green,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: LinearPercentIndicator(
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2500,
                  percent: 0.55,
                  center: const Text("55.0%"),
                  barRadius: const Radius.circular(3),
                  progressColor: Colors.green,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    LinearPercentIndicator(
                      width: 100.0,
                      lineHeight: 8.0,
                      percent: 0.2,
                      progressColor: Colors.red,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LinearPercentIndicator(
                      width: 100.0,
                      lineHeight: 8.0,
                      percent: 0.5,
                      progressColor: Colors.orange,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LinearPercentIndicator(
                      width: 100.0,
                      lineHeight: 8.0,
                      percent: 0.9,
                      progressColor: Colors.blue,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LinearPercentIndicator(
                      width: 100.0,
                      lineHeight: 8.0,
                      percent: 1.0,
                      progressColor: Colors.lightBlueAccent,
                      restartAnimation: true,
                      animation: true,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: LinearPercentIndicator(
                  lineHeight: 20,
                  center: const Text('50%'),
                  progressColor: Colors.blueAccent,
                  percent: .5,
                  animation: true,
                  animationDuration: 5000,
                  onAnimationEnd: () =>
                      setState(() => state = 'End Animation at 50%'),
                ),
              ),
              Text(state),
              Padding(
                padding: const EdgeInsets.all(15),
                child: LinearPercentIndicator(
                  lineHeight: 20,
                  center: const Text('50%'),
                  progressColor: Colors.pinkAccent,
                  barRadius: const Radius.circular(10),
                  percent: .5,
                  animation: true,
                  animationDuration: 1000,
                ),
              ),
              const Text('Rounded Edges'),
              Padding(
                padding: const EdgeInsets.all(15),
                child: LinearPercentIndicator(
                  lineHeight: 20,
                  center: const Text('60%'),
                  progressColor: Colors.purple,
                  barRadius: const Radius.circular(5),
                  percent: .6,
                  animation: true,
                  animationDuration: 1200,
                ),
              ),
              const Text('Soft Corner Edges'),
              Padding(
                padding: const EdgeInsets.all(15),
                child: LinearPercentIndicator(
                  lineHeight: 20,
                  center: const Text('70%'),
                  progressColor: Colors.deepPurple,
                  barRadius: const Radius.elliptical(5, 10),
                  percent: .7,
                  animation: true,
                  animationDuration: 1400,
                ),
              ),
              const Text('Custom Edges'),
            ],
          ),
        ),
      ),
    );
  }
}
