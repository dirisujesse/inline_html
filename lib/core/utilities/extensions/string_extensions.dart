import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:inline_html/inline_html.dart';

extension StringExtension on String {
  Uint8List get encoded => utf8.encode(this);

  String get lower => toLowerCase();
  String get upper => toUpperCase();

  bool includes(String other) {
    return lower.contains(other.lower);
  }

  bool equals(String other) {
    return lower.trim() == other.lower.trim();
  }

  String concatenate(String other, {String concatenant = ""}) {
    return "$this$concatenant$other";
  }

  String get lastChars {
    if (isEmpty) return "";
    if (length <= 4) return this[length - 1];
    return substring(length - 4);
  }

  String capitalise([bool onlyFirst = false]) {
    final text = this;
    try {
      if (text.isEmpty) {
        return text;
      } else if (text.length == 1) {
        return text.toUpperCase();
      } else if (text.length > 1 && onlyFirst) {
        final firstChar = text[0];
        return "${firstChar.toUpperCase()}${text.substring(1).toLowerCase()}";
      } else {
        final textSpan = text.split(" ").map((it) {
          if (it.isEmpty) {
            return it;
          }
          if (it.length == 1) {
            return it.toUpperCase();
          }
          final firstChar = it[0];
          return "${firstChar.toUpperCase()}${it.substring(1).toLowerCase()}";
        });
        return textSpan.join(" ");
      }
    } catch (_) {
      return this;
    }
  }

  bool matches(String other) {
    return lower == other.lower;
  }

  List<T> toList<T>({TransformCall<T>? transformer, Pattern splitBy = ","}) {
    try {
      final value = this;

      final values = value.split(splitBy).mapList((it) => it.trim());

      if (transformer == null) {
        final transormValues = switch (T) {
          const (int) => values.map((it) => (int.tryParse(it) ?? 0)),
          const (double) => values.map((it) => double.tryParse(it) ?? 0),
          const (bool) => values.map((it) => it == "true"),
          _ => values,
        };
        return [...transormValues].cast();
      }
      return values.mapList((it) => transformer(it));
    } catch (_) {
      return [].cast();
    }
  }
}

extension NullableStringExtension on String? {
  bool get hasValue {
    return this != null && (this ?? "").trim().isNotEmpty;
  }

  String get value => (this ?? "").trim();

  bool equals(String other) {
    if (this == null) return false;
    return this!.lower.trim() == other.lower.trim();
  }
}

String randomNumString() {
  return "${Random().nextInt(100000000)}";
}
