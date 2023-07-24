import 'package:design_system/consts/icons/app_icons.dart';
import 'package:design_system/consts/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/package_utils.dart';

const double mainAppbarPadding = 28;

class MainSliverAppBar extends SliverAppBar {
  final bool isMobile;
  MainSliverAppBar({
    required this.isMobile,
    super.key,
    double height = kToolbarHeight + mainAppbarPadding,
    required BuildContext context,
  }) : super(
          centerTitle: true,
          expandedHeight: height,
          floating: false,
          pinned: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            if (isMobile)
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SvgPicture.asset(
                  AppIcons.gear,
                  package: PackageUtils.pakcageImportName,
                  width: 30,
                  height: 30,
                ),
              ),
          ],
          leading: isMobile
              ? Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SvgPicture.asset(
                    AppIcons.bell,
                    package: PackageUtils.pakcageImportName,
                    width: 20,
                    height: 20,
                  ),
                )
              : null,
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final safeAreaTop = MediaQuery.of(context).padding.top;
              final minHeight = safeAreaTop + kToolbarHeight;
              final maxHeight = height + safeAreaTop;
              final percent = (constraints.maxHeight - minHeight) / (maxHeight - minHeight);
              return Container(
                color: Colors.white.withOpacity(0.8 - percent * 0.8),
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Transform.translate(
                          offset: Offset(0, constraints.maxHeight - kToolbarHeight - 33),
                          child: Image.asset(
                            AppImages.logoPokemon,
                            package: PackageUtils.pakcageImportName,
                            width: 170,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
}
