import 'dart:math';

// Simulating the old approach
class OldApproach {
  static final Map<String, TestEnum> _fieldNameToEnum = {
    for (final field in TestEnum.values) field.name: field,
  };
  
  static final Map<TestEnum, String> _fieldCache = {
    for (final field in TestEnum.values) field: 'Field_${field.name}',
  };
  
  static String fromEnum(TestEnum field) => _fieldCache[field]!;
  
  static String fromFieldKey(String fieldKey) {
    final field = _fieldNameToEnum[fieldKey];
    if (field == null) throw ArgumentError('Unknown field key: $fieldKey');
    return _fieldCache[field]!;
  }
}

// Simulating the new approach with FieldCache
class FieldCache<T extends Enum> {
  FieldCache({required List<T> values, required String Function(T) createField}) {
    _fieldNameToEnum = {for (final field in values) field.name: field};
    _fieldCache = {for (final field in values) field: createField(field)};
  }
  
  late final Map<String, T> _fieldNameToEnum;
  late final Map<T, String> _fieldCache;
  
  String fromEnum(T field) => _fieldCache[field]!;
  
  String fromFieldKey(String fieldKey) {
    final field = _fieldNameToEnum[fieldKey];
    if (field == null) throw ArgumentError('Unknown field key: $fieldKey');
    return _fieldCache[field]!;
  }
}

class NewApproach {
  static final _cache = FieldCache<TestEnum>(
    values: TestEnum.values,
    createField: (field) => 'Field_${field.name}',
  );
  
  static String fromEnum(TestEnum field) => _cache.fromEnum(field);
  static String fromFieldKey(String fieldKey) => _cache.fromFieldKey(fieldKey);
}

enum TestEnum { field1, field2, field3, field4, field5, field6, field7, field8, field9, field10 }

void main() {
  final random = Random();
  final testFields = List.generate(1000000, (_) => 
      TestEnum.values[random.nextInt(TestEnum.values.length)]);
  final testKeys = testFields.map((f) => f.name).toList();
  
  // Warm up JIT
  for (var i = 0; i < 10000; i++) {
    OldApproach.fromEnum(TestEnum.field1);
    NewApproach.fromEnum(TestEnum.field1);
  }
  
  // Benchmark fromEnum
  print('=== fromEnum Benchmark (1M lookups) ===');
  
  final oldStart = DateTime.now();
  for (final field in testFields) {
    OldApproach.fromEnum(field);
  }
  final oldDuration = DateTime.now().difference(oldStart);
  print('Old approach: ${oldDuration.inMicroseconds}μs');
  
  final newStart = DateTime.now();
  for (final field in testFields) {
    NewApproach.fromEnum(field);
  }
  final newDuration = DateTime.now().difference(newStart);
  print('New approach: ${newDuration.inMicroseconds}μs');
  
  final diff = ((newDuration.inMicroseconds - oldDuration.inMicroseconds) / 
                oldDuration.inMicroseconds * 100).toStringAsFixed(2);
  print('Difference: $diff%');
  
  // Benchmark fromFieldKey
  print('\n=== fromFieldKey Benchmark (1M lookups) ===');
  
  final oldKeyStart = DateTime.now();
  for (final key in testKeys) {
    OldApproach.fromFieldKey(key);
  }
  final oldKeyDuration = DateTime.now().difference(oldKeyStart);
  print('Old approach: ${oldKeyDuration.inMicroseconds}μs');
  
  final newKeyStart = DateTime.now();
  for (final key in testKeys) {
    NewApproach.fromFieldKey(key);
  }
  final newKeyDuration = DateTime.now().difference(newKeyStart);
  print('New approach: ${newKeyDuration.inMicroseconds}μs');
  
  final keyDiff = ((newKeyDuration.inMicroseconds - oldKeyDuration.inMicroseconds) / 
                   oldKeyDuration.inMicroseconds * 100).toStringAsFixed(2);
  print('Difference: $keyDiff%');
}