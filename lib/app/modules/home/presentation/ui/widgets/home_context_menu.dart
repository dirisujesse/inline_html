import 'package:flutter/material.dart';
import 'package:inline_html/core/core.dart';

class HomeContextMenu extends StatelessWidget {
  final Widget child;
  final OnChanged<bool> onSelect;
  final OnChanged<bool> onPresented;

  const HomeContextMenu({
    required this.child,
    required this.onSelect,
    required this.onPresented,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return PopupMenuButton<bool>(
      shadowColor: Colors.black,
      position: PopupMenuPosition.over,
      popUpAnimationStyle: AnimationStyle(
        curve: Curves.bounceIn,
        reverseCurve: Curves.bounceInOut,
      ),
      offset: Offset(0, -(size.height * .1)),
      onOpened: () => onPresented(true),
      onCanceled: () => onPresented(false),
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: true,
            child: Text("Enter fullscreen"),
          ),
          const PopupMenuItem(
            value: false,
            child: Text("Exit fullscreen"),
          ),
        ];
      },
      onSelected: onSelect,
      child: IgnorePointer(
        child: child,
      ),
    );
  }
}
