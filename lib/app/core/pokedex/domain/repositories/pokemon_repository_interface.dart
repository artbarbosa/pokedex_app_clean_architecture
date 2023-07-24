import '../entities/pokemon_entity.dart';

abstract class IPokemonRepository {
  Future<List<PokemonEntity>> getListPokemons({required int offset, required int limit});

  Future<List<PokemonEntity>?> getFavoritePokemons();
  Future<void> removePokemonFavorite(List<PokemonEntity> value);
  Future<void> addPokemonFavorite(List<PokemonEntity> value);
}
