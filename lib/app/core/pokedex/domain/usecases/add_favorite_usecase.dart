import '../entities/pokemon_entity.dart';
import '../repositories/pokemon_repository_interface.dart';

abstract class IAddFavoriteUseCase {
  Future<void> call(PokemonEntity pokemon);
}

class AddFavoriteUseCase implements IAddFavoriteUseCase {
  final IPokemonRepository _repository;
  AddFavoriteUseCase(this._repository);

  @override
  Future<void> call(PokemonEntity pokemon) async {
    pokemon.isFavorite = !pokemon.isFavorite;
    final listFavorites = await _repository.getFavoritePokemons() ?? [];
    if (pokemon.isFavorite) {
      listFavorites.add(pokemon);
      _repository.addPokemonFavorite(listFavorites);
    } else {
      listFavorites.removeWhere(
        (element) => element.id == pokemon.id,
      );
      _repository.removePokemonFavorite(listFavorites);
    }
  }
}
