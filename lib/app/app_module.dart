import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_app/app/core/shared/ui/container/app_container.dart';
import 'package:pokedex_app/app/modules/home/home_module.dart';

import 'core/core_module.dart';
import 'core/pokedex/pokedex_module.dart';
import 'modules/details/details_module.dart';
import 'modules/favorites/favorite_module.dart';
import 'modules/splash/presentation/ui/splash_page.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
        PokedexModule(),
        HomeModule(),
        FavoriteModule(),
        DetailsModule(),
      ];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const SplashPage()),
    ChildRoute("/app", child: (_, __) => const AppContainer()),
  ];
}
