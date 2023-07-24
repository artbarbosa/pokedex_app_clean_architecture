import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AppUtils {
  static Color getColorType({required String type}) {
    switch (type) {
      case 'Normal':
        return AppColors.normal;
      case 'Fire':
        return AppColors.fire;
      case 'Water':
        return AppColors.water;
      case 'Grass':
        return AppColors.grass;
      case 'Electric':
        return AppColors.eletric;
      case 'Ice':
        return AppColors.water;
      case 'Fighting':
        return AppColors.fighting;
      case 'Poison':
        return AppColors.poison;
      case 'Ground':
        return AppColors.ground;
      case 'Flying':
        return AppColors.normal;
      case 'Psychic':
        return AppColors.psychic;
      case 'Bug':
        return AppColors.bug;
      case 'Rock':
        return AppColors.rock;
      case 'Ghost':
        return AppColors.ghost;
      case 'Dark':
        return AppColors.dark;
      case 'Dragon':
        return AppColors.dragon;
      case 'Steel':
        return AppColors.steel;
      case 'Fairy':
        return AppColors.fairy;
      default:
        return AppColors.normal;
    }
  }

  static String getIconType({required String type}) {
    switch (type) {
      case 'Normal':
        return AppIcons.normal;
      case 'Fire':
        return AppIcons.fire;
      case 'Water':
        return AppIcons.water;
      case 'Grass':
        return AppIcons.grass;
      case 'Electric':
        return AppIcons.eletric;
      case 'Ice':
        return AppIcons.ice;
      case 'Fighting':
        return AppIcons.fighting;
      case 'Poison':
        return AppIcons.poison;
      case 'Ground':
        return AppIcons.ground;
      case 'Flying':
        return AppIcons.flying;
      case 'Psychic':
        return AppIcons.psychic;
      case 'Bug':
        return AppIcons.bug;
      case 'Rock':
        return AppIcons.rock;
      case 'Ghost':
        return AppIcons.ghost;
      case 'Dark':
        return AppIcons.dark;
      case 'Dragon':
        return AppIcons.dragon;
      case 'Steel':
        return AppIcons.steel;
      case 'Fairy':
        return AppIcons.fairy;
      default:
        return AppIcons.normal;
    }
  }
}
