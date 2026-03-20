enum PokemonGeneration { kanto, johto, hoenn }

extension PokemonGenerationExtension on PokemonGeneration {
  int get number => PokemonGeneration.values.indexOf(this) + 1;
}
