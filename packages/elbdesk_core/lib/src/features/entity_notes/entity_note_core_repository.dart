import 'dart:async';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entity_note_core_repository.g.dart';

@riverpod
EntityNoteCoreRepository entityNoteCoreRepository(Ref ref) {
  return EntityNoteCoreRepository(
    endpointCore: EndpointEntityNoteCore(
      ElbDeskCore.client,
    ),
  );
}

class EntityNoteCoreRepository {
  EntityNoteCoreRepository({
    required this.endpointCore,
  });

  final EndpointEntityNoteCore endpointCore;

  Future<void> createNote(EntityNote note, List<Mention> mentions) async {
    final message = Parser.parseMessageToDbEntry(note.message, mentions);
    final newNote = note.copyWith(message: message);
    await endpointCore.createNote(newNote.toDTO());
  }

  Future<void> updateNote(EntityNote note) async {
    final message = Parser.parseMessageToDbEntry(note.message, note.mentions);
    final updatedNote = note.copyWith(message: message);
    await endpointCore.updateNote(updatedNote.toDTO());
  }

  Future<void> deleteNote(EntityNote note) async {
    await endpointCore.deleteNote(note.toDTO());
  }

  Future<void> restoreNote(EntityNote note) async {
    await endpointCore.restoreNote(note.toDTO());
  }

  Future<List<EntityNote>> fetchNotes(String tableType, int entityId) async {
    final dtos = await endpointCore.fetchNotes(
      tableType: tableType,
      entityId: entityId,
    );
    return dtos.map(EntityNote.fromDTO).toList();
  }
}

@riverpod
Future<List<EntityNote>> fetchNotes(
  Ref ref,
  String tableType,
  int entityId,
) async {
  return ref
      .watch(entityNoteCoreRepositoryProvider)
      .fetchNotes(tableType, entityId);
}

@riverpod
Stream<EntityNote> watchNotesStream(
  Ref ref,
  String tableType,
  int entityId,
) async* {
  final streamHelper = ServerpodStreamManager<EntityNote, EntityNoteDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => EndpointEntityNoteCore(
      ElbDeskCore.client,
    ).watch(
      entityId: entityId,
      tableType: tableType,
    ),
    convertDtoToModel: EntityNote.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamNotes: $error');
    },
  );
}

@riverpod
class WatchNotes extends _$WatchNotes {
  @override
  Future<List<EntityNote>> build(String tableType, int entityId) async {
    final notes = await ref.watch(
      fetchNotesProvider(tableType, entityId).future,
    );

    ref.listen(
      watchNotesStreamProvider(tableType, entityId),
      (previous, next) {
        if (next is AsyncData<EntityNote>) {
          handleEvent(next.value);
        }
      },
    );
    // all notes

    // the list of notes with children, the children are not in the list
    // but should be added to the children of the parent note
    final notesWithChildren = buildNoteHierarchy(notes);
    // Return only parent notes with their children

    return notesWithChildren;
  }

  Future<void> handleEvent(EntityNote updatedNote) async {
    final currentList = state
        .whenData(
          (list) => [...list],
        )
        .requireValue;
    // Flatten the current list to work with all notes
    final flattened =
        currentList.expand((note) => [note, ...note.children]).toList();

    // Check if the note already exists
    final existingNoteIndex =
        flattened.indexWhere((note) => note.id == updatedNote.id);

    final List<EntityNote> newList;
    if (existingNoteIndex != -1) {
      // Replace the existing note
      flattened[existingNoteIndex] = updatedNote;
      newList = flattened;
    } else {
      // Add the new note
      newList = [updatedNote, ...flattened];
    }

    // Remove duplicates based on ID
    final uniqueNotes = newList.fold<List<EntityNote>>([], (prev, note) {
      if (!prev.any((n) => n.id == note.id)) {
        prev.add(note);
      }
      return prev;
    });

    final nested = buildNoteHierarchy(uniqueNotes);
    state = AsyncData(nested);
  }
}

List<EntityNote> updateNoteHierarchy(List<EntityNote> notes) {
  final flattened = notes.expand((note) => [note, ...note.children]).toList();
  final nested = buildNoteHierarchy(flattened);
  return nested;
}

List<EntityNote> buildNoteHierarchy(List<EntityNote> notes) {
  // Create a map for quick access to notes via ID
  final noteMap = <int, EntityNote>{};

  // First pass: Create copies of all notes with empty children lists
  for (final note in notes) {
    if (note.id != null) {
      noteMap[note.id!] = note.copyWith(children: []);
    }
  }

  // Second pass: Build parent-child relationships with new mutable lists
  for (final note in notes) {
    if (note.parentId != null && note.id != null) {
      final parent = noteMap[note.parentId];
      if (parent != null) {
        // Create a new children list with the added child
        final updatedChildren = [...parent.children, noteMap[note.id] ?? note];
        // Update the parent in the map with the new children list
        noteMap[parent.id!] = parent.copyWith(children: updatedChildren);
      }
    }
  }

  // Return only root notes (parentId == null)
  return notes
      .where((note) => note.parentId == null)
      .map((note) => note.id != null ? noteMap[note.id]! : note)
      .toList();
}

@riverpod
Future<List<EntityNote>> entityNoteThread(
  Ref ref,
  String tableType,
  int entityId,
  String floatingWindowId,
) async {
  final parentId =
      ref.watch(noteThreadIdProvider(tableType, entityId, floatingWindowId));

  if (parentId == null) {
    return [];
  }
  final allNotes =
      await ref.watch(watchNotesProvider(tableType, entityId).future);

  return allNotes
      .where((note) => note.parentId == parentId || note.id == parentId)
      .toList();
}

@riverpod
class NoteThreadId extends _$NoteThreadId {
  @override
  int? build(String tableType, int entityId, String floatingWindowId) {
    ref.cacheFor(const Duration(seconds: 5));
    return null;
  }

  void updateParentId(int? value) {
    state = value;
  }
}
