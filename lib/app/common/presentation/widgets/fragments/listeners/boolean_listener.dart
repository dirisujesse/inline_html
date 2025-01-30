import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inline_html/inline_html.dart';

class BoolListener extends StatelessWidget {
  final ValueBuilder<bool> builder;
  final ValueListenable<bool> valueListenable;

  const BoolListener({
    super.key,
    required this.valueListenable,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: valueListenable,
      builder: (context, activeOption, _) => builder(activeOption),
    );
  }
}
