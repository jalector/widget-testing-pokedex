class Pokemon {
  Pokemon({
    this.id = 0,
    this.pokemonId = '0',
    this.name = '',
    this.form = '',
    this.type1 = '',
    this.type2 = '',
    this.generation = 0,
    this.atk = 0,
    this.sta = 0,
    this.def = 0,
    this.maxcp = 0,
  });

  int id;
  String pokemonId;
  String name;
  dynamic form;
  String type1;
  String type2;
  int generation;
  int atk;
  int sta;
  int def;
  int maxcp;

  factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        pokemonId: json["pokemonId"],
        name: json["name"],
        form: json["form"],
        type1: json["type1"],
        type2: json["type2"],
        generation: json["generation"],
        atk: json["atk"],
        sta: json["sta"],
        def: json["def"],
        maxcp: json["maxcp"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "pokemonId": pokemonId,
        "name": name,
        "form": form,
        "type1": type1,
        "type2": type2,
        "generation": generation,
        "atk": atk,
        "sta": sta,
        "def": def,
        "maxcp": maxcp,
      };
}
