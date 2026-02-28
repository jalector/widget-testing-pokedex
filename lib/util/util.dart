import 'dart:developer' as dev;

class Util {
  static List<T> getCollectionOf<T>(
      dynamic json, T Function(Map<String, dynamic>) parser) {
    List<T> items = [];
    for (var item in json) {
      try {
        items.add(parser(item));
      } on NoSuchMethodError catch (e) {
        dev.log(
            "[YUDA, ERROR] Mapping $T: Tipo de dato inesperado ${e.toString()}");
      } catch (e) {
        dev.log("[YUDA, ERROR] Mapping $T: ${e.toString()}");
      }
    }
    return items;
  }
}
