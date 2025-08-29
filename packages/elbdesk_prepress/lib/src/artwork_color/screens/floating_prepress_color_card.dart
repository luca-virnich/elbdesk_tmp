import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_color/config/floating_artwork_color_window_data.dart';
import 'package:elbdesk_prepress/src/artwork_color/screens/prepress_color_card.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// CoeColor Card
///
/// Displays the [PrepressColorCard] in a floating window
class FloatingPrepressColorCard extends HookConsumerWidget {
  /// Creates a new [PrepressColorCard]
  const FloatingPrepressColorCard({
    required this.data,
    super.key,
  });

  final FloatingPrepressColorWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    return PrepressColorCard(
      floatingWindowId: data.floatingWindowId,
      colorId: data.colorId,
      tableSessionId: data.tableSessionId,
      colorPaletteId: data.colorPaletteId,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowType: data.windowType,
    );
  }
}
