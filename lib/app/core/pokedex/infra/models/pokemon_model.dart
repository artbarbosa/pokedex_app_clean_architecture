// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pokedex_app/app/core/pokedex/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  int? height;
  int? weight;
  FlavorText? flavorText;

  List<Stats>? stats;

  List<Types>? types;

  Sprites? sprites;

  List<Abilities>? abilities;

  SpecieName? specieName;

  PokemonModel(
      {required super.id,
      required super.name,
      super.isFavorite = false,
      this.height,
      this.weight,
      this.stats,
      this.types,
      this.flavorText,
      this.sprites,
      this.abilities,
      this.specieName});

  factory PokemonModel.fromJson(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['id'] != null ? map['id'] as int : 0,
      name: map['name'] != null ? map['name'] as String : "",
      height: map['height'] != null ? map['height'] as int : null,
      weight: map['weight'] != null ? map['weight'] as int : null,
      specieName: map['specie_name'] != null
          ? SpecieName.fromJson(
              jsonDecode(
                map['specie_name'],
              ),
            )
          : null,
      flavorText: map['flavor_text'] != null
          ? FlavorText.fromJson(
              map['flavor_text'],
            )
          : null,
      sprites: map['pokemon_v2_pokemonsprites'] != null
          ? Sprites.fromJson(
              jsonDecode(
                map['pokemon_v2_pokemonsprites'].first["sprites"],
              ),
            )
          : null,
      stats: map['pokemon_v2_pokemonstats'] != null
          ? List<Stats>.from(
              (map['pokemon_v2_pokemonstats'] as List).map<Stats?>(
                (x) => Stats.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
      types: map['pokemon_v2_pokemontypes'] != null
          ? List<Types>.from(
              (map['pokemon_v2_pokemontypes'] as List).map<Types?>(
                (x) => Types.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
      abilities: map['pokemon_v2_pokemonabilities'] != null
          ? List<Abilities>.from(
              (map['pokemon_v2_pokemonabilities'] as List).map<Abilities?>(
                (x) => Abilities.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['height'] = height;
    data['weight'] = weight;
    data['flavor_text'] = flavorText!.toJson();
    if (stats != null) {
      data['pokemon_v2_pokemonstats'] = stats!.map((v) => v.toJson()).toList();
    }
    if (types != null) {
      data['pokemon_v2_pokemontypes'] = types!.map((v) => v.toJson()).toList();
    }
    if (sprites != null) {
      data['pokemon_v2_pokemonsprites'] = [
        {"sprites": jsonEncode(sprites!.toJson())}
      ];
    }
    if (abilities != null) {
      data['pokemon_v2_pokemonabilities'] = abilities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stats {
  int? id;

  int? baseStat;

  Stat? pokemonV2Stat;

  Stats({this.id, this.baseStat, this.pokemonV2Stat});

  Stats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    baseStat = json['base_stat'];
    pokemonV2Stat = json['pokemon_v2_stat'] != null ? Stat.fromJson(json['pokemon_v2_stat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['base_stat'] = baseStat;
    if (pokemonV2Stat != null) {
      data['pokemon_v2_stat'] = pokemonV2Stat!.toJson();
    }
    return data;
  }
}

class Stat {
  String? name;

  Stat({this.name});

  Stat.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class Types {
  Type? type;

  Types({this.type});

  Types.fromJson(Map<String, dynamic> json) {
    type = json['pokemon_v2_type'] != null ? Type.fromJson(json['pokemon_v2_type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (type != null) {
      data['pokemon_v2_type'] = type!.toJson();
    }
    return data;
  }
}

class Type {
  int? id;

  String? name;

  Type({this.id, this.name});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Sprites {
  Other? other;

  Sprites({
    this.other,
  });

  Sprites.fromJson(Map<String, dynamic> json) {
    other = json['other'] != null ? Other.fromJson(json['other']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (other != null) {
      data['other'] = other!.toJson();
    }
    return data;
  }
}

class Other {
  OfficialArtwork? officialArtwork;
  Other({
    this.officialArtwork,
  });

  Other.fromJson(Map<String, dynamic> json) {
    officialArtwork = json['official-artwork'] != null
        ? OfficialArtwork.fromJson(json['official-artwork'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (officialArtwork != null) {
      data['official-artwork'] = officialArtwork!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Other{officialArtwork: $officialArtwork}';
  }
}

class OfficialArtwork {
  String? frontDefault;

  String? frontShiny;

  OfficialArtwork({
    this.frontDefault,
    this.frontShiny,
  });

  OfficialArtwork.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['front_default'] = frontDefault;
    data['front_shiny'] = frontShiny;
    return data;
  }

  @override
  String toString() {
    return 'OfficialArtwork{frontDefault: $frontDefault,frontShiny: $frontShiny}';
  }
}

class FlavorText {
  final String value;

  FlavorText({
    required this.value,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'flavor_text': value,
    };
  }

  factory FlavorText.fromJson(Map<String, dynamic> map) {
    return FlavorText(
      value: map['flavor_text'] as String,
    );
  }
}

class Abilities {
  Ability? ability;

  Abilities({this.ability});

  Abilities.fromJson(Map<String, dynamic> json) {
    ability =
        json['pokemon_v2_ability'] != null ? Ability.fromJson(json['pokemon_v2_ability']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ability != null) {
      data['pokemon_v2_ability'] = ability!.toJson();
    }
    return data;
  }
}

class Ability {
  int? id;

  String? name;

  Ability({this.id, this.name});

  Ability.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class SpecieName {
  String? genus;

  SpecieName({this.genus});

  SpecieName.fromJson(Map<String, dynamic> json) {
    genus = json['genus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['genus'] = genus;
    return data;
  }
}
