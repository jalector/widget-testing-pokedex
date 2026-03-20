import 'package:widget_test_pokedex/pokedex/pokedex_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/pokemon.dart';
import 'pokemon_list_provider.dart';

class PokemonList extends StatelessWidget {
  final PokedexApi api;
  const PokemonList(this.api, {super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      key: const Key('pokemon-list-page'),
      create: (_) => PokemonListProvider(api),
      builder: (context, child) {
        final provider = context.watch<PokemonListProvider>();

        return Scaffold(
          appBar: AppBar(title: const Text('Pokedex')),
          body: StreamBuilder(
            stream: provider.list,
            builder: _builder,
          ),
        );
      },
    );
  }

  Widget _builder(BuildContext context, AsyncSnapshot snap) {
    if (snap.hasError) {
      return Text(
        key: const Key('error'),
        snap.error?.toString() ?? 'Error',
      );
    } else if (snap.hasData && (snap.data!.isEmpty)) {
      return const Center(
        key: Key('no-data'),
        child: Text('No data'),
      );
    } else if (snap.hasData && (snap.data!.isNotEmpty)) {
      final List<Pokemon> pokemons = snap.data!;
      return ListView.builder(
        key: const Key('pokemon-list'),
        itemCount: pokemons.length,
        itemBuilder: (_, int index) {
          final pokemon = pokemons[index];

          return ListTile(
            key: Key('pokemon-tile-$index'),
            title: Text('${pokemon.id} ${pokemon.name}'),
            subtitle: Text('${pokemon.type1} ${pokemon.type2}'),
          );
        },
      );
    }

    return const Center(
      key: Key('loading'),
      child: CircularProgressIndicator(),
    );
  }
}
