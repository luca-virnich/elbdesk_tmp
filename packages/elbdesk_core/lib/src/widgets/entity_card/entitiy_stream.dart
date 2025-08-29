import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// This widget is mounted into every entity card and handles the current
/// state of the entity edit requests.
class EntityStream<T extends HasMetaData> extends HookConsumerWidget {
  const EntityStream({
    required this.sessionId,
    required this.dataId,
    required this.onRefresh,
    required this.floatingWindowId,
    required this.streamDataProvider,
    required this.tableType,
    // required this.saveAndRelease,

    required this.onRelease,
    // required this.data,
    required this.stateProvider,
    required this.navigatorKey,
    required this.hasRequestedEditNotifier,
    required this.refetchWithoutLock,
    required this.formKey,
    super.key,
  });
  final GlobalKey<FormState>? formKey;
  final String sessionId;
  final int dataId;
  final void Function(String editingSessionId, int dataId) onRefresh;
  final String floatingWindowId;
  final Future<void> Function(
    String editingSessionId,
    int dataId,
    GlobalKey<NavigatorState>?,
  ) onRelease;

  // final T data;
  final ProviderListenable<AsyncValue<T>> Function(
    int entityId,
    String editingSessionId,
  ) stateProvider;

  final ProviderListenable<AsyncValue<T>> Function({
    required String sessionId,
    required int dataId,
  }) streamDataProvider;

  final String tableType;
  // final Future<void> Function(T, String) saveAndRelease;

  final GlobalKey<NavigatorState>? navigatorKey;
  final Future<void> Function(int, String) refetchWithoutLock;
  final ValueNotifier<bool> hasRequestedEditNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // the current logged in user id
    final myUserId = sessionManager.signedInUser?.id;

    // the meta data of the entity
    final meta = ref.watch(
      stateProvider(dataId, sessionId)
          .select((value) => value.requireValue.meta),
    );

    // the user id of the user who is editing the entity from the meta data
    final editinyById = useState<int?>(meta.editingById);

    // the name of the user who is editing the entity
    final editByName = editinyById.value == null
        ? ''
        : editinyById.value == 1
            ? 'System'
            : ref
                .watch(
                  fetchLocalLightUserByUserInfoIdProvider(editinyById.value!),
                )
                .fullName;

    // the type who is editing the entity
    // same: the entity is being edited by the user in the same window
    // you: the entity is being edited by the user in another window
    // other: the entity is being edited by another user
    // none: the entity is not being edited
    final editByState = useState<DataEditType>(
      meta.editingSessionId == sessionId
          ? DataEditType.same
          : meta.editingSessionId == null
              ? DataEditType.none
              : meta.editingById == myUserId
                  ? DataEditType.you
                  : DataEditType.other,
    );

    final showCanEditBar = useValueNotifier<bool>(false);

    // listen to the stream of the entity data to handle updates (from the
    // server)
    ref.listen<AsyncValue<T>>(
      streamDataProvider(sessionId: sessionId, dataId: dataId),
      // we only get updates from another sessionId
      (previous, next) {
        // getting the updated data from the stream
        final updatedData = next.asData?.value;
        if (updatedData == null) return;

        // getting the user id of the user who now edits the entity
        final editingById = updatedData.meta.editingById;
        editinyById.value = editingById;
        // the current session id of the editing entity (can be null)
        final newSessionId = updatedData.meta.editingSessionId;

        // this executes when the session is free and we are not editing
        if (newSessionId == null) {
          // no one is now editing the entity

          if (editByState.value == DataEditType.same) {
            // we were in edit mode before and actively changed the status
            // by ourself (released it manually)

            // we dont want to show the green bar as we actively changed the
            showCanEditBar.value = false;
            // we are re-fetching the data to get the latest state
            refetchWithoutLock(dataId, sessionId);
          } else {
            // session got released by another user, its still null and can
            // be edited

            // as the session changed to free, it could be that there are
            // changes, if we have changes, show an update info
            final data =
                ref.read(stateProvider(dataId, sessionId)).requireValue;

            final hasChanges = hasEntityChanges(data, updatedData);

            if (hasChanges) {
              ref
                  .read(dataHasUpdatesProvider(sessionId).notifier)
                  .setHasUpdates();
              // if the window is in front, we want to highlight it to get
              // the users attention
              final isInFront =
                  ref.read(windowManagerProvider).isInFront(floatingWindowId);
              if (isInFront) {
                ref
                    .read(windowManagerProvider)
                    .startHighlight(floatingWindowId);
              }
            }

            // we can now show the green bar as the session is free and we
            // have no changes
            showCanEditBar.value = true;
          }
          // the new sate is none, as the session is free
          editByState.value = DataEditType.none;
          return;
        }

        // handle all other cases, sessionId is not null and we've got an
        // update

        // we are editing, this could be after we saved changes without
        // closing the window or when we started now editing
        if (sessionId == newSessionId) {
          editByState.value = DataEditType.same;
          return;
        }

        // sessionId is set but we are not editing, compare and check for
        // updates
        final data = ref.read(stateProvider(dataId, sessionId)).requireValue;

        final hasChanges = hasEntityChanges(data, updatedData);

        if (hasChanges) {
          ref.read(dataHasUpdatesProvider(sessionId).notifier).setHasUpdates();
          // if the window is in front, we want to highlight it to get
          // the users attention
          final isInFront =
              ref.read(windowManagerProvider).isInFront(floatingWindowId);
          if (isInFront) {
            ref.read(windowManagerProvider).startHighlight(floatingWindowId);
          }
        }

        // the user who is editing the entity
        final editingUser = updatedData.meta.editingById;

        if (editingUser == myUserId) {
          editByState.value = DataEditType.you;
        } else if (editingUser != null) {
          editByState.value = DataEditType.other;
        } else {
          editByState.value = DataEditType.none;
        }
      },
    );

    return DataRequestView(
      hasRequestedEditNotifier: hasRequestedEditNotifier,
      formKey: formKey,
      navigatorKey: navigatorKey,
      onRelease: () async {
        dlog('onRelease exec');
        await onRelease(meta.editingSessionId ?? '', dataId, navigatorKey);
      },
      windowId: floatingWindowId,
      dataEditType: editByState.value,
      editingByName: editByName,
      showCanEditBar: showCanEditBar,
      primaryKey: dataId,
      sessionId: sessionId,
      tableType: tableType,
      onRefresh: () => onRefresh(meta.editingSessionId ?? '', dataId),
    );
  }
}
