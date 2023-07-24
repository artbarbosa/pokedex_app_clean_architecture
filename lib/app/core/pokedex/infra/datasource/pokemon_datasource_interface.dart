abstract class IPokemonDatasource {
  Future<Map<String, dynamic>> getListPokemons({required int offset, required int limit});
  Future<Map<String, dynamic>> getPokemonExtra(String id);
  Future<void> addPokemonFavorite(List<Map<String, dynamic>> pokemon, String boxKey, String key);
  Future<void> removePokemonFavorite(List<Map<String, dynamic>> pokemon, String boxKey, String key);
  Future<List<Map<String, dynamic>>> getFavoritePokemons(String boxKey, String key);
}
