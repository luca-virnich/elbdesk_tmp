import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Import Color Palette Page
///
/// This page allows viewing and importing color palettes for the MOP admin.
class MopAdminImportColorPalettePage extends StatelessWidget {
  const MopAdminImportColorPalettePage({
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.navigatorKey,
    super.key,
  });

  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return PrepressColorPaletteTable.standard(
      floatingWindowId: floatingWindowId,
      navigatorKey: navigatorKey,
      componentIdentifier: ComponentIdentifier.mopAdminGeneralArtworkTemplates,
      availableFilterFieldsWithLabels: const {},
    );
  }
}
