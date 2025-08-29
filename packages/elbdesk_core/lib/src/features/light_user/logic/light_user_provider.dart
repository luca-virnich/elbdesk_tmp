import 'dart:async';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/features/light_user/repositories/light_user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'light_user_provider.g.dart';

@riverpod
LightUserRepository lightUserRepository(Ref ref) {
  return LightUserRepository(
    endpoint: EndpointLightUser(ElbDeskCore.client),
  );
}

@riverpod
Stream<LightUser> watchLightUserStream(
  Ref ref,
) async* {
  final streamHelper = ServerpodStreamManager<LightUser, LightUserDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => EndpointLightUser(ElbDeskCore.client).watch(),
    convertDtoToModel: LightUser.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamLightUser: $error');
    },
  );
}

@riverpod
class CachedLightUserMapByUserInfoId extends _$CachedLightUserMapByUserInfoId {
  @override
  Map<int, LightUser> build() {
    return {};
  }

  void initialize(List<LightUser> lightUsers) {
    final asMap = Map.fromEntries(
      lightUsers.map(
        (lightUser) => MapEntry(lightUser.userInfoId, lightUser),
      ),
    );
    state = asMap;
  }

  void update(LightUser lightUser) {
    state = {
      ...state,
      lightUser.userInfoId: lightUser,
    };
  }
}

@riverpod
class CachedLightUserMapByLightUserId
    extends _$CachedLightUserMapByLightUserId {
  @override
  Map<int, LightUser> build() {
    return {};
  }

  void initialize(List<LightUser> lightUsers) {
    final asMap = Map.fromEntries(
      lightUsers.map(
        (lightUser) => MapEntry(lightUser.lightUserId, lightUser),
      ),
    );
    state = asMap;
  }

  void update(LightUser lightUser) {
    state = {
      ...state,
      lightUser.lightUserId: lightUser,
    };
  }
}

@riverpod
class WatchAllLightUsers extends _$WatchAllLightUsers {
  @override
  Future<List<LightUser>> build() async {
    final lightUsers = await ref.watch(lightUserRepositoryProvider).fetchAll();
    ref.listen(watchLightUserStreamProvider, (previous, next) {
      if (next is AsyncData<LightUser>) {
        handleEvent(next.value);
      }
    });
    ref
        .read(cachedLightUserMapByUserInfoIdProvider.notifier)
        .initialize(state.asData?.value ?? lightUsers);
    ref
        .read(cachedLightUserMapByLightUserIdProvider.notifier)
        .initialize(state.asData?.value ?? lightUsers);

    return state.asData?.value ?? lightUsers;
  }

  void handleEvent(LightUser lightUser) {
    final currentList = state
        .whenData(
          (list) => [...list],
        )
        .requireValue;
    // add when not in list, update when in list
    final newList = currentList.any(
      (currentUser) => currentUser.userInfoId == lightUser.userInfoId,
    )
        ? currentList
            .map(
              (currentUser) => currentUser.userInfoId == lightUser.userInfoId
                  ? lightUser
                  : currentUser,
            )
            .toList()
        : [lightUser, ...currentList]
      ..sort((a, b) => a.fullName.compareTo(b.fullName));
    ref.read(cachedLightUserMapByUserInfoIdProvider.notifier).update(lightUser);
    ref
        .read(cachedLightUserMapByLightUserIdProvider.notifier)
        .update(lightUser);
    state = AsyncData(newList);
  }
}

@riverpod
Future<List<LightUser>> watchAllActiveLightUsers(Ref ref) async {
  final allUsers = await ref.watch(watchAllLightUsersProvider.future);
  return allUsers.where((lightUser) => lightUser.isActive).toList();
}

@riverpod
Future<List<LightUser>> watchAllInactiveLightUsers(Ref ref) async {
  final allUsers = await ref.watch(watchAllLightUsersProvider.future);
  return allUsers.where((lightUser) => !lightUser.isActive).toList();
}

@riverpod
LightUser fetchLocalLightUserByUserInfoId(Ref ref, int userInfoId) {
  final users = ref.watch(cachedLightUserMapByUserInfoIdProvider);
  return users[userInfoId]!;
}

@riverpod
LightUser fetchLocalLightUserByLightUserId(Ref ref, int lightUserId) {
  final users = ref.watch(cachedLightUserMapByLightUserIdProvider);
  return users[lightUserId]!;
}
