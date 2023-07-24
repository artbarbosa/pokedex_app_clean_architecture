// ignore: depend_on_referenced_packages
import 'package:graphql/client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_app/app/core/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/core/pokedex/domain/repositories/pokemon_repository_interface.dart';
import 'package:pokedex_app/app/core/pokedex/infra/datasource/pokemon_datasource_interface.dart';
import 'package:pokedex_app/app/core/shared/services/local/local_storage_service_interface.dart';
import 'package:pokedex_app/app/core/shared/services/remote/http_client_service_interface.dart';

class GraphQLClientMock extends Mock implements GraphQLClient {}

class ExceptionMock extends Mock implements Exception {}

class IHttpClientServiceMock extends Mock implements IHttpClientService {}

class ILocalStorageServiceMock extends Mock implements ILocalStorageService {}

class IPokemonDatasourceMock extends Mock implements IPokemonDatasource {}

class IPokemonRepositoryMock extends Mock implements IPokemonRepository {}

// class IBookRepositoryMock extends Mock implements IBookRepository {}

// class IAuthorRepositoryMock extends Mock implements IAuthorRepository {}

// class IUserRepositoryMock extends Mock implements IUserRepository {}

// class IAuthorRemoteDataSourceMock extends Mock
//     implements IAuthorRemoteDataSource {}

final queryOptionsMock = QueryOptions(
  document: gql(''),
);

final Map<String, dynamic> mapDataMock = {};

final QueryResult queryResultMock = QueryResult(
  source: QueryResultSource.network,
  data: mapDataMock,
  options: QueryOptions(
    document: gql(''),
  ),
);

final PokemonEntity pokemonEntityMock = PokemonEntity(id: 1, isFavorite: true, name: "");

final List<PokemonEntity> listPokemonEntityMock = [pokemonEntityMock];

const List<Map<String, dynamic>> listMapGetListPokemons = [mapGetListPokemons];

const Map<String, dynamic> mapGetListPokemons = {
  "pokemon_v2_pokemon": [
    {
      "id": 1,
      "name": "bulbasaur",
      "height": 7,
      "weight": 69,
      "pokemon_v2_pokemonstats": [
        {
          "id": 1,
          "base_stat": 45,
          "pokemon_v2_stat": {"name": "hp"}
        },
        {
          "id": 2,
          "base_stat": 49,
          "pokemon_v2_stat": {"name": "attack"}
        },
        {
          "id": 3,
          "base_stat": 49,
          "pokemon_v2_stat": {"name": "defense"}
        },
        {
          "id": 4,
          "base_stat": 65,
          "pokemon_v2_stat": {"name": "special-attack"}
        },
        {
          "id": 5,
          "base_stat": 65,
          "pokemon_v2_stat": {"name": "special-defense"}
        },
        {
          "id": 6,
          "base_stat": 45,
          "pokemon_v2_stat": {"name": "speed"}
        }
      ],
      "pokemon_v2_pokemontypes": [
        {
          "pokemon_v2_type": {"id": 12, "name": "grass"}
        },
        {
          "pokemon_v2_type": {"id": 4, "name": "poison"}
        }
      ],
      "pokemon_v2_pokemonsprites": [
        {
          "sprites":
              "{\"front_default\": \"/media/sprites/pokemon/1.png\", \"front_female\": null, \"front_shiny\": \"/media/sprites/pokemon/shiny/1.png\", \"front_shiny_female\": null, \"back_default\": \"/media/sprites/pokemon/back/1.png\", \"back_female\": null, \"back_shiny\": \"/media/sprites/pokemon/back/shiny/1.png\", \"back_shiny_female\": null, \"other\": {\"dream_world\": {\"front_default\": \"/media/sprites/pokemon/other/dream-world/1.svg\", \"front_female\": null}, \"home\": {\"front_default\": \"/media/sprites/pokemon/other/home/1.png\", \"front_female\": null, \"front_shiny\": \"/media/sprites/pokemon/other/home/shiny/1.png\", \"front_shiny_female\": null}, \"official-artwork\": {\"front_default\": \"/media/sprites/pokemon/other/official-artwork/1.png\", \"front_shiny\": \"/media/sprites/pokemon/other/official-artwork/shiny/1.png\"}}, \"versions\": {\"generation-i\": {\"red-blue\": {\"front_default\": \"/media/sprites/pokemon/versions/generation-i/red-blue/1.png\", \"front_gray\": \"/media/sprites/pokemon/versions/generation-i/red-blue/gray/1.png\", \"back_default\": \"/media/sprites/pokemon/versions/generation-i/red-blue/back/1.png\", \"back_gray\": \"/media/sprites/pokemon/versions/generation-i/red-blue/back/gray/1.png\", \"front_transparent\": \"/media/sprites/pokemon/versions/generation-i/red-blue/transparent/1.png\", \"back_transparent\": \"/media/sprites/pokemon/versions/generation-i/red-blue/transparent/back/1.png\"}, \"yellow\": {\"front_default\": \"/media/sprites/pokemon/versions/generation-i/yellow/1.png\", \"front_gray\": \"/media/sprites/pokemon/versions/generation-i/yellow/gray/1.png\", \"back_default\": \"/media/sprites/pokemon/versions/generation-i/yellow/back/1.png\", \"back_gray\": \"/media/sprites/pokemon/versions/generation-i/yellow/back/gray/1.png\", \"front_transparent\": \"/media/sprites/pokemon/versions/generation-i/yellow/transparent/1.png\", \"back_transparent\": \"/media/sprites/pokemon/versions/generation-i/yellow/transparent/back/1.png\"}}, \"generation-ii\": {\"crystal\": {\"front_default\": \"/media/sprites/pokemon/versions/generation-ii/crystal/1.png\", \"front_shiny\": \"/media/sprites/pokemon/versions/generation-ii/crystal/shiny/1.png\", \"back_default\": \"/media/sprites/pokemon/versions/generation-ii/crystal/back/1.png\", \"back_shiny\": \"/media/sprites/pokemon/versions/generation-ii/crystal/back/shiny/1.png\", \"front_transparent\": \"/media/sprites/pokemon/versions/generation-ii/crystal/transparent/1.png\", \"front_shiny_transparent\": \"/media/sprites/pokemon/versions/generation-ii/crystal/transparent/shiny/1.png\", \"back_transparent\": \"/media/sprites/pokemon/versions/generation-ii/crystal/transparent/back/1.png\", \"back_shiny_transparent\": \"/media/sprites/pokemon/versions/generation-ii/crystal/transparent/back/shiny/1.png\"}, \"gold\": {\"front_default\": \"/media/sprites/pokemon/versions/generation-ii/gold/1.png\", \"front_shiny\": \"/media/sprites/pokemon/versions/generation-ii/gold/shiny/1.png\", \"back_default\": \"/media/sprites/pokemon/versions/generation-ii/gold/back/1.png\", \"back_shiny\": \"/media/sprites/pokemon/versions/generation-ii/gold/back/shiny/1.png\", \"front_transparent\": \"/media/sprites/pokemon/versions/generation-ii/gold/transparent/1.png\"}, \"silver\": {\"front_default\": \"/media/sprites/pokemon/versions/generation-ii/silver/1.png\", \"front_shiny\": \"/media/sprites/pokemon/versions/generation-ii/silver/shiny/1.png\", \"back_default\": \"/media/sprites/pokemon/versions/generation-ii/silver/back/1.png\", \"back_shiny\": \"/media/sprites/pokemon/versions/generation-ii/silver/back/shiny/1.png\", \"front_transparent\": \"/media/sprites/pokemon/versions/generation-ii/silver/transparent/1.png\"}}, \"generation-iii\": {\"emerald\": {\"front_default\": \"/media/sprites/pokemon/versions/generation-iii/emerald/1.png\", \"front_shiny\": \"/media/sprites/pokemon/versions/generation-iii/emerald/shiny/1.png\"}, \"firered-leafgreen\": {\"front_default\": \"/media/sprites/pokemon/versions/generation-iii/firered-leafgreen/1.png\", \"front_shiny\": \"/media/sprites/pokemon/versions/generation-iii/firered-leafgreen/shiny/1.png\", \"back_default\": \"/media/sprites/pokemon/versions/generation-iii/firered-leafgreen/back/1.png\", \"back_shiny\": \"/media/sprites/pokemon/versions/generation-iii/firered-leafgreen/back/shiny/1.png\"}, \"ruby-sapphire\": {\"front_default\": \"/media/sprites/pokemon/versions/generation-iii/ruby-sapphire/1.png\", \"front_shiny\": \"/media/sprites/pokemon/versions/generation-iii/ruby-sapphire/shiny/1.png\", \"back_default\": \"/media/sprites/pokemon/versions/generation-iii/ruby-sapphire/back/1.png\", \"back_shiny\": \"/media/sprites/pokemon/versions/generation-iii/ruby-sapphire/back/shiny/1.png\"}}, \"generation-iv\": {\"diamond-pearl\": {\"front_default\": \"/media/sprites/pokemon/versions/generation-iv/diamond-pearl/1.png\", \"front_female\": null, \"front_shiny\": \"/media/sprites/pokemon/versions/generation-iv/diamond-pearl/shiny/1.png\", \"front_shiny_female\": null, \"back_default\": \"/media/sprites/pokemon/versions/generation-iv/diamond-pearl/back/1.png\", \"back_female\": null, \"back_shiny\": \"/media/sprites/pokemon/versions/generation-iv/diamond-pearl/back/shiny/1.png\", \"back_shiny_female\": null}, \"heartgold-soulsilver\": {\"front_default\": \"/media/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/1.png\", \"front_female\": null, \"front_shiny\": \"/media/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/shiny/1.png\", \"front_shiny_female\": null, \"back_default\": \"/media/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/back/1.png\", \"back_female\": null, \"back_shiny\": \"/media/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/back/shiny/1.png\", \"back_shiny_female\": null}, \"platinum\": {\"front_default\": \"/media/sprites/pokemon/versions/generation-iv/platinum/1.png\", \"front_female\": null, \"front_shiny\": \"/media/sprites/pokemon/versions/generation-iv/platinum/shiny/1.png\", \"front_shiny_female\": null, \"back_default\": \"/media/sprites/pokemon/versions/generation-iv/platinum/back/1.png\", \"back_female\": null, \"back_shiny\": \"/media/sprites/pokemon/versions/generation-iv/platinum/back/shiny/1.png\", \"back_shiny_female\": null}}, \"generation-v\": {\"black-white\": {\"front_default\": \"/media/sprites/pokemon/versions/generation-v/black-white/1.png\", \"front_female\": null, \"front_shiny\": \"/media/sprites/pokemon/versions/generation-v/black-white/shiny/1.png\", \"front_shiny_female\": null, \"back_default\": \"/media/sprites/pokemon/versions/generation-v/black-white/back/1.png\", \"back_female\": null, \"back_shiny\": \"/media/sprites/pokemon/versions/generation-v/black-white/back/shiny/1.png\", \"back_shiny_female\": null, \"animated\": {\"front_default\": \"/media/sprites/pokemon/versions/generation-v/black-white/animated/1.gif\", \"front_female\": null, \"front_shiny\": \"/media/sprites/pokemon/versions/generation-v/black-white/animated/shiny/1.gif\", \"front_shiny_female\": null, \"back_default\": \"/media/sprites/pokemon/versions/generation-v/black-white/animated/back/1.gif\", \"back_female\": null, \"back_shiny\": \"/media/sprites/pokemon/versions/generation-v/black-white/animated/back/shiny/1.gif\", \"back_shiny_female\": null}}}, \"generation-vi\": {\"omegaruby-alphasapphire\": {\"front_default\": \"/media/sprites/pokemon/versions/generation-vi/omegaruby-alphasapphire/1.png\", \"front_female\": null, \"front_shiny\": \"/media/sprites/pokemon/versions/generation-vi/omegaruby-alphasapphire/shiny/1.png\", \"front_shiny_female\": null}, \"x-y\": {\"front_default\": \"/media/sprites/pokemon/versions/generation-vi/x-y/1.png\", \"front_female\": null, \"front_shiny\": \"/media/sprites/pokemon/versions/generation-vi/x-y/shiny/1.png\", \"front_shiny_female\": null}}, \"generation-vii\": {\"ultra-sun-ultra-moon\": {\"front_default\": \"/media/sprites/pokemon/versions/generation-vii/ultra-sun-ultra-moon/1.png\", \"front_female\": null, \"front_shiny\": \"/media/sprites/pokemon/versions/generation-vii/ultra-sun-ultra-moon/shiny/1.png\", \"front_shiny_female\": null}, \"icons\": {\"front_default\": \"/media/sprites/pokemon/versions/generation-vii/icons/1.png\", \"front_female\": null}}, \"generation-viii\": {\"icons\": {\"front_default\": \"/media/sprites/pokemon/versions/generation-viii/icons/1.png\", \"front_female\": null}}}}"
        }
      ],
      "pokemon_v2_pokemonabilities": [
        {
          "pokemon_v2_ability": {"id": 65, "name": "overgrow"}
        },
        {
          "pokemon_v2_ability": {"id": 34, "name": "chlorophyll"}
        }
      ]
    }
  ]
};

const Map<String, dynamic> mapGetFavoriteBooks = {
  "favoriteBooks": [
    {
      "name": "Clean Code: A Handbook of Agile Software Craftsmanship",
      "cover": "https://sscdn.co/gcs/studiosol/2022/mobile/book/clean-code.jpg",
      "author": {"name": "Robert Cecil Martin"}
    },
    {
      "name": "Clean Architecture: A Craftsman's Guide to Software Structure and Design",
      "cover": "https://sscdn.co/gcs/studiosol/2022/mobile/book/clean-architecture.jpg",
      "author": {"name": "Robert Cecil Martin"}
    },
  ]
};

const Map<String, dynamic> mapGetBookById = {
  "book": {
    "name": "Clean Code: A Handbook of Agile Software Craftsmanship",
    "cover": "https://sscdn.co/gcs/studiosol/2022/mobile/book/clean-code.jpg",
    "isFavorite": true,
    "author": {"name": "Robert Cecil Martin"},
    "description": "Even bad code can function. "
  }
};

const Map<String, dynamic> mapGetUserPicture = {
  "userPicture": "https://sscdn.co/gcs/studiosol/2022/mobile/avatar.jpg"
};

final pokemonModel = PokemonEntity(name: 'test', id: 1, isFavorite: false);

final listBookModelMock = [pokemonModel];

const Map<String, dynamic> userMapMock = {
  "userPicture": "https://sscdn.co/gcs/studiosol/2022/mobile/avatar.jpg"
};
const Map<String, dynamic> bookMapMock = {
  "name": "Clean Code: A Handbook of Agile Software Craftsmanship",
  "cover": "https://sscdn.co/gcs/studiosol/2022/mobile/book/clean-code.jpg",
  "author": {"name": "Robert Cecil Martin"}
};
const Map<String, dynamic> authorMapMock = {
  "name": "Robert Cecil Martin",
  "booksCount": 4,
  "picture": "https://sscdn.co/gcs/studiosol/2022/mobile/author/uncle-bob.jpg"
};
