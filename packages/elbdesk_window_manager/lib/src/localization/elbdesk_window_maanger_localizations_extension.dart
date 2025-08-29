import 'package:elbdesk_window_manager/l10n/elb_wm_localizations.dart';
import 'package:flutter/widgets.dart';

/// Extension to provide quick access to localizations from BuildContext
extension ElbDeskWindowManagerLocalizationsExtension on BuildContext {
  /// Gets the ElbDeskWindowManagerLocalizations from the current context.
  ElbWmLocalizations get windowManagerL10n => ElbWmLocalizations.of(this);
}
