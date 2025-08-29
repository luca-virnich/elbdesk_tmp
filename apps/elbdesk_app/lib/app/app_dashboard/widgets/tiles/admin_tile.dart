import 'package:elbdesk_app/app/app_dashboard/widgets/tiles/entity_note_notification_grid_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdminTile extends ConsumerWidget {
  /// Creates an [AdminTile].
  ///
  /// If [tileId] is provided, the tile is considered removable.
  const AdminTile({
    super.key,
    this.tileId,
  });

  /// The unique identifier of the tile used for removal.
  final String? tileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return EntityNoteNotificationGridTile(
      tileId: tileId,
    );

    // final filePickerController = ref.read(filePickerControllerProvider);

    // final l10n = context.l10n;
    // return DashboardGridTile(
    //   tileId: tileId,
    //   title: l10n.admin_title,
    //   leadingIcon: AppIcons.admin_panel_settings,
    //   children: [
    //     AppListTile(
    //       titleText: l10n.crm_contact_plural,
    //       onPressed: () {
    //         ref
    //             .read(
    //               floatingWindowDataStateProvider.notifier,
    //             )
    //             .addWindow(
    //               FloatingContactTableWindowData(),
    //             );
    //       },
    //     ),
    //     AppListTile(
    //       titleText: l10n.crm_contacts_persons,
    //       onPressed: () {
    //         ref
    //             .read(
    //               floatingWindowDataStateProvider.notifier,
    //             )
    //             .addWindow(
    //               FloatingContactPersonTableWindowData(),
    //             );
    //       },
    //     ),
    //     AppListTile(
    //       titleText: l10n.crm_contacts_companies,
    //       onPressed: () {
    //         ref
    //             .read(
    //               floatingWindowDataStateProvider.notifier,
    //             )
    //             .addWindow(
    //               FloatingContactCompanyTableWindowData(),
    //             );
    //       },
    //     ),
    //     const SizedBox(height: UiConstants.defaultPadding),
    //     AppButton.primary(
    //       label: l10n.pick_png_file,
    //       onPressed: () async {
    //         final file = await filePickerController.pickPngFile();

    //         if (file == null) {
    //           return;
    //         }

    //         // Example usage of both successful and failed uploads
    //         final fileName =
    //             await ref.read(ahoiFileStorageControllerProvider).upload(file);

    //         final downloadBytes = await ref
    //             .read(ahoiFileStorageControllerProvider)
    //             .download(fileName);

    //         await ref.read(imageFileProvider.notifier).addBytes(downloadBytes);
    //       },
    //     ),
    //     const SizedBox(height: UiConstants.defaultPadding),
    //     ref.watch(imageFileProvider).when(
    //           data: (bytes) {
    //             if (bytes == null) {
    //               return const SizedBox();
    //             }
    //             return Image.memory(bytes, width: 200);
    //           },
    //           loading: () => const CircularProgressIndicator(),
    //           // TODO: merge conflict
    //           error: (error, _) => AppText(error.toString()),
    //           // error: (error, _) => AppText(l10n.gen_error(error)),
    //         ),
    //   ],
    // );
  }
}
