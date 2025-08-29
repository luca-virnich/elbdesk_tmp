// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:elbdesk_sales/src/soi_step_and_repeat/logic/soi_step_and_repeat_provider.dart';
// import 'package:elbdesk_sales/src/soi_step_and_repeat/models/soi_step_and_repeat.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'soi_step_and_repeat_state.g.dart';

// @riverpod
// class SoiStepAndRepeatState extends _$SoiStepAndRepeatState
//     implements EntityState<SoiStepAndRepeat> {
//   ///@nodoc
//   SoiStepAndRepeatState() {
//     _initializeStateManager();
//   }
//   late final EntityStateManager<SoiStepAndRepeat> _stateManager;

//   void _initializeStateManager() {
//     _stateManager = EntityStateManager<SoiStepAndRepeat>(
//       setLoadingState: () => state = const AsyncLoading(),
//       setDataState: (SoiStepAndRepeat soiStepAndRepeat) =>
//           state = AsyncData(soiStepAndRepeat),
//       setErrorState: (Object error, StackTrace stackTrace) =>
//           state = AsyncError(error, stackTrace),
//       fetchAndLockFn: () => ref
//           .read(soiStepAndRepeatRepositoryProvider)
//           .fetchAndLock(entityId, sessionId),
//       releaseFn: () => ref
//           .read(soiStepAndRepeatRepositoryProvider)
//           .release(entityId, sessionId),
//       fetchByIdFn: () =>
//           ref.read(soiStepAndRepeatRepositoryProvider).fetchById(entityId),
//       updateWithReleaseFn: () =>
//           ref.read(soiStepAndRepeatRepositoryProvider).update(
//                 entity: state.requireValue,
//                 release: true,
//                 sessionId: sessionId,
//               ),
//     );
//   }

//   @override
//   Future<SoiStepAndRepeat> build(int entityId, String sessionId) async {
//     return _stateManager.build(
//       id: entityId,
//       sessionId: sessionId,
//       ref: ref,
//     );
//   }

//   @override
//   Future<void> refetchWithLock() {
//     return _stateManager.refetchWithLock();
//   }

//   @override
//   Future<void> refetchWithoutLock() {
//     return _stateManager.refetchWithoutLock();
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

//   // *
//   // * General
//   // *

//   /// Update the order name
//   void updateDescription(String description) {
//     state = AsyncData(state.requireValue.copyWith(description: description));
//   }

//   /// Update the handling user
//   void updateAssignedAppUser(AppUser assignedAppUser) {
//     // state = AsyncData(
//     //   state.requireValue.copyWith(
//     //     assignedUsers: state.requireValue.assignedUsers
//     //             .where((u) => u.userInfo.id == assignedAppUser.userInfo.id)
//     //             .isEmpty
//     //         ? [...state.requireValue.assignedUsers, assignedAppUser]
//     //         : state.requireValue.assignedUsers
//     //             .where((u) => u.userInfo.id != assignedAppUser.userInfo.id)
//     //             .toList(),
//     //   ),
//     // );
//   }

//   /// Update assigned App User by id
//   Future<void> updateAssignedAppUserById(int appUserId) async {
//     final appUser =
//         await ref.read(fetchAppUserProvider(appUserId, sessionId).future);

//     updateAssignedAppUser(appUser!);
//   }
// }
