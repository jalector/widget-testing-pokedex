import 'package:widget_test_pokedex/model/pokemon.dart';
import 'package:widget_test_pokedex/pages/pokemon_list/pokemon_list.dart';
import 'package:widget_test_pokedex/pokedex/pokedex_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mock_pokemons.dart';
import 'widget_test.mocks.dart';

@GenerateMocks([PokedexApi])
void main() {
  final pokedexApi = MockPokedexApi();

  testWidgets('Should render the app', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: PokemonList(pokedexApi),
    ));

    await tester.pump();

    expect(find.byType(PokemonList), findsOneWidget);
  });

  testWidgets('Should render loading while app is getting info',
      (WidgetTester tester) async {
    final mockData = Pokemon(
      id: 1,
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
    );
    when(pokedexApi.getGeneartion(any)).thenAnswer((_) async => [mockData]);

    await tester.pumpWidget(MaterialApp(
      home: PokemonList(pokedexApi),
    ));

    expect(find.byType(PokemonList), findsOneWidget);
    expect(find.byKey(Key('loading')), findsOneWidget);
  });

  testWidgets('Should render the item list', (WidgetTester tester) async {
    when(pokedexApi.getGeneartion(any)).thenAnswer((_) async => mockList);

    await tester.pumpWidget(MaterialApp(
      home: PokemonList(pokedexApi),
    ));

    await tester.pump();

    expect(find.byKey(Key('pokemon-list')), findsOneWidget);
    expect(find.byKey(Key('pokemon-tile-1')), findsOneWidget);
  });

  testWidgets('Should render error if request fail',
      (WidgetTester tester) async {
    when(pokedexApi.getGeneartion(any)).thenThrow((_) async => 'error');

    await tester.pumpWidget(MaterialApp(
      home: PokemonList(pokedexApi),
    ));

    await tester.pump();

    expect(find.byKey(Key('error')), findsOneWidget);
  });
}
