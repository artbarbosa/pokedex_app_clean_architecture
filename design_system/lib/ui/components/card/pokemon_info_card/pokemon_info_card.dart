import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../auto_slideup_panel.dart';
import '../../tab/custom_tab_view.dart';
import 'components/pokemon_about_component.dart';
import 'components/pokemon_base_states.dart';

class PokemonInfoCard extends StatefulWidget {
  static const double minCardHeightFraction = 0.54;
  final String flavorText;
  final int height;
  final int weight;
  final String genus;
  final String gender;
  final bool isMobile;
  final String abilityName;
  final List<int> baseStat;

  const PokemonInfoCard({
    super.key,
    required this.flavorText,
    required this.height,
    required this.weight,
    required this.genus,
    required this.abilityName,
    required this.baseStat,
    required this.gender,
    required this.isMobile,
  });

  @override
  State<PokemonInfoCard> createState() => PokemonInfoCardState();
}

class PokemonInfoCardState extends State<PokemonInfoCard> {
  AnimationController get slideController => InfoStateProvider.of(context).slideController;

  @override
  Widget build(BuildContext context) {
    final height = (widget.height) / 10;
    final weight = (widget.weight) / 10;

    return AutoSlideUpPanel(
        minHeight: 350,
        maxHeight: 350,
        onPanelSlide: (position) => slideController.value = position,
        child: CustomTabView(
          isMobile: widget.isMobile,
          tabs: [
            CustomTabData(
              label: 'About',
              child: Align(
                alignment: Alignment.topCenter,
                child: PokemonAbout(
                  isMobile: widget.isMobile,
                  description: widget.flavorText,
                  height: height.toStringAsFixed(1).replaceAll(".", ","),
                  weight: weight.toStringAsFixed(1).replaceAll(".", ","),
                  gender: widget.gender,
                  category: widget.genus,
                  ability: widget.abilityName,
                ),
              ),
            ),
            CustomTabData(
              label: 'Base Stats',
              child: PokemonBaseStats(
                isMobile: widget.isMobile,
                listValue: widget.baseStat,
              ),
            ),
            const CustomTabData(
              label: 'Evolution',
              child: Align(
                alignment: Alignment.topCenter,
                child: Text('Evolution'),
              ),
            ),
            const CustomTabData(
              label: 'Moves',
              child: Align(
                alignment: Alignment.topCenter,
                child: Text('Moves'),
              ),
            ),
          ],
        ));
  }
}
