// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';
import 'dart:math' as math;

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/features/entity_notes/entity_note_core_repository.dart';
import 'package:elbdesk_core/src/features/entity_notes/mention_text_controller.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'ui/chat_bubble.dart';
part 'ui/entity_note_input_text_field.dart';

class EntityNotesView extends HookConsumerWidget {
  const EntityNotesView({
    required this.entityId,
    required this.tableType,
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.isFirstRun,
    this.hint,
    this.showDivider = true,
    this.additionalEntityData,
    this.initialNoteId,
    this.initialNoteParentId,
    super.key,
  });
  final int entityId;
  final String tableType;
  final String floatingWindowId;
  final String? hint;
  final bool showDivider;
  final AdditionalEntityData? additionalEntityData;
  final GlobalKey<NavigatorState> navigatorKey;
  final int? initialNoteId;
  final int? initialNoteParentId;
  final bool isFirstRun;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputFocusNode = useFocusNode();
    // const isOpen = true;

    final isOpen = ref.watch(showEntityNotesProvider(floatingWindowId));

    final shouldRender = useState<bool>(isOpen);

    useEffect(
      () {
        if (isOpen) {
          shouldRender.value = true;
        } else {
          final timer = Timer(AnimationConstants.defaultDuration, () {
            shouldRender.value = false;
          });
          return timer.cancel;
        }
        return null;
      },
      [isOpen],
    );

    ref.listen(
      noteThreadIdProvider(tableType, entityId, floatingWindowId),
      (previous, next) {},
    );

    useEffect(
      () {
        if (initialNoteId != null &&
            initialNoteParentId == null &&
            isFirstRun) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            ref.read(showEntityNotesProvider(floatingWindowId).notifier).show();
          });
        }
        if (initialNoteId != null &&
            initialNoteParentId != null &&
            isFirstRun) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            ref.read(showEntityNotesProvider(floatingWindowId).notifier).show();
            ref
                .read(
                  noteThreadIdProvider(tableType, entityId, floatingWindowId)
                      .notifier,
                )
                .updateParentId(initialNoteParentId);
          });
        }

        return null;
      },
      [initialNoteId],
    );

    final generalColors = context.appTheme.generalColors;
    final l10n = context.l10n;
    final pageController = usePageController(
      initialPage: ref.read(
                    noteThreadIdProvider(
                      tableType,
                      entityId,
                      floatingWindowId,
                    ),
                  ) !=
                  null ||
              initialNoteParentId != null
          ? 1
          : 0,
    );
    final notes = ref.watch(watchNotesProvider(tableType, entityId));
    final scrollController = useScrollController();

    final appUsers = ref.watch(watchAllActiveLightUsersProvider);

    return Offstage(
      offstage: !shouldRender.value,
      child: AnimatedContainer(
        duration: AnimationConstants.defaultDuration,
        curve: AnimationConstants.defaultCurve,
        width: isOpen ? 450 : 0,
        child: ClipRect(
          child: OverflowBox(
            minWidth: 0,
            maxWidth: 450,
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 450,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: AnimationConstants.defaultDuration,
                    curve: AnimationConstants.defaultCurve,
                    left: isOpen ? 0 : 450,
                    right: isOpen ? 0 : -450,
                    top: 0,
                    bottom: 0,
                    child: Row(
                      children: [
                        if (showDivider) const AppDivider.vertical(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(
                                height: UiConstants.defaultPadding,
                              ),
                              ColoredBox(
                                color: generalColors.background,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: UiConstants.defaultPadding,
                                    right: UiConstants.defaultPadding,
                                  ),
                                  child:
                                      CardSectionTitle(title: l10n.chat_notes),
                                ),
                              ),
                              notes.fastWhen(
                                skipLoadingOnRefresh: true,
                                skipLoadingOnReload: true,
                                data: (notes) {
                                  if (notes.isEmpty) {
                                    return Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                          UiConstants.elementMargin,
                                        ).copyWith(top: 32, left: 18),
                                        child: AppText(l10n.chat_no_notes_hint),
                                      ),
                                    );
                                  }
                                  return Expanded(
                                    child: _NotesList(
                                      inputFocusNode: inputFocusNode,
                                      navigatorKey: navigatorKey,
                                      floatingWindowId: floatingWindowId,
                                      pageController: pageController,
                                      notes: notes,
                                      scrollController: scrollController,
                                      tableType: tableType,
                                      entityId: entityId,
                                    ),
                                  );
                                },
                              ),
                              appUsers.fastWhen(
                                data: (appUsers) {
                                  return _EntityNoteInputTextField(
                                    inputFocusNode: inputFocusNode,
                                    navigatorKey: navigatorKey,
                                    floatingWindowId: floatingWindowId,
                                    hint: hint,
                                    availableUsers: appUsers,
                                    onSubmitted: (text, mentions) {
                                      final parentId = ref.read(
                                        noteThreadIdProvider(
                                          tableType,
                                          entityId,
                                          floatingWindowId,
                                        ),
                                      );

                                      final note = EntityNote(
                                        mentions: mentions,
                                        message: text,
                                        tableType: tableType,
                                        entityId: entityId,
                                        children: [],
                                        parentId: parentId,
                                        createdAt: DateTime.now(),
                                        hint: hint,
                                      );
                                      ref
                                          .read(
                                              entityNoteCoreRepositoryProvider)
                                          .createNote(note, mentions);
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NotesList extends HookConsumerWidget {
  const _NotesList({
    required this.notes,
    required this.scrollController,
    required this.tableType,
    required this.entityId,
    required this.floatingWindowId,
    required this.pageController,
    required this.navigatorKey,
    required this.inputFocusNode,
  });
  final List<EntityNote> notes;
  final ScrollController scrollController;
  final String tableType;
  final int entityId;
  final PageController pageController;
  final String floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode inputFocusNode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUserId = sessionManager.signedInUser?.id;

    if (myUserId == null) {
      return const SizedBox.shrink();
    }
    final scrollController = useScrollController();

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              AppScrollbar(
                controller: scrollController,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  reverse: true,
                  padding: const EdgeInsets.only(
                    left: UiConstants.defaultPadding,
                    right: UiConstants.defaultPadding,
                    bottom: UiConstants.elementMargin,
                  ),
                  itemCount: notes.length,
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    return _ChatBubble(
                      inputFocusNode: inputFocusNode,
                      navigatorKey: navigatorKey,
                      floatingWindowId: floatingWindowId,
                      key: ValueKey(notes[index].id),
                      note: notes[index],
                      myUserId: myUserId,
                      pageController: pageController,
                    );
                  },
                ),
              ),
              _ThreadView(
                inputFocusNode: inputFocusNode,
                navigatorKey: navigatorKey,
                floatingWindowId: floatingWindowId,
                tableType: tableType,
                entityId: entityId,
                myUserId: myUserId,
                pageController: pageController,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ThreadView extends HookConsumerWidget {
  const _ThreadView({
    required this.tableType,
    required this.entityId,
    required this.myUserId,
    required this.pageController,
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.inputFocusNode,
  });

  final String tableType;
  final int entityId;
  final int myUserId;
  final PageController pageController;
  final String floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode inputFocusNode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(
      entityNoteThreadProvider(tableType, entityId, floatingWindowId),
    );

    if ((notes.value?.isEmpty ?? true) ||
        (notes.isLoading && !notes.hasValue) ||
        notes.hasError) {
      return const SizedBox.shrink();
    }
    final scrollController = useScrollController();
    final listNotes = notes.requireValue;
    final childrenNotes = listNotes.first.children;
    final allNotes = [...childrenNotes, ...listNotes];
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: AppTripleRail(
            leading: AppIconButton(
              iconData: Icons.arrow_back,
              onPressed: () {
                ref
                    .read(
                      noteThreadIdProvider(
                        tableType,
                        entityId,
                        floatingWindowId,
                      ).notifier,
                    )
                    .updateParentId(null);
                pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
            middle: AppText(l10n.chat_thread),
          ),
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            reverse: true,
            padding: const EdgeInsets.only(
              left: UiConstants.defaultPadding,
              right: UiConstants.defaultPadding,
              bottom: UiConstants.elementMargin,
            ),
            itemCount: allNotes.length,
            controller: scrollController,
            itemBuilder: (context, index) {
              return _ChatBubble(
                inputFocusNode: inputFocusNode,
                navigatorKey: navigatorKey,
                pageController: null,
                floatingWindowId: floatingWindowId,
                key: ValueKey(allNotes[index].id),
                note: allNotes[index],
                myUserId: myUserId,
              );
            },
          ),
        ),
      ],
    );
  }
}
