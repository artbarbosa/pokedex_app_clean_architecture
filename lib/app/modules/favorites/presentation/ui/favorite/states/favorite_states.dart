// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pokedex_app/app/core/pokedex/infra/models/pokemon_model.dart';

abstract class FavoriteState {}

class FavoriteLoadingState implements FavoriteState {}

class FavoriteSuccessState implements FavoriteState {
  List<PokemonModel> listPokemons;

  FavoriteSuccessState({
    required this.listPokemons,
  });
}

class FavoriteEmptyState implements FavoriteState {
  FavoriteEmptyState();
}
