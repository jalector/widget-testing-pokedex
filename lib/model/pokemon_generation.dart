enum PokemonGeneration { kanto, johto, hoenn }

extension PokemonGenerationExtension on PokemonGeneration {
  int get number {
    int i = 1;
    
    switch (this) {
      case PokemonGeneration.kanto:
        i = 1;
        break;
      case PokemonGeneration.johto:
        i = 2;
        break;
      case PokemonGeneration.hoenn:
        i = 3;
        break;
    }

    return i;
  }
}
