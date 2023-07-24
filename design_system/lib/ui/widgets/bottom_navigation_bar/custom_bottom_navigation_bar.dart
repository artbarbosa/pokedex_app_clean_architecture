import 'package:design_system/consts/icons/app_icons.dart';
import 'package:design_system/utils/package_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    Key? key,
    this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;
  final Function(int)? onTap;

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      child: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: widget.onTap,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              widget.currentIndex == 0 ? AppIcons.homeSelectedMobile : AppIcons.homeMobile,
              package: PackageUtils.pakcageImportName,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              widget.currentIndex == 1
                  ? AppIcons.favoritesSelectedMobile
                  : AppIcons.favoritesMobile,
              package: PackageUtils.pakcageImportName,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              widget.currentIndex == 2 ? AppIcons.perfilSelectedMobile : AppIcons.perfilMobile,
              package: PackageUtils.pakcageImportName,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
