import 'package:flutter/material.dart';
import 'package:inline_html/inline_html.dart';

extension TextCtrlExtension on TextEditingController {
  String? get textValue => !hasValue ? null : text;

  bool get hasValue => text.hasValue;
}

extension NotifierExtension on ValueNotifier {
  bool get hasValue => value != null;
}
