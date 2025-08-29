import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/features/entity_notes/entity_note_core_repository.dart';
import 'package:elbdesk_core/src/features/entity_notes/mention_text_controller.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A simplified entity notes view for mobile that doesn't use width animations
class EntityNotesMobileView extends HookConsumerWidget {
  const EntityNotesMobileView({
    required this.entityId,
    required this.tableType,
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.isFirstRun,
    super.key,
    this.hint,
    this.additionalEntityData,
    this.initialNoteId,
    this.initialNoteParentId,
    this.threadId,
    this.onThreadChanged,
  });

  final int entityId;
  final String tableType;
  final String floatingWindowId;
  final String? hint;
  final AdditionalEntityData? additionalEntityData;
  final GlobalKey<NavigatorState> navigatorKey;
  final int? initialNoteId;
  final int? initialNoteParentId;
  final bool isFirstRun;
  final int? threadId;
  final void Function(bool inThread, VoidCallback? onBack)? onThreadChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generalColors = context.appTheme.generalColors;
    final theme = context.appTheme;
    final l10n = context.l10n;

    final notes = ref.watch(watchNotesProvider(tableType, entityId));
    final scrollController = useScrollController();
    final appUsers = ref.watch(watchAllActiveLightUsersProvider);

    // Track current thread ID
    final currentThreadId = useState<int?>(threadId);

    // Page controller for smooth animations
    final pageController = usePageController(
      initialPage: threadId != null ? 1 : 0,
    );

    // Declare functions as late final to allow mutual references
    late final void Function() animateToMain;
    late final void Function(int) animateToThread;

    // Animate back to main view
    animateToMain = () {
      pageController
          .animateToPage(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      )
          .then((_) {
        currentThreadId.value = null;
        onThreadChanged?.call(false, null);
      });
    };

    // Animate to thread view
    animateToThread = (int noteId) {
      currentThreadId.value = noteId;
      pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      onThreadChanged?.call(true, animateToMain);
    };

    // Initialize thread state
    useEffect(
      () {
        if (threadId != null) {
          onThreadChanged?.call(true, animateToMain);
        }
        return null;
      },
      [],
    );

    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        // Main notes view
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Notes list
            Expanded(
              child: notes.when(
                data: (notesList) {
                  // Show only root notes (no parent) in main view
                  final displayNotes =
                      notesList.where((n) => n.parentId == null).toList();

                  if (displayNotes.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            AppIcons.note,
                            size: 48,
                            color: generalColors.divider,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No notes yet',
                            style: context.appTheme.textStyles.defaultTextLight,
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    controller: scrollController,
                    reverse: true, // Most recent at bottom
                    padding: const EdgeInsets.all(12),
                    itemCount: displayNotes.length,
                    itemBuilder: (context, index) {
                      final note = displayNotes[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: _SimplifiedNoteBubble(
                          note: note,
                          appUsers: appUsers.value ?? [],
                          onDelete: () async {
                            await ref
                                .read(entityNoteCoreRepositoryProvider)
                                .deleteNote(note);
                          },
                          onReply: () => animateToThread(note.id!),
                          showReplyButton: true,
                        ),
                      );
                    },
                  );
                },
                loading: () => const Center(
                  child: AppLoadingIndicator(),
                ),
                error: (error, stack) => Center(
                  child: Text('Error: $error'),
                ),
              ),
            ),

            // Input field with mentions support
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: generalColors.background,
                border: Border(
                  top: BorderSide(
                    color: generalColors.divider,
                    width: 1,
                  ),
                ),
              ),
              child: _MobileNoteInput(
                availableUsers: appUsers.value ?? [],
                hint: l10n.chat_add_a_note_hint,
                onSubmit: (String text, List<Mention> mentions) async {
                  if (text.trim().isEmpty) return;

                  final note = EntityNote(
                    mentions: mentions,
                    message: text,
                    tableType: tableType,
                    entityId: entityId,
                    children: [],
                    parentId: initialNoteParentId,
                    createdAt: DateTime.now(),
                    hint: hint,
                  );

                  await ref
                      .read(entityNoteCoreRepositoryProvider)
                      .createNote(note, mentions);
                },
              ),
            ),
          ],
        ),

        // Thread view
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Thread notes
            Expanded(
              child: notes.when(
                data: (notesList) {
                  if (currentThreadId.value == null) {
                    return const SizedBox();
                  }

                  // Find the parent note
                  final parentNote = notesList.firstWhereOrNull(
                    (n) => n.id == currentThreadId.value,
                  );

                  if (parentNote == null) {
                    return const SizedBox();
                  }

                  // Combine children with parent note (children first for reverse list)
                  final displayNotes = [...parentNote.children, parentNote];

                  return ListView.builder(
                    reverse: true, // Most recent at bottom
                    padding: const EdgeInsets.all(16),
                    itemCount: displayNotes.length,
                    itemBuilder: (context, index) {
                      final note = displayNotes[index];
                      final isParent = note.id == parentNote.id;

                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: 12,
                          left: isParent ? 0 : 16, // Indent replies
                        ),
                        child: _SimplifiedNoteBubble(
                          note: note,
                          appUsers: appUsers.value ?? [],
                          onDelete: () async {
                            await ref
                                .read(entityNoteCoreRepositoryProvider)
                                .deleteNote(note);

                            // If deleting parent note, go back to main view
                            if (isParent) {
                              animateToMain();
                            }
                          },
                          showReplyButton:
                              false, // No reply button in thread view
                          showReplyCount:
                              false, // No reply count in thread view
                        ),
                      );
                    },
                  );
                },
                loading: () => const Center(
                  child: AppLoadingIndicator(),
                ),
                error: (error, stack) => Center(
                  child: Text('Error: $error'),
                ),
              ),
            ),

            // Thread input field
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: generalColors.background,
                border: Border(
                  top: BorderSide(
                    color: generalColors.divider,
                    width: 1,
                  ),
                ),
              ),
              child: _MobileNoteInput(
                availableUsers: appUsers.value ?? [],
                hint: l10n.chat_reply,
                onSubmit: (String text, List<Mention> mentions) async {
                  if (text.trim().isEmpty) return;

                  final note = EntityNote(
                    mentions: mentions,
                    message: text,
                    tableType: tableType,
                    entityId: entityId,
                    children: [],
                    parentId: currentThreadId.value,
                    createdAt: DateTime.now(),
                    hint: hint,
                  );

                  await ref
                      .read(entityNoteCoreRepositoryProvider)
                      .createNote(note, mentions);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// WhatsApp-style note bubble for mobile view
class _SimplifiedNoteBubble extends ConsumerWidget {
  const _SimplifiedNoteBubble({
    required this.note,
    required this.appUsers,
    required this.onDelete,
    this.onReply,
    this.showReplyButton = true,
    this.showReplyCount = true,
  });

  final EntityNote note;
  final List<LightUser> appUsers;
  final VoidCallback onDelete;
  final VoidCallback? onReply;
  final bool showReplyButton;
  final bool showReplyCount;

  void _showMessageOptions(BuildContext context, WidgetRef ref) {
    final theme = context.appTheme;
    final l10n = context.l10n;
    final currentUserId = sessionManager.signedInUser?.id;
    final isMyMessage = note.createdById == currentUserId;
    final isDeleted = note.deletedAt != null;
    final now = DateTime.now();
    final canUndo = isDeleted &&
        isMyMessage &&
        note.deletedAt != null &&
        now.difference(note.deletedAt!).inMinutes < 2;

    showModalBottomSheet(
      context: context,
      backgroundColor: theme.generalColors.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Reply option - always show if callback provided and not in thread view
            if (showReplyButton && onReply != null)
              ListTile(
                leading:
                    Icon(Icons.reply, color: theme.generalColors.onBackground),
                title: Text(l10n.chat_reply),
                onTap: () {
                  Navigator.pop(context);
                  onReply!();
                },
              ),

            // Delete option for own messages
            if (isMyMessage && !isDeleted)
              ListTile(
                leading:
                    Icon(AppIcons.delete, color: theme.generalColors.danger),
                title: Text(l10n.gen_delete),
                textColor: theme.generalColors.danger,
                onTap: () {
                  Navigator.pop(context);
                  onDelete();
                },
              ),

            // Restore option for recently deleted messages
            if (canUndo)
              ListTile(
                leading: Icon(Icons.undo, color: theme.generalColors.primary),
                title: Text(l10n.chat_undo),
                onTap: () async {
                  Navigator.pop(context);
                  await ref
                      .read(entityNoteCoreRepositoryProvider)
                      .restoreNote(note);
                },
              ),

            // Cancel button
            const Divider(height: 1),
            ListTile(
              title: Text(l10n.gen_cancel, textAlign: TextAlign.center),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.appTheme;
    final generalColors = theme.generalColors;
    final currentUserId = sessionManager.signedInUser?.id;
    final l10n = context.l10n;

    // Check if note is deleted
    final isDeleted = note.deletedAt != null;
    final isMyMessage = note.createdById == currentUserId;

    // Use the same provider as desktop to get the correct user name
    final createdByName = ref
        .watch(fetchLocalLightUserByUserInfoIdProvider(note.createdById!))
        .fullName;

    return GestureDetector(
      onLongPress: () => _showMessageOptions(context, ref),
      onTap: () {
        // Open thread if there are replies and we're not already in thread view
        if (note.children.isNotEmpty && showReplyButton && onReply != null) {
          onReply!();
        }
      },
      child: Align(
        alignment: isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          margin: EdgeInsets.only(
            left: isMyMessage ? 48 : 0,
            right: isMyMessage ? 0 : 48,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isMyMessage
                ? theme.generalColors.primary.withAppOpacity(0.1)
                : generalColors.background,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(16),
              topRight: const Radius.circular(16),
              bottomLeft: Radius.circular(isMyMessage ? 16 : 4),
              bottomRight: Radius.circular(isMyMessage ? 4 : 16),
            ),
            border: isMyMessage
                ? null
                : Border.all(
                    color: generalColors.divider,
                    width: 0.5,
                  ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sender name (only for others' messages)
              if (!isMyMessage)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    createdByName,
                    style: theme.textStyles.defaultText.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: theme.generalColors.primary,
                    ),
                  ),
                ),

              // Message content
              if (isDeleted)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.block,
                      size: 14,
                      color: theme.generalColors.onBackground,
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        l10n.chat_message_deleted_hint,
                        style: theme.textStyles.defaultTextLight.copyWith(
                          fontStyle: FontStyle.italic,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                )
              else
                AppRichText(
                  children: [
                    Parser.parseMessageFromDbEntry(
                      note.message,
                      theme.textStyles.defaultText.copyWith(fontSize: 14),
                      appUsers,
                    ),
                  ],
                ),

              // Timestamp and reply count
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (note.createdAt != null)
                      Text(
                        _formatRelativeTime(note.createdAt!, l10n),
                        style: theme.textStyles.defaultTextLight.copyWith(
                          fontSize: 11,
                        ),
                      ),

                    // Reply count indicator
                    if (showReplyCount && note.children.isNotEmpty) ...[
                      const SizedBox(width: 8),
                      Icon(
                        Icons.reply,
                        size: 12,
                        color: theme.generalColors.onBackground,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '${note.children.length}',
                        style: theme.textStyles.defaultTextLight.copyWith(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Mobile note input with mention support and proper overlay positioning
class _MobileNoteInput extends ConsumerStatefulWidget {
  const _MobileNoteInput({
    required this.availableUsers,
    required this.hint,
    required this.onSubmit,
  });

  final List<LightUser> availableUsers;
  final String hint;
  final void Function(String text, List<Mention> mentions) onSubmit;

  @override
  ConsumerState<_MobileNoteInput> createState() => _MobileNoteInputState();
}

class _MobileNoteInputState extends ConsumerState<_MobileNoteInput> {
  late MentionEditingController controller;
  final GlobalKey _textFieldKey = GlobalKey();
  final FocusNode _focusNode = FocusNode();
  late FocusNode _rawKeyboardFocusNode;
  final LayerLink _layerLink = LayerLink();

  List<LightUser> _filteredUsers = [];
  int _mentionStartIndex = -1;
  String _currentMentionText = '';
  int _selectedSuggestionIndex = 0;
  bool _showSuggestions = false;
  OverlayEntry? _suggestionsOverlay;

  @override
  void initState() {
    super.initState();
    controller = MentionEditingController();
    _rawKeyboardFocusNode = FocusNode();
    controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    controller.dispose();
    _focusNode.dispose();
    _rawKeyboardFocusNode.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _onTextChanged() {
    if (controller.isModifying) return;

    final text = controller.text;
    final selection = controller.selection;
    if (selection.baseOffset < 0) return;

    // Check if a confirmed mention was partially deleted
    final deletedMention = controller.mentions.firstWhereOrNull((m) {
      if (selection.baseOffset > m.start! && selection.baseOffset <= m.end!) {
        if (m.start! >= text.length) return true;
        final end = m.end!.clamp(0, text.length);
        if (m.start! >= end) return true;
        final mentionText = text.substring(m.start!, end);
        return mentionText != '@${m.userName}';
      }
      return false;
    });

    if (deletedMention != null) {
      _deleteMention(deletedMention);
      return;
    }

    if (text.isEmpty) {
      _resetMentions();
      return;
    }

    _updateMentionsFromText();
    _updateSuggestions(text, selection);
  }

  void _deleteMention(Mention mention) {
    final text = controller.text;
    final before = text.substring(0, mention.start!.clamp(0, text.length));
    final after = text.substring(mention.end!.clamp(0, text.length));

    // Keep the @ symbol
    const atSymbol = '@';

    controller.isModifying = true;
    controller.text = '$before$atSymbol$after';
    controller.selection = TextSelection.collapsed(
      offset: mention.start!.clamp(0, text.length) + 1, // +1 for cursor after @
    );
    controller.isModifying = false;
    controller.mentions.remove(mention);

    // Force update suggestions after deletion
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _updateSuggestions(controller.text, controller.selection);
      }
    });

    setState(() {});
  }

  void _resetMentions() {
    controller.mentions.clear();
    _showSuggestions = false;
    _removeOverlay();
    setState(() {});
  }

  void _updateSuggestions(String text, TextSelection selection) {
    final textBeforeCursor = text.substring(0, selection.baseOffset);
    final lastAtIndex = textBeforeCursor.lastIndexOf('@');
    if (lastAtIndex != -1) {
      final candidate = textBeforeCursor.substring(lastAtIndex);
      if (!candidate.contains('\n')) {
        _mentionStartIndex = lastAtIndex;
        _currentMentionText = candidate.substring(1);

        // Don't show suggestions if there's a space after @ (unless it's just @)
        if (_currentMentionText.contains(' ')) {
          _showSuggestions = false;
          _removeOverlay();
        } else {
          _filteredUsers = widget.availableUsers
              .where(
                (u) => u.fullName.toLowerCase().contains(
                      _currentMentionText.toLowerCase(),
                    ),
              )
              .toList();
          _selectedSuggestionIndex = 0;
          if (_filteredUsers.isNotEmpty) {
            _showSuggestions = true;
            _showOverlay();
          } else {
            _showSuggestions = false;
            _removeOverlay();
          }
        }
      } else {
        _showSuggestions = false;
        _removeOverlay();
      }
    } else {
      _showSuggestions = false;
      _removeOverlay();
    }
    setState(() {});
  }

  void _updateMentionsFromText() {
    final text = controller.text;

    // If text is empty, clear all mentions
    if (text.isEmpty) {
      controller.mentions = [];
      return;
    }

    final updatedMentions = <Mention>[];

    // Sort mentions by position to avoid overlaps
    final sortedMentions = controller.mentions.toList()
      ..sort((a, b) => a.start!.compareTo(b.start!));

    for (final mention in sortedMentions) {
      final expectedText = '@${mention.userName}';
      // Try to find at original position first
      var start = -1;
      if (mention.start! < text.length) {
        start = text.indexOf(expectedText, mention.start!);
      }
      // If not found, search in entire text
      if (start == -1) {
        start = text.indexOf(expectedText);
      }
      // Only add if found and text is long enough
      if (start != -1 && start + expectedText.length <= text.length) {
        // Check for overlaps with already found mentions
        final overlaps = updatedMentions.any(
          (m) =>
              (start >= m.start! && start < m.end!) ||
              (start + expectedText.length > m.start! &&
                  start + expectedText.length <= m.end!),
        );

        if (!overlaps) {
          updatedMentions.add(
            Mention(
              userId: mention.userId,
              userName: mention.userName,
              start: start,
              end: start + expectedText.length,
            ),
          );
        }
      }
    }

    controller.mentions = updatedMentions;
  }

  void _onSuggestionSelected(LightUser user) {
    final text = controller.text;
    final baseOffset = controller.selection.baseOffset;
    final before = text.substring(0, _mentionStartIndex);
    final after = text.substring(baseOffset);
    final token = '@${user.fullName}';
    final newText = '$before$token $after';

    controller.isModifying = true;
    controller.text = newText;
    controller.selection = TextSelection.collapsed(
      offset: '$before$token '.length,
    );
    controller.isModifying = false;

    controller.mentions.add(
      Mention(
        userId: user.userInfoId,
        userName: user.fullName,
        start: before.length,
        end: before.length + token.length,
      ),
    );

    _showSuggestions = false;
    _removeOverlay();
    _currentMentionText = '';
    _mentionStartIndex = -1;
    setState(() {});
  }

  void _submitMessage() {
    final text = controller.text.trim();
    if (text.isEmpty) return;

    widget.onSubmit(text, controller.mentions);
    controller.text = '';
    controller.mentions.clear();

    // Restore focus to the text field
    _focusNode.requestFocus();
  }

  void _showOverlay() {
    if (_suggestionsOverlay != null) {
      _suggestionsOverlay!.markNeedsBuild();
      return;
    }
    _suggestionsOverlay = _createOverlayEntry();
    Overlay.of(context).insert(_suggestionsOverlay!);
  }

  void _removeOverlay() {
    _suggestionsOverlay?.remove();
    _suggestionsOverlay = null;
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) {
        // Get the text field width from RenderBox
        final renderBox =
            _textFieldKey.currentContext?.findRenderObject() as RenderBox?;
        final textFieldWidth = renderBox?.size.width ?? 300;

        return Stack(
          children: [
            // Transparent overlay to capture taps outside
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _showSuggestions = false;
                    _removeOverlay();
                  });
                },
                child: Container(color: Colors.transparent),
              ),
            ),
            // Suggestions box anchored to text field
            CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: const Offset(0, -8), // 8px gap above text field
              followerAnchor: Alignment.bottomLeft,
              targetAnchor: Alignment.topLeft,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 200,
                  maxWidth: textFieldWidth + 60, // Text field width + 60px
                  // minWidth: 200,
                ),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.appTheme.generalColors.background,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: context.appTheme.generalColors.divider,
                      ),
                    ),
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: _filteredUsers.length,
                      itemBuilder: (context, index) {
                        final isSelected = index == _selectedSuggestionIndex;
                        return InkWell(
                          onTap: () =>
                              _onSuggestionSelected(_filteredUsers[index]),
                          child: Container(
                            color: isSelected
                                ? context.appTheme.generalColors.primarySurface
                                : Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: Text(
                              _filteredUsers[index].fullName,
                              style: context.appTheme.textStyles.defaultText,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return Focus(
      focusNode: _rawKeyboardFocusNode,
      onKeyEvent: (_, KeyEvent event) {
        if (_showSuggestions) {
          if (event is KeyDownEvent) {
            if (event.logicalKey == LogicalKeyboardKey.enter) {
              _onSuggestionSelected(_filteredUsers[_selectedSuggestionIndex]);
              return KeyEventResult.handled;
            } else if (event.logicalKey == LogicalKeyboardKey.escape) {
              _showSuggestions = false;
              _removeOverlay();
              return KeyEventResult.handled;
            } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
              setState(() {
                _selectedSuggestionIndex = (_selectedSuggestionIndex - 1)
                    .clamp(0, _filteredUsers.length - 1);
              });
              _showOverlay();
              return KeyEventResult.handled;
            } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
              setState(() {
                _selectedSuggestionIndex = (_selectedSuggestionIndex + 1)
                    .clamp(0, _filteredUsers.length - 1);
              });
              _showOverlay();
              return KeyEventResult.handled;
            }
          }
          return KeyEventResult.ignored;
        } else {
          if (event is KeyDownEvent) {
            if (event.logicalKey == LogicalKeyboardKey.enter) {
              final isShiftPressed = HardwareKeyboard.instance.isShiftPressed;
              if (!isShiftPressed) {
                _submitMessage();
                return KeyEventResult.handled;
              }
            }
          }
          return KeyEventResult.ignored;
        }
      },
      child: Row(
        children: [
          Expanded(
            child: CompositedTransformTarget(
              link: _layerLink,
              child: NextTextField(
                hintText: widget.hint,
                key: _textFieldKey,
                controller: controller,
                focusNode: _focusNode,
                minLines: 1,
                maxLines: 7,
                onSubmitted: (_) {
                  if (_showSuggestions && _filteredUsers.isNotEmpty) {
                    _onSuggestionSelected(
                      _filteredUsers[_selectedSuggestionIndex],
                    );
                  } else {
                    _submitMessage();
                  }
                },
                textInputAction: TextInputAction.newline,
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(
              AppIcons.send,
              color: theme.generalColors.primary,
            ),
            onPressed: _submitMessage,
          ),
        ],
      ),
    );
  }
}

String _formatRelativeTime(
  DateTime dateTime,
  ElbCoreLocalizations l10n,
) {
  final now = DateTime.now();
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

  final differenceInMin = now.difference(dateTime).inMinutes.abs();
  if (differenceInMin < 60) {
    return l10n.chat_message_min_ago(differenceInMin);
  }

  if (isSameDay) {
    return '${l10n.chat_today_at} ${dateTime.toTimeWithoutSeconds(l10n.localeName)}';
  }

  if (isYesterday) {
    return '${l10n.chat_yesterday_at} ${dateTime.toTimeWithoutSeconds(l10n.localeName)}';
  }

  return '${dateTime.toDate(l10n.localeName)} ${l10n.chat_at} ${dateTime.toTimeWithoutSeconds(l10n.localeName)}';
}
