import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
  const FlutterEasyLoading({super.key, this.title});

  final String? title;

  @override
  createState() => _FlutterEasyLoadingState();
}

class _FlutterEasyLoadingState extends State<FlutterEasyLoading> {
  Timer? _timer;
  late double _progress;

  @override
  void initState() {
    configLoading();
    super.initState();
    EasyLoading.addStatusCallback((status) {
      if (kDebugMode) {
        print('EasyLoading Status $status');
      }
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
                          builder: (BuildContext context) => const TestPage(),
                        ),
                      );
                    },
                  ),
                  TextButton(
                    child: const Text('dismiss'),
                    onPressed: () async {
                      _timer?.cancel();
                      await EasyLoading.dismiss();
                      if (kDebugMode) {
                        print('EasyLoading dismiss');
                      }
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
                      if (kDebugMode) {
                        print('EasyLoading show');
                      }
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
                      if (kDebugMode) {
                        print('EasyLoading showSuccess');
                      }
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
                          EasyLoadingStyle.dark: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('dark'),
                          ),
                          EasyLoadingStyle.light: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('light'),
                          ),
                          EasyLoadingStyle.custom: Padding(
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
                          EasyLoadingMaskType.none: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('none'),
                          ),
                          EasyLoadingMaskType.clear: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('clear'),
                          ),
                          EasyLoadingMaskType.black: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('black'),
                          ),
                          EasyLoadingMaskType.custom: Padding(
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
                          EasyLoadingToastPosition.top: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('top'),
                          ),
                          EasyLoadingToastPosition.center: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('center'),
                          ),
                          EasyLoadingToastPosition.bottom: Padding(
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
                          EasyLoadingAnimationStyle.opacity: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('opacity'),
                          ),
                          EasyLoadingAnimationStyle.offset: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('offset'),
                          ),
                          EasyLoadingAnimationStyle.scale: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('scale'),
                          ),
                          EasyLoadingAnimationStyle.custom: Padding(
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
                          EasyLoadingIndicatorType.circle: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('circle'),
                          ),
                          EasyLoadingIndicatorType.wave: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('wave'),
                          ),
                          EasyLoadingIndicatorType.ring: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('ring'),
                          ),
                          EasyLoadingIndicatorType.pulse: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('pulse'),
                          ),
                          EasyLoadingIndicatorType.cubeGrid: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('cubeGrid'),
                          ),
                          EasyLoadingIndicatorType.threeBounce: Padding(
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
