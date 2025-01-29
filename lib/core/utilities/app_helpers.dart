import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:flutter/widgets.dart';
import 'package:inline_html/inline_html.dart';

class AppHelpers {
  static bool get randomBool {
    final list = [true, false];
    list.shuffle();
    return list.first;
  }

  static _parseAndDecode(String response) {
    return jsonDecode(response);
  }

  static parseJson(String text) {
    if (text.codeUnits.length < 50 * 1024) return _parseAndDecode(text);
    return compute(_parseAndDecode, text);
  }

  static String _parseAndEncode(Object data) {
    return jsonEncode(data);
  }

  static FutureOr<String> encodeJson(Object data) {
    if ("$data".codeUnits.length < 50 * 1024) return _parseAndEncode(data);
    return compute(_parseAndEncode, data);
  }

  static double fileSizeInMb(File file) {
    final bytes = file.lengthSync();
    return bytes / 1048576;
  }

  static Future<bool> hasConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.tryFirst?.rawAddress.isNotEmpty ?? false;
    } catch (_) {
      return false;
    }
  }

  static num? extractAmount(String? amount) {
    if (!amount.hasValue) return null;

    final pattern = RegExp(r"(\$|£|€)");
    final val =
        (amount!.startsWith(pattern) ? amount.substring(1) : amount).trim();
    final number = num.tryParse(val.replaceAll(RegExp(r'[^0-9\.]'), "").trim());
    return number;
  }

  static updateValue(
    String char,
    TextEditingController controller, {
    required int limit,
  }) {
    String value = controller.text;

    if (char.lower == 'x') {
      final currentText = value;
      if (currentText.isEmpty) return;
      if (currentText.length == 1) value = '';
      value = currentText.substring(0, currentText.length - 1);
      controller.text = value;
      return;
    }

    if (value.length >= limit) return;

    value += char;
    controller.text = value;
  }

  static String? getInitials(String? name) {
    if (!name.hasValue) return null;

    final names = name!.trim().split(" ");

    if (names.length == 1) {
      final part = names.first;
      return (part.length > 1 ? "${part[0]}${part[1]}" : part[0]).upper;
    }

    final head = names.first[0];
    final tail = names.last[0];

    return "$head$tail".upper;
  }

  static String? getAccronym(String? name) {
    try {
      if (!name.hasValue) return null;

      final names = name!.trim().split(" ");

      final initials =
          names.whereList((it) => it.hasValue).mapList((it) => it[0].upper);

      return initials.join("");
    } catch (_) {
      return null;
    }
  }

  static Stream<int> countDown([int seconds = 59]) async* {
    int i = seconds;
    while (i >= 0) {
      yield i--;
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}
