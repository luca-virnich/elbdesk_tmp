import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';

class CardNavigationItems {
  const CardNavigationItems._();

  static CardNavigationItem changelog(ElbCoreLocalizations l10n) =>
      CardNavigationItem(
        icon: AppIcons.history,
        label: l10n.gen_change_log_singular,
      );
}
