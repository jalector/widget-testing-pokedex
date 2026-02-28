import 'package:app_pokedex/model/pokemon_generation.dart';
import 'package:rxdart/rxdart.dart';

import '../../model/pokemon.dart';
import '../../pokedex/pokedex_api.dart';

class PokemonListProvider {
  final PokedexApi api;
  final list = BehaviorSubject<List<Pokemon>?>();

  PokemonListProvider(this.api) {
    fetchGeneration();
  }

  void fetchGeneration() async {
    list.add(null);

    try {
      final pokemon = await api.getGeneartion(PokemonGeneration.kanto);
      list.add(pokemon);
    } catch (e) {
      list.addError(e.toString());
    }
  }

  void close() {
    list.close();
  }
}
