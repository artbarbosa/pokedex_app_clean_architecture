import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../modules/favorites/presentation/ui/favorite/pages/favorite_page.dart';
import '../../../../modules/home/presentation/ui/home/pages/home_page.dart';
import '../controllers/custom_navigation_controller.dart';

class AppContainer extends StatefulWidget {
  const AppContainer({Key? key}) : super(key: key);

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  final controllerBottomNavigation = Modular.get<CustomNavigationController>();
  @override
  Widget build(BuildContext context) {
    controllerBottomNavigation.pageController?.addListener(() {
      setState(() {});
    });

    final currentSize = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: CustomPageView(
          pageController: controllerBottomNavigation.pageController,
          children: const [
            HomePage(),
            FavoritePage(),
            Scaffold(
              body: Center(
                child: Text("Perfil"),
              ),
            )
          ],
        ),
        bottomNavigationBar: currentSize.width < 600
            ? ValueListenableBuilder<int>(
                valueListenable: controllerBottomNavigation,
                builder: (context, value, _) {
                  return CustomBottomNavigationBar(
                    currentIndex: value,
                    onTap: (value) {
                      controllerBottomNavigation.changePage(value);
                    },
                  );
                },
              )
            : null,
      ),
    );
  }
}
