import 'package:pokedex_app/app/core/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/core/shared/consts/store_consts.dart';

import '../../../../core/shared/failures/failures.dart';
import '../../domain/errors/pokemon_errors.dart';
import '../../domain/repositories/pokemon_repository_interface.dart';
import '../datasource/pokemon_datasource_interface.dart';
import '../models/pokemon_model.dart';

class PokemonRepository implements IPokemonRepository {
  final IPokemonDatasource datasource;
  PokemonRepository({
    required this.datasource,
  });

  @override
  Future<List<PokemonModel>> getListPokemons({required int offset, required int limit}) async {
    try {
      final map = await datasource.getListPokemons(limit: limit, offset: offset);
      final list = map["pokemon_v2_pokemon"] as List;
      final listModel = list.map((e) => PokemonModel.fromJson(e)).toList();

      for (var element in listModel) {
        final result = await datasource.getPokemonExtra(element.id.toString());
        if (result.containsKey("pokemon_v2_pokemonspeciesname")) {
          element.specieName = SpecieName.fromJson(result["pokemon_v2_pokemonspeciesname"].first);
        }
        if (result.containsKey("pokemon_v2_pokemonspeciesflavortext")) {
          element.flavorText =
              FlavorText.fromJson(result["pokemon_v2_pokemonspeciesflavortext"].first);
        }
      }
      return listModel;
    } on NoInternetConnection {
      rethrow;
    } catch (e, stackTrace) {
      throw PokemonRepositoryError(
          label: e.toString(),
          exception: e,
          errorMessage: 'PokemonRepositoryError - getAllProducts',
          stackTrace: stackTrace);
    }
  }

  @override
  Future<void> addPokemonFavorite(List<PokemonEntity> value) async {
    try {
      final list = List.generate(value.length, (index) => (value[index] as PokemonModel).toJson());
      await datasource.addPokemonFavorite(list,StoreConst.boxPokemon, StoreConst.keyFavorites);
    } catch (e, stackTrace) {
      throw PokemonRepositoryError(
          label: e.toString(),
          exception: e,
          errorMessage: 'PokemonRepositoryError - addPokemonFavorite',
          stackTrace: stackTrace);
    }
  }

  @override
  Future<void> removePokemonFavorite(List<PokemonEntity> value) async {
    try {
      final list = List.generate(value.length, (index) => (value[index] as PokemonModel).toJson());
      await datasource.removePokemonFavorite(list, StoreConst.boxPokemon, StoreConst.keyFavorites);
    } catch (e, stackTrace) {
      throw PokemonRepositoryError(
          label: e.toString(),
          exception: e,
          errorMessage: 'PokemonRepositoryError - addPokemonFavorite',
          stackTrace: stackTrace);
    }
  }

  @override
  Future<List<PokemonEntity>> getFavoritePokemons() async {
    try {
      final list = await datasource.getFavoritePokemons(StoreConst.boxPokemon, StoreConst.keyFavorites);
      final listModel = list.map((e) => PokemonModel.fromJson(e)).toList();
      for (var element in listModel) {
        element.isFavorite = true;
      }
      return listModel;
    } catch (e, stackTrace) {
      throw PokemonRepositoryError(
          label: e.toString(),
          exception: e,
          errorMessage: 'PokemonRepositoryError - addPokemonFavorite',
          stackTrace: stackTrace);
    }
  }
}
