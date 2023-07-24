import '../entities/pokemon_entity.dart';
import '../repositories/pokemon_repository_interface.dart';

abstract class IGetListPokemons {
  Future<List<PokemonEntity>> call({required int limit, required int offset});
}

class GetListPokemonsUseCase implements IGetListPokemons {
  final IPokemonRepository _repository;
  GetListPokemonsUseCase(this._repository);

  @override
  Future<List<PokemonEntity>> call({required int limit, required int offset}) async {
    return await _repository.getListPokemons(limit: limit, offset: offset);
  }
}
