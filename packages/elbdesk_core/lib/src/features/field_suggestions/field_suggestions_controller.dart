import 'dart:async';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'field_suggestions_controller.freezed.dart';
part 'field_suggestions_controller.g.dart';

/// Controller for field suggestions that handles search term updates with debouncing.
@riverpod
class FieldSuggestionsController extends _$FieldSuggestionsController {
  Timer? _debounceTimer;
  String _currentSearchTerm = '';

  @override
  FutureOr<List<String>> build(
    String tableType,
    String fieldKey,
  ) {
    ref.onDispose(() {
      _debounceTimer?.cancel();
    });

    // Return empty list initially
    return [];
  }

  /// Updates the search term and triggers a debounced search

  Future<void> updateSearchTerm(String searchTerm) async {
    _currentSearchTerm = searchTerm;
    _debounceTimer?.cancel();

    if (searchTerm.isEmpty) {
      // For empty search, fetch immediately without debounce
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() async {
        return ElbDeskCore.fieldSuggestionFunction(
          tableType: tableType,
          fieldKey: fieldKey,
          searchTerm: searchTerm,
        );
      });
      return;
    }

    // Show loading state
    state = const AsyncValue.loading();

    // 200ms debounce is optimal for search-as-you-type
    _debounceTimer = Timer(const Duration(milliseconds: 350), () async {
      // Check if the search term hasn't changed during the debounce period
      if (_currentSearchTerm != searchTerm) {
        return;
      }

      state = await AsyncValue.guard(() async {
        return ElbDeskCore.fieldSuggestionFunction(
          tableType: tableType,
          fieldKey: fieldKey,
          searchTerm: searchTerm,
        );
      });
    });
  }
}

@freezed
class FieldSuggestion with _$FieldSuggestion {
  const factory FieldSuggestion({
    required String tableType,
    required String fieldKey,
    required FilterFieldType fieldType,
  }) = _FieldSuggestion;

  const FieldSuggestion._();
}
