import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/artwork_color/widgets/color_table/prepress_color_import_area.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrepressColorImportCardBody extends HookConsumerWidget {
  const PrepressColorImportCardBody({
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    super.key,
  });
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;
    return LayoutBuilder(
      builder: (context, constraints) {
        dlog(constraints.maxHeight);
        return PrepressColorImportArea(
          navigatorKey: navigatorKey,
          floatingWindowId: floatingWindowId,
          floatingWindowFocus: floatingWindowFocus,
          onImport: (colors, paletteName) async {
            final artworkColors = colors
                .map(
                  (c) => c.toDTO(),
                )
                .toList();

            await ref.read(artworkColorRepositoryProvider).importColors(
                  artworkColors: artworkColors,
                  paletteName: paletteName,
                );
            if (context.mounted) {
              AppNotificationOverlay.success(
                context,
                ppL10n.color_import_success_message,
              );
            }
          },
        );
      },
    );
  }
}
