import 'package:pokedex_app/app/core/shared/services/local/local_storage_service_interface.dart';

import '../../../../core/shared/failures/failures.dart';
import '../../../../core/shared/services/remote/http_client_service_interface.dart';
import '../../../shared/consts/api_consts.dart';
import '../../domain/errors/pokemon_errors.dart';
import '../../infra/datasource/pokemon_datasource_interface.dart';

class PokemonDatasource implements IPokemonDatasource {
  final IHttpClientService client;
  final ILocalStorageService storage;

  PokemonDatasource(this.client, this.storage);

  @override
  Future<Map<String, dynamic>> getListPokemons({required int offset, required int limit}) async {
    try {
      final response =
          await client.query(ApiConst.queryAllPokemons(offset.toString(), limit.toString()));
      return response.data as Map<String, dynamic>;
    } on NoInternetConnection {
      throw PokemonDatasourceInternetConnection();
    } catch (e, stackTrace) {
      throw PokemonDatasourceError(
        label: e.toString(),
        exception: e,
        errorMessage: 'PokemonDatasourceError - getListPokemons',
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<Map<String, dynamic>> getPokemonExtra(String id) async {
    try {
      final response = await client.query(ApiConst.queryPokemonExtra(id));
      return response.data as Map<String, dynamic>;
    } on NoInternetConnection {
      throw PokemonDatasourceInternetConnection();
    } catch (e, stackTrace) {
      throw PokemonDatasourceError(
        label: e.toString(),
        exception: e,
        errorMessage: 'PokemonDatasourceError - getPokemonExtra',
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> addPokemonFavorite(
      List<Map<String, dynamic>> value, String boxKey, String key) async {
    try {
      await storage.save(boxKey, key, value) ?? [];
    } catch (e, stackTrace) {
      throw PokemonDatasourceError(
        label: e.toString(),
        exception: e,
        errorMessage: 'PokemonDatasourceError - addPokemonFavorite',
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> removePokemonFavorite(
      List<Map<String, dynamic>> value, String boxKey, String key) async {
    try {
      await storage.remove(boxKey, key, value) ?? [];
    } catch (e, stackTrace) {
      throw PokemonDatasourceError(
        label: e.toString(),
        exception: e,
        errorMessage: 'PokemonDatasourceError - removePokemonFavorite',
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getFavoritePokemons(String boxKey, String key) async {
    try {
      return await storage.get(boxKey, key) ?? [];
    } catch (e, stackTrace) {
      throw PokemonDatasourceError(
        label: e.toString(),
        exception: e,
        errorMessage: 'PokemonDatasourceError - getFavoritePokemons',
        stackTrace: stackTrace,
      );
    }
  }
}
