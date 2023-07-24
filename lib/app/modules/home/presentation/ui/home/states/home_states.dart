// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pokedex_app/app/core/pokedex/infra/models/pokemon_model.dart';

abstract class HomeState {}

class HomeLoadingState implements HomeState {}

class HomeSuccessState implements HomeState {
  List<PokemonModel> listPokemons;

  HomeSuccessState({
    required this.listPokemons,
  });
}

class HomeErrorState implements HomeState {
  final String errorMessage;
  HomeErrorState({
    required this.errorMessage,
  });
}

class HomeLoadMore extends HomeSuccessState {
  HomeLoadMore({required super.listPokemons});
}

class HomeLoadMoreError extends HomeSuccessState {
  final String errorMessage;
  HomeLoadMoreError({
    required this.errorMessage,
    required super.listPokemons,
  });
}
