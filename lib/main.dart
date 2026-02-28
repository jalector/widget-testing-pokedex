import 'package:app_pokedex/pages/pokemon_list/pokemon_list.dart';
import 'package:app_pokedex/pokedex/pokedex_api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PokemonList(PokedexApiAdapterDB()),
    );
  }
}
