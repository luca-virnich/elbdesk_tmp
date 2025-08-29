import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:flutter/material.dart';

/// Shows entity notes in a bottom sheet for mobile view
class EntityNotesBottomSheet extends ConsumerStatefulWidget {
  const EntityNotesBottomSheet({
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
  });

  final int entityId;
  final String tableType;
  final String floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  final bool isFirstRun;
  final String? hint;
  final AdditionalEntityData? additionalEntityData;
  final int? initialNoteId;
  final int? initialNoteParentId;

  static Future<void> show(
    BuildContext context, {
    required int entityId,
    required String tableType,
    required String floatingWindowId,
    required GlobalKey<NavigatorState> navigatorKey,
    required bool isFirstRun,
    String? hint,
    AdditionalEntityData? additionalEntityData,
    int? initialNoteId,
    int? initialNoteParentId,
  }) {
    return AppBottomSheet.show(
      context: context,
      title: context.l10n.chat_notes,
      icon: AppIcons.note,
      child: EntityNotesBottomSheet(
        entityId: entityId,
        tableType: tableType,
        floatingWindowId: floatingWindowId,
        navigatorKey: navigatorKey,
        isFirstRun: isFirstRun,
        hint: hint,
        additionalEntityData: additionalEntityData,
        initialNoteId: initialNoteId,
        initialNoteParentId: initialNoteParentId,
      ),
    );
  }

  @override
  ConsumerState<EntityNotesBottomSheet> createState() =>
      _EntityNotesBottomSheetState();
}

class _EntityNotesBottomSheetState
    extends ConsumerState<EntityNotesBottomSheet> {
  bool _isInThread = false;
  VoidCallback? _onBackPressed;

  @override
  void initState() {
    super.initState();
    // Ensure notes are visible when bottom sheet opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(showEntityNotesProvider(widget.floatingWindowId).notifier)
          .show();
    });
    _isInThread = widget.initialNoteParentId != null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final generalColors = theme.generalColors;

    // Calculate responsive sizing based on keyboard visibility

    return Consumer(
      builder: (context, ref, child) {
        final viewInsets = ref.watch(viewInsetsProvider);
        final keyboardHeight = viewInsets.bottom;

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: AppTripleRail(
                leading: _isInThread
                    ? GestureDetector(
                        onTap: _onBackPressed,
                        child: const Icon(Icons.arrow_back),
                      )
                    : null,
                middle: AppText(
                  _isInThread ? context.l10n.chat_thread : '',
                  fontWeight: FontWeight.w600,
                ),
                trailing: null,
              ),
            ),

            // Ultra-compact header with drag handle integrated

            // Notes content - using mobile view for proper mobile UX
            Expanded(
              child: EntityNotesMobileView(
                isFirstRun: widget.isFirstRun,
                initialNoteId: widget.initialNoteId,
                initialNoteParentId: widget.initialNoteParentId,
                entityId: widget.entityId,
                tableType: widget.tableType,
                floatingWindowId: widget.floatingWindowId,
                hint: widget.hint,
                additionalEntityData: widget.additionalEntityData,
                navigatorKey: widget.navigatorKey,
                threadId: widget.initialNoteParentId,
                onThreadChanged: (bool inThread, VoidCallback? onBack) {
                  setState(() {
                    _isInThread = inThread;
                    _onBackPressed = onBack;
                  });
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
