import 'package:widget_test_pokedex/pages/pokemon_list/pokemon_list.dart';
import 'package:widget_test_pokedex/pokedex/pokedex_api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Testing Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: PokemonList(PokedexApiAdapter()),
      home: PokemonList(PokedexApiAdapterDB()),
    );
  }
}
