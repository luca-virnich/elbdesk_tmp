// ignore_for_file: lines_longer_than_80_chars

part of '../entity_notes_view.dart';

class _ChatBubble extends HookConsumerWidget {
  const _ChatBubble({
    required this.note,
    required this.myUserId,
    required this.pageController,
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.inputFocusNode,
    super.key,
  });
  final EntityNote note;
  final int myUserId;
  final PageController? pageController;
  final String floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode inputFocusNode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;
    final blankButtonStyle = context.appTheme.buttonStyles.blank;
    final isMyMessage = note.createdById == myUserId;

    final isEditingNotifier = useValueNotifier<bool>(false);
    final isHoveredNotifier = useValueNotifier<bool>(false);
    final l10n = context.l10n;

    final createdByName = note.hardcodedSender ??
        ((note.createdById == null)
            ? 'Unknown'.hc
            : ref
                .watch(
                  fetchLocalLightUserByUserInfoIdProvider(note.createdById!),
                )
                .fullName);

    String xRepliesString(int length) {
      if (length == 1) {
        return '1 ${l10n.chat_reply_singular}';
      }
      return '$length ${l10n.chat_reply_plural}';
    }

    return MouseRegion(
      onEnter: (details) {
        if (context.mounted) {
          isHoveredNotifier.value = true;
        }
      },
      onExit: (details) {
        if (context.mounted) {
          isHoveredNotifier.value = false;
        }
      },
      child: SelectionArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: UiConstants.elementMargin,
            right: UiConstants.elementMargin,
            top: UiConstants.elementMargin,
            bottom: UiConstants.elementMargin,
          ),
          decoration: BoxDecoration(
            color: generalColors.primarySurface,
            borderRadius: BorderRadius.all(Radius.circular(borderRadiuses.m)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          createdByName,
                          maxLines: 1,
                          autoSize: false,
                          fontWeight: FontWeight.bold,
                          color: generalColors.onBackground,
                        ),
                        if (note.hint != null)
                          AppText(
                            note.hint!,
                            color: Colors.grey.shade700,
                            fontSize: 12,
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: UiConstants.elementMargin),
                  _CreatedAtEditButtonDeleteButton(
                    note: note,
                    isHoveredNotifier: isHoveredNotifier,
                    isEditingNotifier: isEditingNotifier,
                    isMyMessage: isMyMessage,
                  ),
                ],
              ),
              _MessageWrapper(
                isEditing: isEditingNotifier,
                note: note,
                isMyMessage: isMyMessage,
                floatingWindowId: floatingWindowId,
                navigatorKey: navigatorKey,
              ),
              const SizedBox(height: 16),
              if (pageController == null)
                _LastModifiedAt(lastModifiedAt: note.lastModifiedAt),
              if (pageController != null)
                Row(
                  children: [
                    Expanded(
                      child:
                          _LastModifiedAt(lastModifiedAt: note.lastModifiedAt),
                    ),
                    AppButton.blank(
                      // TODO(lv): Theme
                      color: note.children.isNotEmpty
                          ? blankButtonStyle.foregroundColor.withAppOpacity(0.5)
                          : Colors.grey.shade700,

                      label: note.children.isNotEmpty
                          ? xRepliesString(note.children.length)
                          : l10n.chat_reply,
                      onPressed: () {
                        ref
                            .read(
                              noteThreadIdProvider(
                                note.tableType,
                                note.entityId,
                                floatingWindowId,
                              ).notifier,
                            )
                            .updateParentId(note.id);
                        pageController!.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );

                        inputFocusNode.requestFocus();
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MessageWrapper extends HookConsumerWidget {
  const _MessageWrapper({
    required this.isEditing,
    required this.note,
    required this.isMyMessage,
    required this.floatingWindowId,
    required this.navigatorKey,
  });
  final ValueNotifier<bool> isEditing;
  final EntityNote note;
  final bool isMyMessage;
  final String floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useValueListenable(isEditing);
    final appUsers = ref.watch(watchAllActiveLightUsersProvider);
    final isDeleted = note.deletedAt != null;
    final inputFocusNode = useFocusNode();
    return appUsers.fastWhen(
      data: (appUsers) {
        if (isDeleted) {
          return _DeletedMessage(
            deletedAt: note.deletedAt!,
            isMyMessage: isMyMessage,
            note: note,
          );
        }
        if (!isEditing.value) {
          return _Message(
            note: note,
            isMyMessage: isMyMessage,
            floatingWindowId: floatingWindowId,
            appUsers: appUsers,
          );
        }
        return _EditMessage(
          note: note,
          isEditing: isEditing,
          appUsers: appUsers,
          floatingWindowId: floatingWindowId,
          navigatorKey: navigatorKey,
          inputFocusNode: inputFocusNode,
        );
      },
    );
  }
}

class _Message extends ConsumerWidget {
  const _Message({
    required this.note,
    required this.isMyMessage,
    required this.floatingWindowId,
    required this.appUsers,
  });
  final EntityNote note;
  final bool isMyMessage;
  final String floatingWindowId;
  final List<LightUser> appUsers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultTextStyle = context.appTheme.textStyles.defaultText;

    return Padding(
      padding: const EdgeInsets.only(top: UiConstants.elementMargin),
      child: AppRichText(
        children: [
          Parser.parseMessageFromDbEntry(
            note.message,
            defaultTextStyle,
            appUsers,
          ),
        ],
      ),
    );
  }
}

class _LastModifiedAt extends ConsumerWidget {
  const _LastModifiedAt({
    required this.lastModifiedAt,
  });
  final DateTime? lastModifiedAt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final now = ref.watch(watchTimeProvider).value;
    if (now == null || lastModifiedAt == null) return const SizedBox();

    return AppText(
      '${l10n.chat_last_modified}: ${_dateTimeString(now, lastModifiedAt!, l10n)}',
      color: Colors.grey.shade700,
      fontSize: 12,
    );
  }
}

class _DeletedMessage extends ConsumerWidget {
  const _DeletedMessage({
    required this.deletedAt,
    required this.isMyMessage,
    required this.note,
  });
  final DateTime deletedAt;
  final bool isMyMessage;
  final EntityNote note;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final now = ref.watch(watchTimeProvider).value;
    if (now == null) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppText(
            '${l10n.chat_message_deleted_hint} (${_dateTimeString(now, deletedAt, l10n)}).',
            style: TextStyle(
              // TODO(lv): Theme
              color: Colors.grey.shade700,
              fontStyle: FontStyle.italic,
            ),
          ),
          if (isMyMessage && now.difference(deletedAt).inMinutes < 2)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Align(
                alignment: Alignment.centerRight,
                child: AppButton.blank(
                  onPressed: () {
                    ref
                        .read(entityNoteCoreRepositoryProvider)
                        .restoreNote(note);
                  },
                  label: l10n.chat_undo,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _EditMessage extends HookConsumerWidget {
  const _EditMessage({
    required this.note,
    required this.isEditing,
    required this.appUsers,
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.inputFocusNode,
  });
  final EntityNote note;
  final ValueNotifier<bool> isEditing;
  final List<LightUser> appUsers;
  final String floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode inputFocusNode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    useEffect(
      () {
        inputFocusNode.requestFocus();
        return null;
      },
      [],
    );

    return _EntityNoteInputTextField(
      inputFocusNode: inputFocusNode,
      navigatorKey: navigatorKey,
      isEditingNotifier: isEditing,
      initialNote: note,
      floatingWindowId: floatingWindowId,
      availableUsers: appUsers,
      onSubmitted: (text, mentions) {
        ref.read(entityNoteCoreRepositoryProvider).updateNote(
              note.copyWith(
                message: text,
                mentions: mentions,
              ),
            );
        isEditing.value = false;
      },
      hint: l10n.chat_edit_note_hint,
    );
  }
}

class _CreatedAtEditButtonDeleteButton extends HookConsumerWidget {
  const _CreatedAtEditButtonDeleteButton({
    required this.note,
    required this.isHoveredNotifier,
    required this.isEditingNotifier,
    required this.isMyMessage,
  });
  final EntityNote note;
  final ValueNotifier<bool> isHoveredNotifier;
  final ValueNotifier<bool> isEditingNotifier;
  final bool isMyMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = ref.watch(watchTimeProvider).value;
    if (now == null) return const SizedBox();
    final l10n = context.l10n;

    useValueListenable(isHoveredNotifier);
    useValueListenable(isEditingNotifier);
    final isDeleted = note.deletedAt != null;
    if (isHoveredNotifier.value &&
        !isEditingNotifier.value &&
        !isDeleted &&
        isMyMessage) {
      return SizedBox(
        height: 24,
        child: Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppIconButton(
                iconData: Icons.edit,
                onPressed: () {
                  isEditingNotifier.value = true;
                },
              ),
              const SizedBox(width: UiConstants.elementMargin),
              AppIconButton.danger(
                iconData: Icons.delete,
                onPressed: () {
                  ref.read(entityNoteCoreRepositoryProvider).deleteNote(note);
                },
              ),
            ],
          ),
        ),
      );
    }

    return SizedBox(
      height: 24,
      child: Align(
        alignment: Alignment.centerRight,
        child: AppText(
          _dateTimeString(now, note.createdAt!, l10n),
          fontSize: 14,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}

String _dateTimeString(
  DateTime now,
  DateTime dateTime,
  ElbCoreLocalizations l10n,
) {
  final nowDate = DateTime(now.year, now.month, now.day);
  final createdAtDate = DateTime(
    dateTime.year,
    dateTime.month,
    dateTime.day,
  );
  final isSameDay = nowDate.isAtSameMomentAs(createdAtDate);
  final isYesterday =
      nowDate.subtract(const Duration(days: 1)).isAtSameMomentAs(createdAtDate);
  final isDifferenceLessThenOneMinute =
      now.difference(dateTime).inMinutes.abs() < 1;
  if (isDifferenceLessThenOneMinute) {
    return l10n.chat_just_now;
  }

  final differneceInMin = now.difference(dateTime).inMinutes.abs();
  if (differneceInMin < 60) {
    return '${l10n.chat_message_min_ago(differneceInMin)} ';
  }

  if (isSameDay) {
    return '${l10n.chat_today_at} ${dateTime.toTimeWithoutSeconds(l10n.localeName)}';
  }
  if (isYesterday) {
    return '${l10n.chat_yesterday_at} ${dateTime.toTimeWithoutSeconds(l10n.localeName)}';
  }

  return '${dateTime.toDate(l10n.localeName)} ${l10n.chat_at} ${dateTime.toTimeWithoutSeconds(l10n.localeName)}';
}
