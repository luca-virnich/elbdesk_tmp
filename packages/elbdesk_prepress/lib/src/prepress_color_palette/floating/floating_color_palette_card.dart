import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/prepress_color_palette/config/floating_prepress_color_palette_window_data.dart';
import 'package:elbdesk_prepress/src/prepress_color_palette/widgets/card/prepress_color_palette_card.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Color Book Card
///
/// Displays the [PrepressColorPaletteCard] in a floating window
class FloatingColorPaletteCard extends HookConsumerWidget {
  /// Creates a new [PrepressColorPaletteCard]
  const FloatingColorPaletteCard({
    required this.data,
    super.key,
  });
  final FloatingPrepressColorPaletteWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    return PrepressColorPaletteCard(
      floatingWindowId: data.floatingWindowId,
      colorPaletteId: data.colorPaletteId,
      tableSessionId: data.tableSessionId,
      floatingWindowFocus: floatingWindowFocus,
      customerId: data.customerId,
      floatingWindowType: data.windowType,
    );
  }
}
