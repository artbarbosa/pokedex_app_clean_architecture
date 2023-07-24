import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_app/app/core/pokedex/domain/errors/pokemon_errors.dart';
import 'package:pokedex_app/app/core/pokedex/infra/models/pokemon_model.dart';
import 'package:pokedex_app/app/core/pokedex/infra/repositories/pokemon_repository.dart';
import 'package:pokedex_app/app/core/shared/failures/failures.dart';

import '../../../../../mock/mock.dart';

void main() {
  late IPokemonDatasourceMock datasource;
  late PokemonRepository repository;

  setUpAll(() {
    datasource = IPokemonDatasourceMock();
    repository = PokemonRepository(datasource: datasource);
  });

  group('Quiz Repository - getListPokemons', () {
    test('Should return List PokemonModel', () async {
      when(() => datasource.getListPokemons(limit: 1, offset: 1))
          .thenAnswer((_) async => mapGetListPokemons);
      when(() => datasource.getPokemonExtra("1")).thenAnswer((_) async => mapGetListPokemons);

      final result = await repository.getListPokemons(limit: 1, offset: 1);

      expect(result, isA<List<PokemonModel>>());
      expect(result.length, 1);
    });

    test('Should Throw NoInternetConnection', () async {
      when(() => datasource.getListPokemons(limit: 1, offset: 1)).thenThrow(NoInternetConnection());

      expect(() async => await repository.getListPokemons(limit: 1, offset: 1),
          throwsA(isA<NoInternetConnection>()));
    });

    test('Should Throw PokemonRepositoryError', () async {
      when(() => datasource.getListPokemons(limit: 1, offset: 1)).thenThrow(Exception());

      expect(() async => await repository.getListPokemons(limit: 1, offset: 1),
          throwsA(isA<PokemonRepositoryError>()));
    });
  });

  group('Quiz Repository - addPokemonFavorite', () {
    test('Should void', () async {
      when(() => datasource.addPokemonFavorite([], "", ""))
          .thenAnswer((_) async => mapGetListPokemons);

      expect(() async => await datasource.addPokemonFavorite([], "", ""), isA<void>());
    });

    test('Should Throw PokemonRepositoryError', () async {
      when(() => datasource.addPokemonFavorite([], "", "")).thenThrow(Exception());

      expect(() async => await repository.addPokemonFavorite([]),
          throwsA(isA<PokemonRepositoryError>()));
    });
  });

  group('Quiz Repository - removePokemonFavorite', () {
    test('Should void', () async {
      when(() => datasource.removePokemonFavorite([], "", ""))
          .thenAnswer((_) async => mapGetListPokemons);

      expect(() async => await datasource.removePokemonFavorite([], "", ""), isA<void>());
    });

    test('Should Throw PokemonRepositoryError', () async {
      when(() => datasource.removePokemonFavorite([], "", "")).thenThrow(Exception());

      expect(() async => await repository.removePokemonFavorite([]),
          throwsA(isA<PokemonRepositoryError>()));
    });
  });

  group('Quiz Repository - getFavoritePokemons', () {
    test('Should return List PokemonModel', () async {
      when(() => datasource.getFavoritePokemons("pokemon", "favorites"))
          .thenAnswer((_) async => listMapGetListPokemons);

      final result = await repository.getFavoritePokemons();

      expect(result, isA<List<PokemonModel>>());
      expect(result.length, 1);
    });

    test('Should Throw PokemonRepositoryError', () async {
      when(() => datasource.getFavoritePokemons("pokemon", "favorites")).thenThrow(Exception());

      expect(() async => await repository.getFavoritePokemons(),
          throwsA(isA<PokemonRepositoryError>()));
    });
  });
}
