import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../widgets/about_info_widget.dart';

class PokemonAbout extends StatelessWidget {
  const PokemonAbout({
    super.key,
    required this.description,
    required this.height,
    required this.weight,
    required this.gender,
    required this.category,
    required this.ability,
    required this.isMobile,
  });
  final bool isMobile;
  final String description;
  final String height;
  final String weight;
  final String gender;
  final String ability;
  final String category;

  @override
  Widget build(BuildContext context) {
    final slideController = InfoStateProvider.of(context).slideController;

    return AnimatedBuilder(
      animation: slideController,
      builder: (context, child) {
        final scrollable = slideController.value.floor() == 1;

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 27),
          physics:
              scrollable ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
          child: child,
        );
      },
      child: Column(
        children: [
          Text(
            description.replaceAll("\f", "").replaceAll("\n", ""),
            style: isMobile
                ? AppTextStylesMobile.regular16px.copyWith(
                    color: AppColors.fakeBlack,
                  )
                : AppTextStylesDesktop.regular18px.copyWith(
                    color: AppColors.fakeBlack,
                  ),
          ),
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AboutInfoWidget(
                    isMobile: isMobile,
                    title: "Height",
                    value: height,
                  ),
                  const SizedBox(height: 20),
                  AboutInfoWidget(
                    isMobile: isMobile,
                    title: "Category",
                    value: category,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AboutInfoWidget(
                    isMobile: isMobile,
                    title: "Weight",
                    value: weight,
                  ),
                  const SizedBox(height: 20),
                  AboutInfoWidget(
                    isMobile: isMobile,
                    title: "Ability",
                    value: ability,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AboutInfoWidget(
                    isMobile: isMobile,
                    title: "Gender",
                    value: gender,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
