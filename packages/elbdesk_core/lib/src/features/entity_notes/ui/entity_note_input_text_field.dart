part of '../entity_notes_view.dart';

typedef OnMessageSubmitted = void Function(String text, List<Mention> mentions);

class _EntityNoteInputTextField extends ConsumerStatefulWidget {
  const _EntityNoteInputTextField({
    required this.availableUsers,
    required this.onSubmitted,
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.inputFocusNode,
    this.hint,
    this.initialNote,
    this.isEditingNotifier,
  });

  final List<LightUser> availableUsers;
  final FocusNode inputFocusNode;

  final String? hint;
  final OnMessageSubmitted onSubmitted;
  final String floatingWindowId;
  final EntityNote? initialNote;
  final ValueNotifier<bool>? isEditingNotifier;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EntityNoteInputTextFieldState();
}

class _EntityNoteInputTextFieldState
    extends ConsumerState<_EntityNoteInputTextField> {
  late MentionEditingController controller;

  late FocusNode _rawKeyboardFocusNode;
  final GlobalKey _editorKey = GlobalKey();

  List<LightUser> _filteredUsers = [];
  int _mentionStartIndex = -1;
  String _currentMentionText = '';
  int _selectedSuggestionIndex = 0;
  bool _showSuggestions = false;
  OverlayEntry? _suggestionsOverlay;
  bool isSideMenuOpen = false;

  @override
  void initState() {
    super.initState();
    controller = MentionEditingController();

    _rawKeyboardFocusNode = FocusNode();
    controller.addListener(_onTextChanged);
    if (widget.initialNote != null) {
      _startEditing(widget.initialNote!.message);
    }
  }

  void _startEditing(String message) {
    setState(() {
      // Parse mentions from storage format
      var displayText = message;
      final mentions = <Mention>[];

      final regex = RegExp(r'\[user:([^\]]+)\]');
      final matches = regex.allMatches(message);

      var offset = 0;
      for (final match in matches) {
        final userId = int.parse(match.group(1)!);
        final user =
            widget.availableUsers.firstWhere((u) => u.userInfoId == userId);
        final before = displayText.substring(0, match.start - offset);
        final after = displayText.substring(match.end - offset);
        final token = '@${user.fullName}';
        displayText = '$before$token$after';

        mentions.add(
          Mention(
            userId: userId,
            userName: user.fullName,
            start: before.length,
            end: before.length + token.length,
          ),
        );

        offset += match.group(0)!.length - token.length;
      }

      controller.text = displayText;
      controller.mentions = mentions;
    });
  }

  @override
  void dispose() {
    _rawKeyboardFocusNode.dispose();
    controller.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _onTextChanged() {
    if (controller.isModifying) return;
    final text = controller.text;
    final selection = controller.selection;
    if (selection.baseOffset < 0) return;

    // Prüfe ob eine bestätigte Mention teilweise gelöscht wurde
    final deletedMention = controller.mentions.firstWhereOrNull((m) {
      if (selection.baseOffset > m.start! && selection.baseOffset <= m.end!) {
        if (m.start! >= text.length) return true;
        final end = math.min(m.end!, text.length);
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
    final before = text.substring(0, math.min(mention.start!, text.length));
    final after = text.substring(math.min(mention.end!, text.length));

    // Behalte das @ Symbol
    const atSymbol = '@';

    controller.isModifying = true;
    controller.text = '$before$atSymbol$after';
    controller.selection = TextSelection.collapsed(
      offset:
          math.min(mention.start!, text.length) + 1, // +1 für Cursor nach dem @
    );
    controller.isModifying = false;
    controller.mentions.remove(mention);
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

    // Wenn der Text leer ist, alle Mentions löschen
    if (text.isEmpty) {
      controller.mentions = [];
      return;
    }

    final updatedMentions = <Mention>[];

    // Sortiere die Mentions nach Position, um Überlappungen zu vermeiden
    final sortedMentions = controller.mentions.toList()
      ..sort((a, b) => a.start!.compareTo(b.start!));

    for (final mention in sortedMentions) {
      final expectedText = '@${mention.userName}';
      // Versuche zuerst an der ursprünglichen Position zu finden
      var start = -1;
      if (mention.start! < text.length) {
        start = text.indexOf(expectedText, mention.start!);
      }
      // Wenn nicht gefunden, suche im gesamten Text
      if (start == -1) {
        start = text.indexOf(expectedText);
      }
      // Nur hinzufügen wenn gefunden und der Text noch lang genug ist
      if (start != -1 && start + expectedText.length <= text.length) {
        // Prüfe auf Überlappungen mit bereits gefundenen Mentions
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
    if (_mentionStartIndex < 0 ||
        _mentionStartIndex >= controller.text.length) {
      return;
    }

    final text = controller.text;
    final selection = controller.selection;

    // Sicherstellen, dass die Selektion gültig ist
    final baseOffset = math.min(selection.baseOffset, text.length);

    final before = text.substring(0, _mentionStartIndex);
    final after = text.substring(baseOffset);
    final token = '@${user.fullName}';
    final newText = '$before$token $after';

    // Prüfe ob die neue Mention mit existierenden überlappt
    final newStart = before.length;
    final newEnd = before.length + token.length;
    final overlaps = controller.mentions.any(
      (m) =>
          (newStart >= m.start! && newStart < m.end!) ||
          (newEnd > m.start! && newEnd <= m.end!),
    );

    if (!overlaps) {
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
    }

    _showSuggestions = false;
    _removeOverlay();
    _currentMentionText = '';
    _mentionStartIndex = -1;
    setState(() {});
  }

  void _submitMessage() {
    final text = controller.text.trim();
    if (text.isEmpty) return;

    // Aktualisiere die Mentions ein letztes Mal vor dem Absenden
    _updateMentionsFromText();

    // final sortedMentions = controller.mentions.toList()
    //   ..sort((a, b) => b.start!.compareTo(a.start!)); // Rückwärts sortieren!

    // for (final mention in sortedMentions) {
    //   final before = text.substring(0, mention.start);
    //   final after = text.substring(mention.end!);
    //   text = '$before[user:${mention.userId}]$after';
    // }

    widget.onSubmitted(text, controller.mentions);
    controller.text = '';
    controller.mentions.clear();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return LayoutBuilder(
      builder: (context, constraints) {
        // Wenn sich die Constraints ändern (z.B. durch Resize),
        // Overlay neu positionieren
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_suggestionsOverlay != null) {
            _removeOverlay();
            if (_showSuggestions) {
              _showOverlay();
            }
          }
        });

        return Consumer(
          builder: (context, ref, child) {
            ref.listen(showEntityNotesProvider(widget.floatingWindowId),
                (previous, next) {
              if (next == false) {
                _removeOverlay();
              }
            });
            return Container(
              key: _editorKey,
              padding: widget.initialNote == null
                  ? const EdgeInsets.all(UiConstants.defaultPadding)
                      .copyWith(top: UiConstants.elementMargin)
                  : const EdgeInsets.only(top: UiConstants.defaultPadding),
              child: Focus(
                focusNode: _rawKeyboardFocusNode,
                onKeyEvent: (_, KeyEvent event) {
                  if (_showSuggestions) {
                    if (event is KeyDownEvent) {
                      if (event.logicalKey == LogicalKeyboardKey.enter) {
                        _onSuggestionSelected(
                          _filteredUsers[_selectedSuggestionIndex],
                        );
                        return KeyEventResult.handled;
                      } else if (event.logicalKey ==
                          LogicalKeyboardKey.escape) {
                        setState(() {
                          _showSuggestions = false;
                          _removeOverlay();
                        });
                        return KeyEventResult.handled;
                      } else if (event.logicalKey ==
                          LogicalKeyboardKey.arrowUp) {
                        setState(() {
                          _selectedSuggestionIndex =
                              (_selectedSuggestionIndex - 1) < 0
                                  ? _filteredUsers.length - 1
                                  : _selectedSuggestionIndex - 1;
                        });
                        _suggestionsOverlay?.markNeedsBuild();
                        return KeyEventResult.handled;
                      } else if (event.logicalKey ==
                          LogicalKeyboardKey.arrowDown) {
                        setState(() {
                          _selectedSuggestionIndex =
                              (_selectedSuggestionIndex + 1) %
                                  _filteredUsers.length;
                        });
                        _suggestionsOverlay?.markNeedsBuild();
                        return KeyEventResult.handled;
                      }
                    }
                    return KeyEventResult.ignored;
                  } else {
                    if (event is KeyDownEvent) {
                      if (event.logicalKey == LogicalKeyboardKey.enter) {
                        final isShiftPressed =
                            HardwareKeyboard.instance.isShiftPressed;
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
                      child: NextTextField(
                        controller: controller,
                        focusNode: widget.inputFocusNode,
                        minLines: 2,
                        maxLines: 7,
                        hintText: l10n.chat_add_a_note_hint,
                        textInputAction: TextInputAction.newline,
                      ),
                    ),
                    if (widget.initialNote != null)
                      Padding(
                        padding: const EdgeInsets.only(
                          left: UiConstants.elementMargin,
                        ),
                        child: AppIconButton(
                          iconData: AppIcons.cancel,
                          onPressed: () {
                            widget.isEditingNotifier?.value = false;
                          },
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: UiConstants.elementMargin,
                      ),
                      child: AppIconButton(
                        iconData: AppIcons.send,
                        onPressed: _submitMessage,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
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
        final navigatorBox = widget.navigatorKey.currentContext
            ?.findRenderObject() as RenderBox?;

        if (navigatorBox == null) return const SizedBox.shrink();

        final navPosition = navigatorBox.localToGlobal(Offset.zero);
        final textFieldBox =
            _editorKey.currentContext!.findRenderObject()! as RenderBox;
        final textFieldPosition = textFieldBox.localToGlobal(Offset.zero);
        final textFieldHeight = textFieldBox.size.height;

        // Position relativ zum Navigator berechnen
        final relativeY = textFieldPosition.dy - navPosition.dy;

        final topPosition = relativeY < 200
            ? relativeY + textFieldHeight + 10
            : relativeY - 195;

        // if (position.dy < 265) {
        //   _removeOverlay();
        // }
        final isSideMenuOpen = ref.read(
          cardNavigationExpandedStateProvider(widget.floatingWindowId),
        );

        return Stack(
          children: [
            Positioned.fill(
              child: ModalBarrier(
                color: Colors.transparent,
                onDismiss: () {
                  setState(() {
                    _showSuggestions = false;
                    _removeOverlay();
                  });
                },
              ),
            ),
            Positioned(
              right: isSideMenuOpen ? 230 : 100,
              top: topPosition,
              width: 415,
              height: 200,
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  decoration: BoxDecoration(
                    color: context.appTheme.generalColors.background,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: context.appTheme.generalColors.primarySurface,
                    ),
                  ),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: _filteredUsers.length,
                    itemBuilder: (context, index) {
                      return ColoredBox(
                        color: index == _selectedSuggestionIndex
                            ? context.appTheme.generalColors.primarySurface
                            : Colors.transparent,
                        child: ListTile(
                          dense: true,
                          visualDensity: VisualDensity.compact,
                          title: Text(_filteredUsers[index].fullName),
                          onTap: () =>
                              _onSuggestionSelected(_filteredUsers[index]),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
