import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_template/models/artwork_template_pre_selection.dart';
import 'package:elbdesk_prepress/src/artwork_template/models/artwork_template_selection.dart';
import 'package:elbdesk_prepress/src/artwork_template/repositories/artwork_template_pre_selection_repository.dart';
import 'package:elbdesk_prepress/src/artwork_template/repositories/artwork_template_repository.dart';
import 'package:elbdesk_prepress/src/artwork_template/repositories/artwork_template_selection_repository.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'artwork_template_provider.g.dart';

@riverpod
ArtworkTemplateRepository artworkTemplateRepository(
  Ref ref,
) {
  final endpoint = serverpodClient.artworkTemplate;
  return ArtworkTemplateRepository(ref: ref, endpoint: endpoint);
}

@riverpod
ArtworkTemplatePreSelectionRepository artworkTemplatePreSelectionRepository(
  Ref ref,
) {
  final endpoint = serverpodClient.artworkTemplatePreSelection;
  return ArtworkTemplatePreSelectionRepository(endpoint: endpoint);
}

@riverpod
ArtworkTemplateSelectionRepository artworkTemplateSelectionRepository(
  Ref ref,
) {
  final endpoint = serverpodClient.artworkTemplateSelection;
  return ArtworkTemplateSelectionRepository(endpoint: endpoint);
}

@riverpod
Future<List<ArtworkTemplate>> findArtworkTemplates(
  Ref ref,
  String sessionId,
) async {
  final repository = ref.watch(artworkTemplateRepositoryProvider);
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.artworkTemplate.name,
    ),
  );
  return repository.find(sort: sort, filter: filter);
}

@riverpod
Future<List<ArtworkTemplate>> findGeneralArtworkTemplates(
  Ref ref,
  String sessionId,
) async {
  final repository = ref.watch(artworkTemplateRepositoryProvider);
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.artworkTemplate.name,
    ),
  );
  return repository.findByCustomer(null, sort: sort, filter: filter);
}

@riverpod
Future<List<ArtworkTemplate>> findArtworkTemplatesByCustomer(
  Ref ref,
  int customerId,
  String sessionId, {
  bool includeGeneralTemplates = false,
}) async {
  final repository = ref.watch(artworkTemplateRepositoryProvider);
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.artworkTemplate.name,
    ),
  );
  dlog('findArtworkTemplatesByCustomer $customerId $sort $filter');
  return repository.findByCustomer(
    customerId,
    sort: sort,
    filter: filter,
    includeGeneralTemplates: includeGeneralTemplates,
  );
}

// @riverpod
// Future<List<ArtworkTemplatePreSelection>> fetchArtworkTemplatePreSelections(
//   Ref ref,
//   int customerId,
// ) async {
//   final repository = ref.watch(artworkTemplatePreSelectionRepositoryProvider);
//   return repository.fetchByCustomerId(customerId);
// }

@riverpod
Future<List<ArtworkTemplateSelection>> fetchArtworkTemplateSelections(
  Ref ref,
  int? preSelectionId,
) async {
  if (preSelectionId == null) {
    return [];
  }
  final repository = ref.watch(artworkTemplateSelectionRepositoryProvider);

  return repository.fetchFromPreSelection(preSelectionId);
}

@riverpod
Stream<ArtworkTemplatePreSelection> watchArtworkTemplatePreSelection(
  Ref ref, {
  required String sessionId,
  required int id,
}) async* {
  final streamHelper = ServerpodStreamManager<ArtworkTemplatePreSelection,
      ArtworkTemplatePreSelectionDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.artworkTemplatePreSelection.watch(
      sessionId: sessionId,
      entityId: id,
    ),
    convertDtoToModel: ArtworkTemplatePreSelection.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchArtworkTemplatePreSelection: $error');
    },
  );
}

@riverpod
Stream<ArtworkTemplateSelection> watchArtworkTemplateSelection(
  Ref ref, {
  required String sessionId,
  required int id,
}) async* {
  final streamHelper = ServerpodStreamManager<ArtworkTemplateSelection,
      ArtworkTemplateSelectionDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.artworkTemplateSelection.watch(
      sessionId: sessionId,
      entityId: id,
    ),
    convertDtoToModel: ArtworkTemplateSelection.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchArtworkSelection: $error');
    },
  );
}

@riverpod
Stream<ArtworkTemplate> watchArtworkTemplate(
  Ref ref, {
  required String sessionId,
  required int id,
}) async* {
  final streamHelper =
      ServerpodStreamManager<ArtworkTemplate, ArtworkTemplateDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.artworkTemplate.watchEntity(
      sessionId: sessionId,
      entityId: id,
    ),
    convertDtoToModel: ArtworkTemplate.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchArtwork: $error');
    },
  );
}

@riverpod
Stream<ArtworkTemplateSelection> watchArtworkTemplateSelections(
  Ref ref, {
  required int preSelectionId,
}) async* {
  final streamHelper = ServerpodStreamManager<ArtworkTemplateSelection,
      ArtworkTemplateSelectionDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.artworkTemplateSelection.watchSelection(
      preSelectionId: preSelectionId,
    ),
    convertDtoToModel: ArtworkTemplateSelection.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchArtworkTemplateSelections: $error');
    },
  );
}

@riverpod
Stream<ArtworkTemplatePreSelection> watchArtworkTemplatePreSelections(
  Ref ref, {
  required int? customerId,
}) async* {
  final streamHelper = ServerpodStreamManager<ArtworkTemplatePreSelection,
      ArtworkTemplatePreSelectionDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.artworkTemplatePreSelection.watchPreSelection(
      customerId: customerId,
    ),
    convertDtoToModel: ArtworkTemplatePreSelection.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchArtworkTemplatePreSelections: $error');
    },
  );
}

@riverpod
class FetchAndWatchArtworkTemplatePreSelections
    extends _$FetchAndWatchArtworkTemplatePreSelections {
  @override
  Future<List<ArtworkTemplatePreSelection>> build(
    int? customerId,
  ) async {
    final repository = ref.watch(artworkTemplatePreSelectionRepositoryProvider);
    ref.listen(
        watchArtworkTemplatePreSelectionsProvider(customerId: customerId),
        (previous, next) {
      if (next is AsyncData<ArtworkTemplatePreSelection>) {
        handleEvent(next.value);
      }
    });
    if (customerId == null) {
      return repository.fetchGlobal();
    }
    return repository.fetchByCustomerId(customerId);
  }

  Future<void> handleEvent(ArtworkTemplatePreSelection event) async {
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

@riverpod
class FetchAndWatchArtworkTemplateSelections
    extends _$FetchAndWatchArtworkTemplateSelections {
  @override
  Future<List<ArtworkTemplateSelection>> build(
    int preSelectionId,
  ) async {
    final repository = ref.watch(artworkTemplateSelectionRepositoryProvider);
    ref.listen(
        watchArtworkTemplateSelectionsProvider(preSelectionId: preSelectionId),
        (previous, next) {
      if (next is AsyncData<ArtworkTemplateSelection>) {
        handleEvent(next.value);
      }
    });
    return repository.fetchFromPreSelection(preSelectionId);
  }

  Future<void> handleEvent(ArtworkTemplateSelection event) async {
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
