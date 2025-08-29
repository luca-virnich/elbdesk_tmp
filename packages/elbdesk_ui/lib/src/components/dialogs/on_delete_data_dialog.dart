import 'package:elbdesk_core/l10n/l10n_extension.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// A dialog that is shown when the user tries to delete data.
///
/// The [OnDeleteDataDialog] widget displays a dialog with a warning message and
/// two action buttons. If the user confirms the action, it will call the
/// provided [onDelete] callback and close the dialog.
///
/// {@tool snippet}
/// This example shows how to use [OnDeleteDataDialog] to display a delete
/// confirmation dialog:
///
/// ```dart
/// showDialog(
///   context: context,
///   builder: (context) => OnDeleteDataDialog(
///     onDelete: () {
///       // Handle delete action
///     },
///   ),
/// );
/// ```
/// {@end-tool}
///
/// See also:
///

///  * [AppButton], which is used for the action buttons.
class OnDeleteDataDialog extends HookWidget {
  /// Creates an [OnDeleteDataDialog].
  ///
  /// The [onDelete] parameter is optional and will be called if the user
  /// confirms the delete action.
  const OnDeleteDataDialog({
    required this.onDelete,
    super.key,
  });

  /// The callback to invoke when the delete button is pressed.
  final Future<void> Function() onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isDeleting = useState<bool>(false);

    return ElbAlertDialog(
      titleText: l10n.gen_delete,
      contentText: l10n.gen_should_be_deleted,
      actions: [
        AppButton.secondary(
          onPressed: isDeleting.value
              ? null
              : () {
                  Navigator.of(context).pop();
                },
          label: l10n.gen_cancel,
        ),
        AppButton.danger(
          isLoading: isDeleting.value,
          onPressed: isDeleting.value
              ? null
              : () async {
                  isDeleting.value = true;
                  await onDelete.call();
                  if (context.mounted) {
                    isDeleting.value = false;
                    Navigator.of(context).pop();
                  }
                },
          label: l10n.gen_delete,
        ),
      ],
    );
  }
}
