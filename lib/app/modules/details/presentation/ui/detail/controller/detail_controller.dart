import 'package:flutter/material.dart';

import '../../../../../../core/pokedex/domain/entities/pokemon_entity.dart';
import '../../../../../../core/pokedex/domain/usecases/add_favorite_usecase.dart';
import '../states/detail_states.dart';

class DetailController extends ValueNotifier<DetailState> {
  DetailController(this._addFavoriteUseCase) : super(DeatiailSuccessState());

  final IAddFavoriteUseCase _addFavoriteUseCase;

  Future<void> addOrRemoveFavorite(PokemonEntity pokemon) async {
    _addFavoriteUseCase.call(pokemon);
  }
}
