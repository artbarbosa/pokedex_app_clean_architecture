import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_app/app/core/pokedex/domain/errors/pokemon_errors.dart';
import 'package:pokedex_app/app/core/pokedex/external/datasources/pokemon_datadource.dart';

import '../../../../../mock/mock.dart';

void main() {
  late IHttpClientServiceMock httpClient;
  late ILocalStorageServiceMock storageClient;
  late PokemonDatasource datasource;

  setUpAll(() {
    httpClient = IHttpClientServiceMock();
    storageClient = ILocalStorageServiceMock();
    datasource = PokemonDatasource(httpClient, storageClient);
  });

  group('PokemonDatasourceImp - getListPokemons', () {
    test('Should return List<Map>', () async {
      when(() => httpClient.query(any())).thenAnswer((_) async => queryResultMock);

      final result = await datasource.getListPokemons(offset: 1, limit: 1);

      expect(result, isA<Map<String, dynamic>>());
    });

    test('Should return PokemonDatasourceError', () async {
      when(() => httpClient.query(any())).thenThrow(ExceptionMock());

      expect(() async => await datasource.getListPokemons(offset: 1, limit: 1),
          throwsA(isA<PokemonDatasourceError>()));
    });
  });

  group('PokemonDatasourceImp - getPokemonExtra', () {
    test('Should return List<Map>', () async {
      when(() => httpClient.query(any())).thenAnswer((_) async => queryResultMock);

      final result = await datasource.getPokemonExtra("1");

      expect(result, isA<Map<String, dynamic>>());
    });

    test('Should return PokemonDatasourceError', () async {
      when(() => httpClient.query(any())).thenThrow(ExceptionMock());

      expect(() async => await datasource.getPokemonExtra("1"),
          throwsA(isA<PokemonDatasourceError>()));
    });
  });

  group('PokemonDatasourceImp - getListPokemons', () {
    test('Should return List<Map>', () async {
      when(() => httpClient.query(any())).thenAnswer((_) async => queryResultMock);

      final result = await datasource.getListPokemons(offset: 1, limit: 1);

      expect(result, isA<Map<String, dynamic>>());
    });

    test('Should return PokemonDatasourceError', () async {
      when(() => httpClient.query(any())).thenThrow(ExceptionMock());

      expect(() async => await datasource.getListPokemons(offset: 1, limit: 1),
          throwsA(isA<PokemonDatasourceError>()));
    });
  });

  group('PokemonDatasourceImp - addPokemonFavorite', () {
    test('Should void', () async {
      when(() => httpClient.query(any()));

      expect(() async => await datasource.addPokemonFavorite([], "", ""), isA<void>());
    });
  });
  group('PokemonDatasourceImp - removePokemonFavorite', () {
    test('Should void', () async {
      when(() => httpClient.query(any())).thenAnswer((_) async => queryResultMock);

      expect(() async => await datasource.removePokemonFavorite([], "", ""), isA<void>());
    });
  });
}
