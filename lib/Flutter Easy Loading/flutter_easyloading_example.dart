import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import './custom_animation.dart';
import './test.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class FlutterEasyLoading extends StatefulWidget {
  const FlutterEasyLoading({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _FlutterEasyLoadingState createState() => _FlutterEasyLoadingState();
}

class _FlutterEasyLoadingState extends State<FlutterEasyLoading> {
  Timer? _timer;
  late double _progress;

  @override
  void initState() {
    configLoading();
    super.initState();
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    EasyLoading.showSuccess('Use in initState');
    // EasyLoading.removeCallbacks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const TextField(),
              Wrap(
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  TextButton(
                    child: const Text('open test page'),
                    onPressed: () {
                      _timer?.cancel();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => TestPage(),
                        ),
                      );
                    },
                  ),
                  TextButton(
                    child: const Text('dismiss'),
                    onPressed: () async {
                      _timer?.cancel();
                      await EasyLoading.dismiss();
                      print('EasyLoading dismiss');
                    },
                  ),
                  TextButton(
                    child: const Text('show'),
                    onPressed: () async {
                      _timer?.cancel();
                      await EasyLoading.show(
                        status: 'loading...',
                        maskType: EasyLoadingMaskType.black,
                      );
                      print('EasyLoading show');
                    },
                  ),
                  TextButton(
                    child: const Text('showToast'),
                    onPressed: () {
                      _timer?.cancel();
                      EasyLoading.showToast(
                        'Toast',
                      );
                    },
                  ),
                  TextButton(
                    child: const Text('showSuccess'),
                    onPressed: () async {
                      _timer?.cancel();
                      await EasyLoading.showSuccess('Great Success!');
                      print('EasyLoading showSuccess');
                    },
                  ),
                  TextButton(
                    child: const Text('showError'),
                    onPressed: () {
                      _timer?.cancel();
                      EasyLoading.showError('Failed with Error');
                    },
                  ),
                  TextButton(
                    child: const Text('showInfo'),
                    onPressed: () {
                      _timer?.cancel();
                      EasyLoading.showInfo('Useful Information.');
                    },
                  ),
                  TextButton(
                    child: const Text('showProgress'),
                    onPressed: () {
                      _progress = 0;
                      _timer?.cancel();
                      _timer = Timer.periodic(const Duration(milliseconds: 100),
                          (Timer timer) {
                        EasyLoading.showProgress(_progress,
                            status: '${(_progress * 100).toStringAsFixed(0)}%');
                        _progress += 0.03;

                        if (_progress >= 1) {
                          _timer?.cancel();
                          EasyLoading.dismiss();
                        }
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: <Widget>[
                    const Text('Style'),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: CupertinoSegmentedControl<EasyLoadingStyle>(
                        selectedColor: Colors.blue,
                        children: const {
                          EasyLoadingStyle.dark: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('dark'),
                          ),
                          EasyLoadingStyle.light: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('light'),
                          ),
                          EasyLoadingStyle.custom: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('custom'),
                          ),
                        },
                        onValueChanged: (value) {
                          EasyLoading.instance.loadingStyle = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: <Widget>[
                    const Text('MaskType'),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: CupertinoSegmentedControl<EasyLoadingMaskType>(
                        selectedColor: Colors.blue,
                        children: const {
                          EasyLoadingMaskType.none: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('none'),
                          ),
                          EasyLoadingMaskType.clear: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('clear'),
                          ),
                          EasyLoadingMaskType.black: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('black'),
                          ),
                          EasyLoadingMaskType.custom: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('custom'),
                          ),
                        },
                        onValueChanged: (value) {
                          EasyLoading.instance.maskType = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: <Widget>[
                    const Text('Toast Positon'),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child:
                          CupertinoSegmentedControl<EasyLoadingToastPosition>(
                        selectedColor: Colors.blue,
                        children: const {
                          EasyLoadingToastPosition.top: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('top'),
                          ),
                          EasyLoadingToastPosition.center: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('center'),
                          ),
                          EasyLoadingToastPosition.bottom: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('bottom'),
                          ),
                        },
                        onValueChanged: (value) {
                          EasyLoading.instance.toastPosition = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: <Widget>[
                    const Text('Animation Style'),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child:
                          CupertinoSegmentedControl<EasyLoadingAnimationStyle>(
                        selectedColor: Colors.blue,
                        children: const {
                          EasyLoadingAnimationStyle.opacity: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('opacity'),
                          ),
                          EasyLoadingAnimationStyle.offset: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('offset'),
                          ),
                          EasyLoadingAnimationStyle.scale: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('scale'),
                          ),
                          EasyLoadingAnimationStyle.custom: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('custom'),
                          ),
                        },
                        onValueChanged: (value) {
                          EasyLoading.instance.animationStyle = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 50.0,
                ),
                child: Column(
                  children: <Widget>[
                    const Text('IndicatorType(total: 23)'),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child:
                          CupertinoSegmentedControl<EasyLoadingIndicatorType>(
                        selectedColor: Colors.blue,
                        children: const {
                          EasyLoadingIndicatorType.circle: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('circle'),
                          ),
                          EasyLoadingIndicatorType.wave: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('wave'),
                          ),
                          EasyLoadingIndicatorType.ring: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('ring'),
                          ),
                          EasyLoadingIndicatorType.pulse: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('pulse'),
                          ),
                          EasyLoadingIndicatorType.cubeGrid: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('cubeGrid'),
                          ),
                          EasyLoadingIndicatorType.threeBounce: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('threeBounce'),
                          ),
                        },
                        onValueChanged: (value) {
                          EasyLoading.instance.indicatorType = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
