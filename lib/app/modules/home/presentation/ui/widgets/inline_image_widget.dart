import 'package:flutter/material.dart';

class InlineImageWidget extends StatelessWidget {
  final Widget child;

  const InlineImageWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
    );
  }
}
