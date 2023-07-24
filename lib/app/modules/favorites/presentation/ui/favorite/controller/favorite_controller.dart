import 'package:flutter/material.dart';

import '../../../../../../core/pokedex/domain/entities/pokemon_entity.dart';
import '../../../../../../core/pokedex/domain/usecases/add_favorite_usecase.dart';
import '../../../../../../core/pokedex/domain/usecases/get_favorite_usecase.dart';
import '../../../../../../core/pokedex/infra/models/pokemon_model.dart';
import '../states/favorite_states.dart';

class FavoriteController extends ValueNotifier<FavoriteState> {
  final IAddFavoriteUseCase _addFavoriteUseCase;
  final IGetFavoriteUseCase _favoriteUseCase;

  FavoriteController(
    this._addFavoriteUseCase,
    this._favoriteUseCase,
  ) : super(FavoriteLoadingState());

  final listPokemons = ValueNotifier<List<PokemonModel>>([]);

  PokemonModel? selectedPokemon;

  Future<void> _getListPokemons() async {
    final list = await _favoriteUseCase.call() ?? [];
    listPokemons.value = list as List<PokemonModel>;
    listPokemons.notifyListeners();
  }

  Future<void> fetchListPokemons() async {
    await _getListPokemons();
    if (listPokemons.value.isNotEmpty) {
      value = FavoriteSuccessState(listPokemons: listPokemons.value);
    } else {
      value = FavoriteEmptyState();
    }
    notifyListeners();
  }

  Future<void> addOrRemoveFavorite(PokemonEntity pokemon) async {
    _addFavoriteUseCase.call(pokemon);
    await fetchListPokemons();
  }
}
