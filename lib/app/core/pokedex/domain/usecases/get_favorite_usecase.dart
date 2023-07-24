import '../entities/pokemon_entity.dart';
import '../repositories/pokemon_repository_interface.dart';

abstract class IGetFavoriteUseCase {
  Future<List<PokemonEntity>?> call();
}

class GetFavoriteUseCase implements IGetFavoriteUseCase {
  final IPokemonRepository _repository;
  GetFavoriteUseCase(this._repository);

  @override
  Future<List<PokemonEntity>?> call() async {
    return await _repository.getFavoritePokemons() ?? [];
  }
}
