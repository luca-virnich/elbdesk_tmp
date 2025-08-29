import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/src/admin_migration/logic/migration_overlay_state.dart';

/// Displays a loading overlay specific to the admin data migration process.
class MigrationLoadingOverlay extends ConsumerWidget {
  const MigrationLoadingOverlay({
    required this.title,
    super.key,
    this.onCancelled,
  });

  final String title;

  final VoidCallback? onCancelled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overlayState = ref.watch(migrationOverlayStateProvider);
    // Use the reusable AppFullscreenLoadingOverlay, passing specific data
    return ElbDialog(
      floatingWindowId: null,
      dialogMode: ElbDialogMode.normal,
      title: title,
      hideTitlebar: true,
      blurBackground: true,
      blockShortcuts: true,
      minWidth: 900,
      insetPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32)
          .copyWith(top: 120),

      // description: overlayState.text ?? 'Kontakte werden migriert...'.hc,

      child: AppFullscreenLoadingOverlay(
        title: title,
        description: overlayState.text ?? 'Kontakte werden migriert...'.hc,
        progress: overlayState.progress,
      ),
      onCancel: () {
        // Call the provided callback
        onCancelled?.call();
        // Close the dialog associated with this overlay
        Navigator.of(context).pop();
      },
    );
  }
}
