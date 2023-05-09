import 'package:flutter/foundation.dart';

class TimeLogger {
  TimeLogger([this.tag = '']);

  String tag;
  int? start;

  void startRecorder() {
    start = DateTime.now().millisecondsSinceEpoch;
  }

  void logTime() {
    if (start == null) {
      if (kDebugMode) {
        print('The start is null, you must start recorder first.');
      }
      return;
    }
    final diff = DateTime.now().millisecondsSinceEpoch - start!;
    if (tag != '') {
      if (kDebugMode) {
        print('$tag : $diff ms');
      }
    } else {
      if (kDebugMode) {
        print('run time $diff ms');
      }
    }
  }
}
