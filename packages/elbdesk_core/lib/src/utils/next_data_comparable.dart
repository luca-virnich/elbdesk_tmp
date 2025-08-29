import 'package:collection/collection.dart';

bool hasEntityChanges<T>(
  T obj1,
  T obj2, [
  List<String> ignoreFields = const [],
]) {
  return !compareFreezedObjectsIgnoringMeta(obj1, obj2, ignoreFields);
}

bool compareFreezedObjectsIgnoringMeta<T>(
  T obj1,
  T obj2, [
  List<String> ignoreFields = const [],
]) {
  if (obj1 == null && obj2 == null) return true;
  if (obj1 == null || obj2 == null) return false;
  if (obj1.runtimeType != obj2.runtimeType) return false;

  // Freezed-Objekte haben eine toJson-Methode
  final map1 = (obj1 as dynamic).toJson() as Map<String, dynamic>;
  final map2 = (obj2 as dynamic).toJson() as Map<String, dynamic>;

  // Meta-Feld entfernen
  map1.remove('meta');
  map2.remove('meta');

  for (final field in ignoreFields) {
    map1.remove(field);
    map2.remove(field);
  }

  // Tiefenvergleich
  return const DeepCollectionEquality().equals(map1, map2);
}
