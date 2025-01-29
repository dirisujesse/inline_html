import 'dart:developer';

import 'package:flutter/foundation.dart';

class AppLogger {
  static info(dynamic data) {
    if (kDebugMode) {
      log(
        "MESSAGE -> \x1B[32m$data\x1B[0m",
        time: _now,
        name: "DAY_1<>INFO",
        level: 1,
      );
    }
  }

  static DateTime get _now => DateTime.now();

  static severe(dynamic message, {StackTrace? stackTrace, Object? error}) {
    log(
      "ERROR -> \x1B[31m$message\x1B[0m",
      time: _now,
      stackTrace: stackTrace,
      error: error,
      name: "DAY_1<>ERROR",
      level: 2,
    );
  }
}
