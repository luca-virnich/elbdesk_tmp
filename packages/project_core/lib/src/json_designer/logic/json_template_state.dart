// import 'dart:async';

// import 'package:elbdesk_client/elbdesk_client.dart';
// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:elbdesk_core/src/features/json_designer/models/json.dart';
// import 'package:elbdesk_core/src/features/json_designer/models/json_template.dart';
// import 'package:elbdesk_core/src/features/json_designer/repositories/json_template_repository.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'json_template_state.g.dart';

// final _initialField = Json(
//   name: 'Items',
//   type: JsonFieldType.object,
//   jsonKey: 'items',
//   jsonValue: '',
//   uuid: const Uuid().v4(),
//   children: {},
// );

// @riverpod
// class JsonTemplateState extends _$JsonTemplateState
//     implements EntityState<JsonTemplate> {
//   JsonTemplateState() {
//     _initializeStateManager();
//   }
//   late final EntityStateManager<JsonTemplate> _stateManager;

//   @override
//   Future<JsonTemplate> build(int entityId, String sessionId) async {
//     return _stateManager.build(
//       id: entityId,
//       sessionId: sessionId,
//       ref: ref,
//     );
//   }

//   void _initializeStateManager() {
//     _stateManager = EntityStateManager<JsonTemplate>(
//       setLoadingState: () => state = const AsyncLoading(),
//       setDataState: (JsonTemplate jsonTemplate) =>
//           state = AsyncData(jsonTemplate),
//       setErrorState: (Object error, StackTrace stackTrace) =>
//           state = AsyncError(error, stackTrace),
//       fetchAndLockFn: () => ref
//           .read(jsonTemplateRepositoryProvider)
//           .fetchAndLock(entityId, sessionId),
//       releaseFn: () =>
//           ref.read(jsonTemplateRepositoryProvider).release(entityId, sessionId),
//       fetchByIdFn: () =>
//           ref.read(jsonTemplateRepositoryProvider).fetchById(entityId),
//       updateWithReleaseFn: () =>
//           ref.read(jsonTemplateRepositoryProvider).update(
//                 entity: state.requireValue,
//                 release: true,
//                 sessionId: sessionId,
//               ),
//     );
//   }

//   @override
//   Future<void> refetchWithoutLock() async {
//     return _stateManager.refetchWithoutLock();
//   }

//   @override
//   Future<void> refetchWithLock() async {
//     return _stateManager.refetchWithLock();
//   }

//   @override
//   Future<void> saveAndUnlockAndRefetch() async {
//     return _stateManager.saveAndUnlockAndRefetch();
//   }

//   @override
//   void updateMetaAfterSave() {
//     final userId = ref.read(authUserStateProvider)!.id!;

//     state = AsyncData(
//       state.requireValue.copyWith.meta(
//         lastModifiedAt: DateTime.now(),
//         lastModifiedById: userId,
//         isDraft: false,
//       ),
//     );
//   }

//   void updateName(String name) {
//     final template = state.requireValue;
//     final updatedTemplate = template.copyWith(name: name);
//     state = AsyncValue.data(updatedTemplate);
//   }

//   void addField(Json field, {String? parentUuid}) {
//     final template = state.requireValue;
//     final current = <String, Json>{
//       template.jsonTree.uuid: template.jsonTree,
//     };

//     if (parentUuid != null) {
//       bool addFieldToParent(Map<String, Json> fields, String parentUuid) {
//         final parent = fields[parentUuid];
//         if (parent != null) {
//           final updatedChildren = Map<String, Json>.from(parent.children ?? {});
//           updatedChildren[field.uuid] = field;
//           fields[parentUuid] = parent.copyWith(children: updatedChildren);
//           return true;
//         } else {
//           for (final child in fields.values) {
//             if (child.children != null) {
//               final mutableChildren = Map<String, Json>.from(child.children!);
//               if (addFieldToParent(mutableChildren, parentUuid)) {
//                 fields[child.uuid] = child.copyWith(children: mutableChildren);
//                 return true;
//               }
//             }
//           }
//         }
//         return false;
//       }

//       addFieldToParent(current, parentUuid);
//     } else {
//       current[field.uuid] = field;
//     }

//     final updatedTemplate = template.copyWith(
//       jsonTree: current.values.first,
//     );

//     state = AsyncValue.data(updatedTemplate);
//   }

//   void removeField(String uuid, {String? parentUuid}) {
//     final template = state.requireValue;
//     final current = <String, Json>{
//       template.jsonTree.uuid: template.jsonTree,
//     };

//     if (parentUuid != null) {
//       bool removeFieldFromParent(
//         Map<String, Json> fields,
//         String parentUuid,
//       ) {
//         final parent = fields[parentUuid];
//         if (parent != null && parent.children != null) {
//           final updatedChildren = Map<String, Json>.from(parent.children!);
//           if (updatedChildren.remove(uuid) != null) {
//             fields[parentUuid] = parent.copyWith(children: updatedChildren);
//             return true;
//           }
//         }
//         for (final child in fields.values) {
//           if (child.children != null) {
//             final mutableChildren = Map<String, Json>.from(child.children!);
//             if (removeFieldFromParent(mutableChildren, parentUuid)) {
//               fields[child.uuid] = child.copyWith(children: mutableChildren);
//               return true;
//             }
//           }
//         }
//         return false;
//       }

//       removeFieldFromParent(current, parentUuid);
//     } else {
//       current.remove(uuid);
//     }

//     if (current.isEmpty) {
//       current[_initialField.uuid] = _initialField;
//     }

//     final updatedTemplate = template.copyWith(
//       jsonTree: current.values.first,
//     );

//     state = AsyncValue.data(updatedTemplate);
//   }

//   // void updateField(Json field, {String? parentUuid}) {
//   //   final template = state.requireValue;
//   //   final current = <String, Json>{
//   //     template.jsonTree.uuid: template.jsonTree,
//   //   };

//   //   if (parentUuid != null) {
//   //     final parent = current[parentUuid];
//   //     if (parent != null && parent.children != null) {
//   //       final updatedChildren = {...parent.children!, field.uuid: field};
//   //       current[parentUuid] = parent.copyWith(children: updatedChildren);
//   //     }
//   //   } else {
//   //     current[field.uuid] = field;
//   //   }

//   //   final updatedTemplate = template.copyWith(
//   //     jsonTree: current.values.first,
//   //   );

//   //   state = AsyncValue.data(updatedTemplate);
//   // }

//   void updateField(Json field, {String? parentUuid}) {
//     final template = state.requireValue;
//     final current = <String, Json>{
//       template.jsonTree.uuid: template.jsonTree,
//     };

//     bool updateFieldInTree(Map<String, Json> fields, Json fieldToUpdate) {
//       if (fields.containsKey(fieldToUpdate.uuid)) {
//         fields[fieldToUpdate.uuid] = fieldToUpdate;
//         return true;
//       }
//       for (final child in fields.values) {
//         if (child.children != null) {
//           final mutableChildren = Map<String, Json>.from(child.children!);
//           if (updateFieldInTree(mutableChildren, fieldToUpdate)) {
//             fields[child.uuid] = child.copyWith(children: mutableChildren);
//             return true;
//           }
//         }
//       }
//       return false;
//     }

//     if (parentUuid != null) {
//       updateFieldInTree(current, field);
//     } else {
//       current[field.uuid] = field;
//     }

//     final updatedTemplate = template.copyWith(
//       jsonTree: current.values.first,
//     );

//     state = AsyncValue.data(updatedTemplate);
//   }

//   Json? toJsonTree() {
//     final template = state.requireValue;
//     final currentState = <String, Json>{
//       template.jsonTree.uuid: template.jsonTree,
//     };
//     final jsonMap = <String, Json>{};

//     for (final entry in currentState.entries) {
//       final field = entry.value;
//       if (field.children != null) {
//         jsonMap[field.jsonKey] = Json(
//           name: field.name,
//           type: field.type,
//           jsonKey: field.jsonKey,
//           jsonValue: field.jsonValue,
//           uuid: field.uuid,
//           children: field.children,
//         );
//       } else {
//         jsonMap[field.jsonKey] = field;
//       }
//     }

//     final jsonTree = Json(
//       name: 'Items',
//       type: JsonFieldType.object,
//       jsonKey: 'items',
//       jsonValue: '',
//       children: jsonMap,
//       uuid: const Uuid().v4(),
//     );
//     return jsonTree;
//   }
// }

// @riverpod
// Stream<JsonTemplate> watchJsonTemplate(
//   Ref ref, {
//   required String sessionId,
//   required int jsonTemplateId,
// }) async* {
//   final streamHelper = EntityStreamManager<JsonTemplate, JsonTemplateDTO>();
//   yield* streamHelper.setupStream(
//     ref: ref,
//     startListening: () => serverpodClient.jsonTemplate.watch(
//       StreamController<JsonTemplateDTO>.broadcast().stream,
//       sessionId: sessionId,
//       entityId: jsonTemplateId,
//     ),
//     convertDtoToModel: JsonTemplate.fromDTO,
//     onError: (error) {
//       dlog('Error occurred in streamJsonTemplate: $error');
//     },
//   );
// }
