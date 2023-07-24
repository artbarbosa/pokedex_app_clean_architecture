import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'custom_progress_bar_widget.dart';

class StatWidget extends StatelessWidget {
  final Animation animation;
  final String label;
  final double? progress;
  final num value;
  final bool isMobile;

  const StatWidget({
    super.key,
    required this.animation,
    required this.label,
    required this.value,
    this.progress,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(
            label,
            style: isMobile
                ? AppTextStylesMobile.extraBold14px.copyWith(
                    color: AppColors.fakeBlack,
                  )
                : AppTextStylesDesktop.extraBold14px.copyWith(
                    color: AppColors.fakeBlack,
                  ),
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            '$value',
            style: isMobile
                ? AppTextStylesMobile.medium14px.copyWith(
                    color: AppColors.fakeBlack,
                  )
                : AppTextStylesDesktop.extraBold14px.copyWith(
                    color: AppColors.fakeBlack,
                  ),
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
          flex: 20,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, widget) {
                final currentProgress = progress ?? value / 100;
                return ProgressBar(
                  progress: animation.value * currentProgress,
                  color: currentProgress < 0.5 ? AppColors.red : AppColors.primary,
                  enableAnimation: animation.value == 1,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
