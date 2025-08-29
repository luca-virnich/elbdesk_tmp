import 'dart:convert';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/features/recent_windows/repositories/recent_window_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recent_window.freezed.dart';
part 'recent_window.g.dart';

@freezed
class RecentWindow with _$RecentWindow {
  factory RecentWindow({
    required String type,
    required int? entityId,
    required String label,
    Map<String, dynamic>? additionalData,
  }) = _RecentWindow;

  const RecentWindow._();

  factory RecentWindow.fromDTO(RecentWindowDTO dto) {
    return RecentWindow(
      type: dto.type,
      entityId: dto.entityId,
      label: dto.label,
      additionalData: dto.additionalData != null
          ? jsonDecode(dto.additionalData!) as Map<String, dynamic>?
          : null,
    );
  }

  RecentWindowDTO toDTO() {
    return RecentWindowDTO(
      type: type,
      entityId: entityId,
      label: label,
      additionalData:
          additionalData != null ? jsonEncode(additionalData) : null,
    );
  }
}

@riverpod
class RecentWindows extends _$RecentWindows {
  @override
  Future<List<RecentWindow>> build() async {
    final initialValues =
        await ref.read(recentWindowRepositoryProvider).fetchRecentWindows();
    return initialValues;
  }

  void insertEntityWindow(RecentWindow window) {
    _saveToServer(window, true);

    final currentState = state.valueOrNull;
    if (currentState == null) return;
    final index = currentState.indexWhere(
      (element) =>
          element.type == window.type && element.entityId == window.entityId,
    );
    if (index == -1) {
      state = AsyncData([window, ...currentState]);
    } else {
      state = AsyncData([
        window,
        ...currentState.sublist(0, index),
        ...currentState.sublist(index + 1),
      ]);
    }
  }

  void updateEntityWindow(RecentWindow window) {
    _saveToServer(window, false);
    final currentState = state.valueOrNull;
    if (currentState == null) return;
    final index = currentState.indexWhere(
      (element) =>
          element.type == window.type && element.entityId == window.entityId,
    );
    if (index == -1) {
      return;
    } else {
      state = AsyncData(
        currentState
            .map(
              (element) => element.type == window.type &&
                      element.entityId == window.entityId
                  ? window
                  : element,
            )
            .toList(),
      );
    }
  }

  void _saveToServer(RecentWindow window, bool isInserted) {
    ref
        .read(recentWindowRepositoryProvider)
        .addRecentWindow(window, isInserted: isInserted);
  }
}
