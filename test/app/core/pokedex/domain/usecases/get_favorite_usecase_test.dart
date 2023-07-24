import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_app/app/core/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/core/pokedex/domain/usecases/get_favorite_usecase.dart';

import '../../../../../mock/mock.dart';

void main() {
  late IPokemonRepositoryMock repository;
  late GetFavoriteUseCase usecase;

  setUpAll(() {
    repository = IPokemonRepositoryMock();
    usecase = GetFavoriteUseCase(repository);
  });

  test('Should call the method  addTraveler and return List ', () async {
    when(() => repository.getFavoritePokemons()).thenAnswer((_) async => listPokemonEntityMock);

    final result = await usecase.call();

    expect(result, isA<List<PokemonEntity>>());
    expect(result!.first.id, 1);
  });
}
