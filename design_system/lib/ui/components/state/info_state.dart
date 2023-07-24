import 'package:flutter/material.dart';

class InfoStateProvider extends InheritedWidget {
  final AnimationController slideController;
  final AnimationController rotateController;

  const InfoStateProvider({
    super.key,
    required this.slideController,
    required this.rotateController,
    required Widget child,
  }) : super(child: child);

  static InfoStateProvider of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<InfoStateProvider>();

    return result!;
  }

  @override
  bool updateShouldNotify(covariant InfoStateProvider oldWidget) => false;
}
