import 'package:flutter/material.dart';

import '../../../../../design_system.dart';
import '../widgets/stat_widget.dart';

class PokemonBaseStats extends StatefulWidget {
  const PokemonBaseStats({super.key, required this.listValue, required this.isMobile});
  final List<int> listValue;
  final bool isMobile;

  @override
  State<PokemonBaseStats> createState() => PokemonBaseStatsState();
}

class PokemonBaseStatsState extends State<PokemonBaseStats> with SingleTickerProviderStateMixin {
  late Animation<double> _progressAnimation;
  late AnimationController _progressController;
  AnimationController get slideController => InfoStateProvider.of(context).slideController;
  @override
  void initState() {
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _progressController,
    ));

    _progressController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _progressController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int totalValue = 0;
    for (var element in widget.listValue) {
      totalValue += element;
    }
    return AnimatedBuilder(
      animation: slideController,
      builder: (context, child) {
        final scrollable = slideController.value.floor() == 1;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          physics:
              scrollable ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
          child: child,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StatWidget(
                animation: _progressAnimation,
                label: 'Hp',
                value: widget.listValue[0],
                isMobile: widget.isMobile),
            const SizedBox(height: 14),
            StatWidget(
                animation: _progressAnimation,
                label: 'Atttack',
                value: widget.listValue[1],
                isMobile: widget.isMobile),
            const SizedBox(height: 14),
            StatWidget(
                animation: _progressAnimation,
                label: 'Defense',
                value: widget.listValue[2],
                isMobile: widget.isMobile),
            const SizedBox(height: 14),
            StatWidget(
                animation: _progressAnimation,
                label: 'Sp. Atk',
                value: widget.listValue[3],
                isMobile: widget.isMobile),
            const SizedBox(height: 14),
            StatWidget(
                animation: _progressAnimation,
                label: 'Sp. Def',
                value: widget.listValue[4],
                isMobile: widget.isMobile),
            const SizedBox(height: 14),
            StatWidget(
                animation: _progressAnimation,
                label: 'Speed',
                value: widget.listValue[5],
                isMobile: widget.isMobile),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    "Total",
                    style: widget.isMobile
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
                    "$totalValue",
                    textAlign: TextAlign.right,
                    style: widget.isMobile
                        ? AppTextStylesMobile.medium14px.copyWith(
                            color: AppColors.fakeBlack,
                          )
                        : AppTextStylesDesktop.extraBold14px.copyWith(
                            color: AppColors.fakeBlack,
                          ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Container(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
