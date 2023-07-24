import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_app/app/core/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/core/pokedex/domain/usecases/get_list_pokemons.dart';

import '../../../../../mock/mock.dart';

void main() {
  late IPokemonRepositoryMock repository;
  late GetListPokemonsUseCase usecase;

  setUpAll(() {
    repository = IPokemonRepositoryMock();
    usecase = GetListPokemonsUseCase(repository);
  });

  test('Should call the method  addTraveler and return List', () async {
    when(() => repository.getListPokemons(limit: 1, offset: 1))
        .thenAnswer((_) async => listPokemonEntityMock);

    final result = await usecase.call(limit: 1, offset: 1);

    expect(result, isA<List<PokemonEntity>>());
    expect(result.first.id, 1);
  });
}
