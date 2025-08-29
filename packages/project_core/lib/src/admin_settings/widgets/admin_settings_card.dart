import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Admin Settings Card
///
/// This card contains settings that the admin can adjust
///
/// - Country Code
/// - Language Code
/// - Payment Code
/// - Salutation Code
/// - Department Code
/// - Prepress Color Import
/// - Global Settings (Contains the AE Endpoint and the DataImport Output Path)
class AdminSettingsCard extends HookConsumerWidget {
  const AdminSettingsCard({
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.floatingWindowType,
    super.key,
  });

  /// The id of the floating window
  final String floatingWindowId;

  /// The focus node for the floating window
  final FocusNode floatingWindowFocus;
  final String floatingWindowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generalValidationGroupId = useUuid();
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;

    // Generated in this card to be able to fetch the state from here
    final globalSettingsSessionId = useUuid();

    // Store initial settings to compare against when closing the window
    final initialOrSavedGlobalSettings = useRef<GlobalSettings?>(null);

    /// Checks if there are unsaved changes by comparing current GlobalSettings
    /// with initial or saved GlobalSettings
    Future<bool> checkUnsavedChanges(
      GlobalSettings? currentSettings,
      GlobalKey<NavigatorState> navigatorKey,
    ) async {
      if (initialOrSavedGlobalSettings.value == null ||
          currentSettings == null) {
        return true;
      }

      final hasChanges = hasEntityChanges(
        initialOrSavedGlobalSettings.value,
        currentSettings,
      );

      // Show Dialog if changes are detected
      if (hasChanges) {
        final result = await showElbDialog<bool>(
          context: context,
          navigatorKey: navigatorKey,
          isDismissible: false,
          child: const CloseFloatingWindowDialog(),
        );

        return result ?? false;
      } else {
        return true;
      }
    }

    return CustomCard(
      baseTitle: l10n.admin_title,
      iconData: AppIcons.admin_settings,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowType: floatingWindowType,
      floatingWindowId: floatingWindowId,
      // Check for unsaved changes and release lock when closing window
      onClose: (navigatorKey) async {
        // null if no GlobalSettings where fetched (CardItem not opened)
        if (initialOrSavedGlobalSettings.value == null) return true;

        final currentSettings = ref
            .read(
              globalSettingsStateProvider(
                initialOrSavedGlobalSettings.value!.meta.id!,
                globalSettingsSessionId,
              ),
            )
            .valueOrNull;

        return checkUnsavedChanges(currentSettings, navigatorKey);
      },
      childBuilder: (context, selectedNavIndexRef, navigatorKey) {
        return FloatingCardBody(
          floatingWindowType: FloatingWindowType.adminSettings.name,
          isFirstRun: true,
          navigatorKey: navigatorKey,
          floatingWindowId: floatingWindowId,
          navigationGroups: [
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.customer,
                  label: crmL10n.app_client_plural,
                ),
                CardNavigationItem(
                  icon: AppIcons.global_settings,
                  label: l10n.gen_global_settings,
                ),
              ],
            ),
          ],
          children: [
            CardBodyItem(
              keepAlive: false,
              loadLazy: true,
              child: TableCardItem(
                table: AppClientTable(
                  navigatorKey: navigatorKey,
                  componentIdentifier:
                      ComponentIdentifier.adminSettingsAppClientTable,
                  isCollapsible: false,
                ),
              ),
            ),
            CardBodyItem(
              // keepAlive to provide "save changes" dialog on close after
              // user might have switched the tab
              keepAlive: true,
              loadLazy: true,
              child: GlobalSettingsPage(
                floatingWindowFocus: floatingWindowFocus,
                navigatorKey: navigatorKey,
                validationGroupId: generalValidationGroupId,

                floatingWindowId: floatingWindowId,
                sessionId: globalSettingsSessionId,
                // Store initial settings for comparison
                onInitialSettings: (settings, id) {
                  initialOrSavedGlobalSettings.value = settings;
                },
                // Update initial settings after successful save
                // This applies when the user clicks "Save" instead of
                // "Save & Close"
                onSave: (settings) {
                  initialOrSavedGlobalSettings.value = settings;
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
