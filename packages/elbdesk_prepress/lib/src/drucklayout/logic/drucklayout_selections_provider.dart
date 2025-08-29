import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/drucklayout/repositories/drucklayout_pre_selection_repository.dart';
import 'package:elbdesk_prepress/src/drucklayout/repositories/drucklayout_selection_repository.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drucklayout_selections_provider.g.dart';

/// All Providers used for the Drucklayout Selection and Pre Selection

/// Drucklayout Pre Selection Repository Provider
@riverpod
DrucklayoutPreSelectionRepository drucklayoutPreSelectionRepository(
  Ref ref,
) {
  final endpoint = serverpodClient.drucklayoutPreSelection;
  return DrucklayoutPreSelectionRepository(endpoint: endpoint);
}

/// Drucklayout Selection Repository Provider
@riverpod
DrucklayoutSelectionRepository drucklayoutSelectionRepository(
  Ref ref,
) {
  final endpoint = serverpodClient.drucklayoutSelection;
  return DrucklayoutSelectionRepository(endpoint: endpoint);
}

/// Fetch Drucklayout Selections Provider
@riverpod
Future<List<DrucklayoutSelection>> fetchDrucklayoutSelections(
  Ref ref,
  int? preSelectionId,
) async {
  if (preSelectionId == null) {
    return [];
  }
  final repository = ref.watch(drucklayoutSelectionRepositoryProvider);
  return repository.fetchFromPreSelection(preSelectionId);
}

/// Watch Single Drucklayout Pre Selection Provider
@riverpod
Stream<DrucklayoutPreSelection> watchDrucklayoutPreSelection(
  Ref ref, {
  required String sessionId,
  required int id,
}) async* {
  final streamHelper = ServerpodStreamManager<DrucklayoutPreSelection,
      DrucklayoutPreSelectionDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.drucklayoutPreSelection.watch(
      sessionId: sessionId,
      entityId: id,
    ),
    convertDtoToModel: DrucklayoutPreSelection.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchDrucklayoutPreSelection: $error');
    },
  );
}

/// Watch Single Drucklayout Selection Provider
@riverpod
Stream<DrucklayoutSelection> watchDrucklayoutSelection(
  Ref ref, {
  required String sessionId,
  required int id,
}) async* {
  final streamHelper =
      ServerpodStreamManager<DrucklayoutSelection, DrucklayoutSelectionDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.drucklayoutSelection.watch(
      sessionId: sessionId,
      entityId: id,
    ),
    convertDtoToModel: DrucklayoutSelection.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchDrucklayoutSelection: $error');
    },
  );
}

/// Watch Drucklayout Selections Provider
@riverpod
Stream<DrucklayoutSelection> watchDrucklayoutSelections(
  Ref ref, {
  required int preSelectionId,
}) async* {
  final streamHelper =
      ServerpodStreamManager<DrucklayoutSelection, DrucklayoutSelectionDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.drucklayoutSelection.watchSelection(
      preSelectionId: preSelectionId,
    ),
    convertDtoToModel: DrucklayoutSelection.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchDrucklayoutSelections: $error');
    },
  );
}

/// Watch Drucklayout Pre Selections Provider
@riverpod
Stream<DrucklayoutPreSelection> watchDrucklayoutPreSelections(
  Ref ref, {
  required int? customerId,
}) async* {
  final streamHelper = ServerpodStreamManager<DrucklayoutPreSelection,
      DrucklayoutPreSelectionDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.drucklayoutPreSelection.watchPreSelection(
      customerId: customerId,
    ),
    convertDtoToModel: DrucklayoutPreSelection.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchDrucklayoutPreSelections: $error');
    },
  );
}

/// Fetch and Watch Drucklayout Pre Selections State Provider
@riverpod
class FetchAndWatchDrucklayoutPreSelections
    extends _$FetchAndWatchDrucklayoutPreSelections {
  @override
  Future<List<DrucklayoutPreSelection>> build(
    int? customerId,
  ) async {
    final repository = ref.watch(drucklayoutPreSelectionRepositoryProvider);
    ref.listen(watchDrucklayoutPreSelectionsProvider(customerId: customerId),
        (previous, next) {
      if (next is AsyncData<DrucklayoutPreSelection>) {
        handleEvent(next.value);
      }
    });
    if (customerId == null) {
      return repository.fetchGlobal();
    }
    return repository.fetchByCustomerId(customerId);
  }

  Future<void> handleEvent(DrucklayoutPreSelection event) async {
    final current = await future;
    // Check if the event already exists in the list by ID
    final existingIndex = current.indexWhere((item) => item.id == event.id);
    if (existingIndex != -1) {
      // Update the existing item
      current[existingIndex] = event;
    } else {
      // Add as a new item if it doesn't exist
      current.add(event);
    }
    // Sort the list
    current.sort((a, b) => a.description.compareTo(b.description));
    state = AsyncData(current);
  }
}

/// Fetch and Watch Drucklayout Selections State Provider
@riverpod
class FetchAndWatchDrucklayoutSelections
    extends _$FetchAndWatchDrucklayoutSelections {
  @override
  Future<List<DrucklayoutSelection>> build(
    int preSelectionId,
  ) async {
    final repository = ref.watch(drucklayoutSelectionRepositoryProvider);
    ref.listen(
        watchDrucklayoutSelectionsProvider(preSelectionId: preSelectionId),
        (previous, next) {
      if (next is AsyncData<DrucklayoutSelection>) {
        handleEvent(next.value);
      }
    });
    return repository.fetchFromPreSelection(preSelectionId);
  }

  Future<void> handleEvent(DrucklayoutSelection event) async {
    final current = await future;
    // Check if the event already exists in the list by ID
    final existingIndex = current.indexWhere((item) => item.id == event.id);
    if (existingIndex != -1) {
      // Update the existing item
      current[existingIndex] = event;
    } else {
      // Add as a new item if it doesn't exist
      current.add(event);
    }
    // Sort the list
    current.sort((a, b) => a.description.compareTo(b.description));
    state = AsyncData(current);
  }
}
