import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/mop_admin/widgets/pages/mop_admin_general_artwork_template_page.dart';
import 'package:elbdesk_prepress/src/mop_admin/widgets/pages/mop_admin_import_color_palette_page.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// MOP Admin Card
///
/// This card contains Prepress specific admin settings and configurations
class MopAdminCard extends HookConsumerWidget {
  /// Creates a new instance of MopAdminCard
  const MopAdminCard({
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.floatingWindowType,
    super.key,
  });

  /// The id of the floating window
  final String floatingWindowId;

  /// The focus node for the floating window
  final FocusNode floatingWindowFocus;

  /// The type of the floating window
  final String floatingWindowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    final sessionId = useUuid();

    return CustomCard(
      floatingWindowType: floatingWindowType,
      baseTitle: l10n.app_scope_mop_admin,
      iconData: AppIcons.mop_admin,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowId: floatingWindowId,
      childBuilder: (context, selectedNavIndexRef, navigatorKey) {
        return FloatingCardBody(
          isFirstRun: true,
          navigatorKey: navigatorKey,
          floatingWindowId: floatingWindowId,
          floatingWindowType: FloatingWindowType.mopAdmin.name,
          navigationGroups: [
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.artworkTemplate,
                  label: ppL10n.artwork_template_plural,
                ),
                CardNavigationItem(
                  icon: AppIcons.color_lens_outlined,
                  label: ppL10n.import_colors,
                ),
              ],
            ),
          ],
          children: [
            CardBodyItem(
              keepAlive: false,
              loadLazy: true,
              child: MopAdminGeneralArtworkTemplatePage(
                sessionId: sessionId,
                floatingWindowFocus: floatingWindowFocus,
                floatingWindowId: floatingWindowId,
                navigatorKey: navigatorKey,
              ),
            ),
            CardBodyItem(
              keepAlive: false,
              loadLazy: true,
              child: TableCardItem(
                table: MopAdminImportColorPalettePage(
                  floatingWindowId: floatingWindowId,
                  floatingWindowFocus: floatingWindowFocus,
                  navigatorKey: navigatorKey,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
