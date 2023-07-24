import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_app/app/core/shared/ui/container/app_container.dart';

import 'domain/repositories/pokemon_repository_interface.dart';
import 'domain/usecases/add_favorite_usecase.dart';
import 'domain/usecases/get_favorite_usecase.dart';
import 'domain/usecases/get_list_pokemons.dart';
import 'external/datasources/pokemon_datadource.dart';
import 'infra/datasource/pokemon_datasource_interface.dart';
import 'infra/repositories/pokemon_repository.dart';

class PokedexModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<IGetListPokemons>((i) => GetListPokemonsUseCase(i()), export: true),
    Bind.singleton<IGetFavoriteUseCase>((i) => GetFavoriteUseCase(i()), export: true),
    Bind.singleton<IAddFavoriteUseCase>((i) => AddFavoriteUseCase(i()), export: true),
    Bind.singleton<IPokemonRepository>((i) => PokemonRepository(datasource: i()), export: true),
    Bind.singleton<IPokemonDatasource>((i) => PokemonDatasource(i(), i()), export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/app", child: (_, __) => const AppContainer()),
  ];
}
