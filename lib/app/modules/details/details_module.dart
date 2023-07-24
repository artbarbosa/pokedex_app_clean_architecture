import 'package:flutter_modular/flutter_modular.dart';

import '../../core/pokedex/infra/models/pokemon_model.dart';
import 'presentation/ui/detail/controller/detail_controller.dart';
import 'presentation/ui/detail/pages/detail_page.dart';

class DetailsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<DetailController>((i) => DetailController(i()), export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/pokemon",
      child: (context, arguments) => DetailPage(pokemonModel: arguments.data as PokemonModel?),
      transition: TransitionType.downToUp,
    ),
  ];
}
