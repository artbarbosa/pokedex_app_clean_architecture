import 'package:flutter/material.dart';
import 'package:pokedex_app/app/core/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/core/pokedex/domain/usecases/get_list_pokemons.dart';
import 'package:pokedex_app/app/core/pokedex/infra/models/pokemon_model.dart';
import 'package:pokedex_app/app/modules/home/presentation/ui/home/states/home_states.dart';

import '../../../../../../core/pokedex/domain/usecases/add_favorite_usecase.dart';

class HomeController extends ValueNotifier<HomeState> {
  final IGetListPokemons _getListPokemonsUseCase;
  final IAddFavoriteUseCase _addFavoriteUseCase;

  HomeController(
    this._getListPokemonsUseCase,
    this._addFavoriteUseCase,
  ) : super(HomeLoadingState());

  final List<PokemonModel> _listPokemons = [];
  final int limitPokemons = 20;
  int offsetPokemons = 0;
  PokemonModel? selectedPokemon;

  Future<void> _getListPokemons() async {
    final list = await _getListPokemonsUseCase.call(limit: limitPokemons, offset: offsetPokemons);
    for (var element in list) {
      if (!_listPokemons.any((item) => item.id == element.id)) {
        _listPokemons.add(element as PokemonModel);
      }
    }
  }

  Future<void> fetchListPokemons() async {
    value = HomeLoadingState();
    try {
      await _getListPokemons();
      value = HomeSuccessState(listPokemons: _listPokemons);
    } catch (e) {
      value = HomeErrorState(errorMessage: e.toString());
    }
    notifyListeners();
  }

  Future<void> loadMoreListPokemons() async {
    value = HomeLoadMore(listPokemons: _listPokemons);
    try {
      offsetPokemons = _listPokemons.last.id;
      await _getListPokemons();
      value = HomeSuccessState(listPokemons: _listPokemons);
    } catch (e) {
      value = HomeLoadMoreError(listPokemons: _listPokemons, errorMessage: "Error de Conexão");
    }
  }

  Future<void> addOrRemoveFavorite(PokemonEntity pokemon) async {
    _addFavoriteUseCase.call(pokemon);
  }
}
