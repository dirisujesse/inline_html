import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inline_html/inline_html.dart';

class GenericListener<T> extends StatelessWidget {
  final ValueBuilder<T> builder;
  final ValueListenable<T> valueListenable;

  const GenericListener({
    super.key,
    required this.valueListenable,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T>(
      valueListenable: valueListenable,
      builder: (context, activeOption, _) => builder(activeOption),
    );
  }
}
