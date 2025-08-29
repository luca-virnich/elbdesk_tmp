import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/prepress_color_palette/logic/prepress_color_palette_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A widget that displays and manages the main page
/// section of a [PrepressColorPalette].
///
/// This widget is responsible for displaying and editing the following fields:
/// - Color Book Name
/// - Description
///
class ColorPaletteCardMainPage extends HookConsumerWidget {
  /// Constructor
  const ColorPaletteCardMainPage({
    required this.readOnly,
    required this.constraints,
    required this.stateNotifier,
    required this.initialEntity,
    required this.validationGroupId,
    super.key,
  });

  final bool readOnly;
  final BoxConstraints constraints;
  final PrepressColorPaletteState stateNotifier;
  final PrepressColorPalette initialEntity;
  final String validationGroupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;
    final customerName = initialEntity.customer?.contact?.general.name ?? '';

    return Column(
      children: [
        CardSectionTitle(
          title: ppL10n.color_palette_general,
          trailingWidgets: [
            AppText(
              customerName,
            ),
          ],
        ),
        ElbTwoColumnWrap(
          width: constraints.maxWidth,
          customL10n: ppL10n,
          readOnly: readOnly,
          validationGroupId: validationGroupId,
          columnLeft: [
            //* Color Book Name *//
            ElbTwoColumnItem.text(
              field: PrepressColorPaletteFields.fromEnum(
                PrepressColorPaletteField.paletteName,
              ),
              initialValue: initialEntity.paletteName,
              readOnly: readOnly,
              onChanged: stateNotifier.updatePaletteName,
            ),
          ],
          columnRight: [
            //* Description *//
            ElbTwoColumnItem.text(
              field: PrepressColorPaletteFields.fromEnum(
                PrepressColorPaletteField.description,
              ),
              initialValue: initialEntity.description,
              readOnly: readOnly,
              onChanged: stateNotifier.updateDescription,
            ),
          ],
        ),
      ],
    );
  }
}
