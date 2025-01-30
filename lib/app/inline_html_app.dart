import 'package:flutter/material.dart';
import 'package:inline_html/inline_html.dart';

class InlineHtmlApp extends StatelessWidget {
  const InlineHtmlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Inline HTML App', home: const HomeScreen());
  }
}
