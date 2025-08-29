// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_note_notification_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntityNotificationOvlerayImpl _$$EntityNotificationOvlerayImplFromJson(
        Map<String, dynamic> json) =>
    _$EntityNotificationOvlerayImpl(
      message: json['message'] as String,
      type: $enumDecode(_$EntityNotificationOverlayTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$EntityNotificationOvlerayImplToJson(
        _$EntityNotificationOvlerayImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'type': _$EntityNotificationOverlayTypeEnumMap[instance.type]!,
    };

const _$EntityNotificationOverlayTypeEnumMap = {
  EntityNotificationOverlayType.newMessage: 'newMessage',
  EntityNotificationOverlayType.updatedMessage: 'updatedMessage',
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$entityNoteNotificationRepositoryHash() =>
    r'3b040db84d4db3331a75cb6c051499ba4bf1819e';

/// See also [entityNoteNotificationRepository].
@ProviderFor(entityNoteNotificationRepository)
final entityNoteNotificationRepositoryProvider =
    AutoDisposeProvider<EntityNoteNotificationRepository>.internal(
  entityNoteNotificationRepository,
  name: r'entityNoteNotificationRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$entityNoteNotificationRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef EntityNoteNotificationRepositoryRef
    = AutoDisposeProviderRef<EntityNoteNotificationRepository>;
String _$fetchEntityNoteNotificationsHash() =>
    r'47c6358c515f1dfd3abd6203685160e5fa850ad0';

/// See also [fetchEntityNoteNotifications].
@ProviderFor(fetchEntityNoteNotifications)
final fetchEntityNoteNotificationsProvider =
    AutoDisposeFutureProvider<List<EntityNoteNotification>>.internal(
  fetchEntityNoteNotifications,
  name: r'fetchEntityNoteNotificationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchEntityNoteNotificationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchEntityNoteNotificationsRef
    = AutoDisposeFutureProviderRef<List<EntityNoteNotification>>;
String _$watchEntityNoteNotificationsStreamHash() =>
    r'2a5728907edc68bf5b7a6f31c2bf1474670465f1';

/// See also [watchEntityNoteNotificationsStream].
@ProviderFor(watchEntityNoteNotificationsStream)
final watchEntityNoteNotificationsStreamProvider =
    AutoDisposeStreamProvider<EntityNoteNotification>.internal(
  watchEntityNoteNotificationsStream,
  name: r'watchEntityNoteNotificationsStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchEntityNoteNotificationsStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchEntityNoteNotificationsStreamRef
    = AutoDisposeStreamProviderRef<EntityNoteNotification>;
String _$getUnreadNotificationsCountHash() =>
    r'89c6edeb1c3430cb61a63ff35951d62f2a7286fd';

/// See also [getUnreadNotificationsCount].
@ProviderFor(getUnreadNotificationsCount)
final getUnreadNotificationsCountProvider =
    AutoDisposeFutureProvider<int>.internal(
  getUnreadNotificationsCount,
  name: r'getUnreadNotificationsCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getUnreadNotificationsCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetUnreadNotificationsCountRef = AutoDisposeFutureProviderRef<int>;
String _$watchEntityNoteNotificationsHash() =>
    r'507ee8342e2d1f64d10962ed45e7b6c36ad39c7f';

/// See also [WatchEntityNoteNotifications].
@ProviderFor(WatchEntityNoteNotifications)
final watchEntityNoteNotificationsProvider = AutoDisposeAsyncNotifierProvider<
    WatchEntityNoteNotifications, List<EntityNoteNotification>>.internal(
  WatchEntityNoteNotifications.new,
  name: r'watchEntityNoteNotificationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchEntityNoteNotificationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WatchEntityNoteNotifications
    = AutoDisposeAsyncNotifier<List<EntityNoteNotification>>;
String _$notificationOverlayStateHash() =>
    r'ccaf144bec364f7ddff936a40425802a656f3a88';

/// See also [NotificationOverlayState].
@ProviderFor(NotificationOverlayState)
final notificationOverlayStateProvider = AutoDisposeNotifierProvider<
    NotificationOverlayState, EntityNotificationOvleray?>.internal(
  NotificationOverlayState.new,
  name: r'notificationOverlayStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationOverlayStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NotificationOverlayState
    = AutoDisposeNotifier<EntityNotificationOvleray?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
