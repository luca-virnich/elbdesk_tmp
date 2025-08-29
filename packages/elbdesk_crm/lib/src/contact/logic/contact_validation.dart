import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contact_validation.g.dart';

/// Contact General Validation
///
/// Used to validate the communication fields
@riverpod
class ContactGeneralValidation extends _$ContactGeneralValidation {
  @override
  List<String> build(String sessionId) {
    return [];
  }

  /// Adds an error to the state
  void addError(String error) {
    state = [...state, error];
  }

  /// Removes an error from the state
  void removeError(String error) {
    state = state.where((e) => e != error).toList();
  }
}

/// Communication Validation
///
/// Used to validate the communication fields
@riverpod
class ContactCommunicationValidation extends _$ContactCommunicationValidation {
  @override
  List<String> build(String sessionId) {
    return [];
  }

  /// Adds an error to the state
  void addError(String error) {
    state = [...state, error];
  }

  /// Removes an error from the state
  void removeError(String error) {
    state = state.where((e) => e != error).toList();
  }
}
