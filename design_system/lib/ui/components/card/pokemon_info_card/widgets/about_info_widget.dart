import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AboutInfoWidget extends StatelessWidget {
  const AboutInfoWidget(
      {super.key, required this.title, required this.value, required this.isMobile});
  final String title;
  final String value;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: isMobile
              ? AppTextStylesMobile.extraBold14px.copyWith(color: AppColors.fakeBlack)
              : AppTextStylesDesktop.bold16px.copyWith(color: AppColors.fakeBlack),
        ),
        Text(
          value,
          style: isMobile
              ? AppTextStylesMobile.regular14px.copyWith(color: AppColors.fakeBlack)
              : AppTextStylesDesktop.regular16px.copyWith(color: AppColors.fakeBlack),
        ),
      ],
    );
  }
}
