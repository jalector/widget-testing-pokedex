import 'dart:convert';

import 'package:app_pokedex/util/util.dart';

import '../model/pokemon.dart';
import 'package:http/http.dart' as http;

import '../model/pokemon_generation.dart';

abstract class PokedexApi {
  Future<List<Pokemon>> getGeneartion(PokemonGeneration generation);
}

class PokedexApiAdapter implements PokedexApi {
  @override
  Future<List<Pokemon>> getGeneartion(PokemonGeneration generation) async {
    final uri = Uri.parse(
        'https://db.pokemongohub.net/api/pokemon/with-generation/${generation.number}?locale=en');
    final response = await http.get(uri);
    
    if (response.statusCode != 200) {
      throw "Error";
    }

    final pokemon =
        Util.getCollectionOf(json.decode(response.body), Pokemon.fromMap);

    return pokemon;
  }
}

class PokedexApiAdapterDB implements PokedexApi {
  @override
  Future<List<Pokemon>> getGeneartion(PokemonGeneration generation) async {
    final pokemons = List.generate(
      5,
      (index) => Pokemon(
        id: index,
        pokemonId: "BULBASAUR",
        name: "Bulbasaur",
        form: null,
        type1: "grass",
        type2: "poison",
        generation: 1,
        atk: 118,
        sta: 128,
        def: 111,
        maxcp: 1260,
      ),
    );

    return pokemons;
  }
}
