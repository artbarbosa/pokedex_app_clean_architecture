class ApiConst {
  static const apiUrl = 'https://beta.pokeapi.co/graphql/v1beta';
  static const imageUrl = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/';

  static String queryAllPokemons(String offset, String limit) => """
  query AllPokemons {
  pokemon_v2_pokemon(offset: $offset, limit: $limit) {
    id
    name
    height
    weight
    pokemon_v2_pokemonstats {
      id
      base_stat
      pokemon_v2_stat {
        name
      }
    }
    pokemon_v2_pokemontypes {
      pokemon_v2_type {
        id
        name
      }
    }
    pokemon_v2_pokemonsprites {
      sprites
    }
    pokemon_v2_pokemonabilities {
      pokemon_v2_ability {
        id
        name
      }
    }
  }
}
""";

  static String queryPokemonExtra(String id) => """
 query PokemonFlavorText {
  pokemon_v2_pokemonspeciesflavortext(limit: 1,where: {pokemon_species_id: {_eq: $id}}) {
    flavor_text
  }
  pokemon_v2_pokemonspeciesname(where: {pokemon_species_id: {_eq: $id}, language_id: {_eq: 9}}) {
    genus
  }
}""";
}
