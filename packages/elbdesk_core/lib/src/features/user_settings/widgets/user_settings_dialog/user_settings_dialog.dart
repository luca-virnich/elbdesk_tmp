import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/features/user_settings/extensions/app_theme_display_name_extension.dart';
import 'package:elbdesk_core/src/features/user_settings/extensions/locale_display_name_extension.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';

part 'drag_window_out_of_main_window_settings_area.dart';
part 'inactive_floating_overlay_color_area.dart';
part 'language_settings_area.dart';
part 'reduce_motion_settings_area.dart';
part 'table_prefix_settings_area.dart';
part 'theme_mode_settings_area.dart';
part 'toggle_collapse_card_sections_settings_area.dart';
part 'tooltips_settings_area.dart';

/// Represents the user settings overlay when clicking on the user profile
/// button [UserProfileMenuButton].
class UserSettingsOverlay extends HookConsumerWidget {
  /// @nodoc
  const UserSettingsOverlay({
    required this.onClose,
    required this.userName,
    super.key,
  });

  /// Callback when the user closes the overlay
  final VoidCallback onClose;

  /// User name
  final String userName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final controller = useScrollController();

    return ElbDialog(
      floatingWindowId: null,
      minWidth: 900,
      dialogMode: ElbDialogMode.normal,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: UiConstants.defaultPadding,
        vertical: UiConstants.defaultPadding,
      ),
      contentPadding: const EdgeInsets.all(
        UiConstants.defaultPadding,
      ).copyWith(right: 0),
      title: l10n.user_settings,
      icon: AppIcons.settings_outlined,
      onCancel: onClose,
      child: ListView(
        controller: controller,
        padding: const EdgeInsets.only(
          right: UiConstants.defaultPadding,
        ),
        shrinkWrap: true,
        children: [
          // Language
          const _LanguageSettingArea(),
          const AppListViewSeperator.divider(),

          // Theme mode
          const _ThemeModeSettingsArea(),
          const AppListViewSeperator.divider(),

          // Inactive floating overlay color
          const _InactiveFloatingOverlayColorArea(),
          const AppListViewSeperator.divider(),

          // TODO(all): implement reduce motion
          // Reduce motion
          // _ReduceMotionSettingsArea(),
          // AppListViewSeperator.divider(),

          // Drag window out of main window
          // _DragWindowOutOfMainWindowSettingsArea(),
          // AppListViewSeperator.divider(),

          // Toggle collapse card sections
          const _ToggleCollapseCardSectionsSettingsArea(),
          const AppListViewSeperator.divider(),

          // Tooltips
          const _TooltipsSettingsArea(),
          const AppListViewSeperator.divider(),

          // Table prefix
          _TablePrefixSettingsArea(
            userName: userName,
          ),
        ],
      ),
    );
  }
}
