import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inline_html/inline_html.dart';

class StringListener extends StatelessWidget {
  final ValueBuilder<String?> builder;
  final ValueListenable<String?> valueListenable;

  const StringListener({
    super.key,
    required this.valueListenable,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: valueListenable,
      builder: (context, activeOption, _) => builder(activeOption),
    );
  }
}
