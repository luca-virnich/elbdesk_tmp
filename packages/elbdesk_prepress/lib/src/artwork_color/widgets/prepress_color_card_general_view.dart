import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/artwork_color/config/artwork_color_fields.dart';
import 'package:elbdesk_prepress/src/artwork_color/logic/artwork_color_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A widget that displays and manages the general information
/// section of an [ArtworkColor].
///
/// This widget is responsible for displaying and editing the following fields:
/// - Color name
/// - Short name
/// - Hex code
///
class PrepressColorCardGeneralView extends HookConsumerWidget {
  /// Constructor
  const PrepressColorCardGeneralView({
    required this.readOnly,
    required this.constraints,
    required this.stateNotifier,
    required this.initialEntity,
    required this.entityId,
    required this.validationGroupId,
    required this.navigatorKey,
    required this.sessionId,
    super.key,
  });

  final bool readOnly;
  final BoxConstraints constraints;
  final ArtworkColorState stateNotifier;
  final ArtworkColor initialEntity;
  final String validationGroupId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String sessionId;
  final int entityId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;
    return ElbTwoColumnWrap(
      width: constraints.maxWidth,
      readOnly: true,
      validationGroupId: null,
      customL10n: ppL10n,
      columnLeft: [
        //* CoeColor Name *//
        ElbTwoColumnItem.text(
          field: ArtworkColorFields.fromEnum(ArtworkColorField.colorName),
          readOnly: readOnly,
          initialValue: initialEntity.colorName,
          onChanged: stateNotifier.updateCoeColorName,
        ),
        //* Short Name *//
        ElbTwoColumnItem.text(
          field: ArtworkColorFields.fromEnum(ArtworkColorField.shortName),
          readOnly: readOnly,
          initialValue: initialEntity.shortName,
          onChanged: stateNotifier.updateShortName,
        ),
      ],
      columnRight: [
        ElbTwoColumnWrapCustomItem<ElbPrepressLocalizations>(
          label: '',
          childBuilder: (labelPosition) {
            //* Hex Code *//
            return _ColorPicker(
              readOnly: readOnly,
              sessionId: sessionId,
              entityId: entityId,
              constraints: constraints,
              stateNotifier: stateNotifier,
              initialEntity: initialEntity,
              validationGroupId: validationGroupId,
              navigatorKey: navigatorKey,
            );
          },
        ),
      ],
    );
  }
}

class _ColorPicker extends ConsumerWidget {
  const _ColorPicker({
    required this.readOnly,
    required this.constraints,
    required this.stateNotifier,
    required this.initialEntity,
    required this.validationGroupId,
    required this.navigatorKey,
    required this.sessionId,
    required this.entityId,
  });

  final bool readOnly;
  final BoxConstraints constraints;
  final ArtworkColorState stateNotifier;
  final ArtworkColor initialEntity;
  final String validationGroupId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String sessionId;
  final int entityId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;
    final selectedColor = ref.watch(
      artworkColorStateProvider(
        entityId,
        sessionId,
      ).select((value) => value.requireValue.color),
    );
    return AppCardColorPicker(
      navigatorKey: navigatorKey,
      readOnly: readOnly,
      label: ppL10n.color_hex_code,
      initialColor: selectedColor ?? context.appTheme.generalColors.transparent,
      onChanged: stateNotifier.updateColor,
    );
  }
}
