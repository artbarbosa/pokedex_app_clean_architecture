import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/app/core/shared/consts/api_consts.dart';

void main() {
  const String queryAllPokemons = """
  query AllPokemons {
  pokemon_v2_pokemon(offset: 1, limit: 1) {
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

  const String queryPokemonExtra = """
 query PokemonFlavorText {
  pokemon_v2_pokemonspeciesflavortext(limit: 1,where: {pokemon_species_id: {_eq: 1}}) {
    flavor_text
  }
  pokemon_v2_pokemonspeciesname(where: {pokemon_species_id: {_eq: 1}, language_id: {_eq: 9}}) {
    genus
  }
}""";

  group('ApiConst - queryAllPokemons', () {
    test('Should Return URL Api String', () async {
      var result = ApiConst.queryAllPokemons('1', "1");

      expect(result, queryAllPokemons);
    });
  });

  group('ApiConst - queryPokemonExtra', () {
    test('Should Return URL Api String', () async {
      var result = ApiConst.queryPokemonExtra('1');

      expect(result, queryPokemonExtra);
    });
  });
}
