import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../animated/animated_fade.dart';

class DottedDecoration extends StatelessWidget {
  static const Size size = Size(57, 31);

  final Animation<double> animation;

  const DottedDecoration({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedFade(
      animation: animation,
      child: Image.asset(
        AppImages.dotted,
        package: PackageUtils.pakcageImportName,
        width: size.width,
        height: size.height,
        color: Colors.white30,
      ),
    );
  }
}
