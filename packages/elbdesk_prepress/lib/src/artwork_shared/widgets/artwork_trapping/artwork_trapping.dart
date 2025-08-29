import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork/config/artwork_fields.dart';
import 'package:elbdesk_prepress/src/artwork/models/trapping.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Trapping and Bleed
///
/// Bleed = Anschnitt (ger)
///
/// A widget that displays the trapping and bleed values
class ArtworkTrappingAndBleed extends StatelessWidget {
  const ArtworkTrappingAndBleed({
    required this.initialTrapping,
    required this.width,
    required this.readOnly,
    required this.initialBleed,
    required this.onTrappingNormalChanged,
    required this.onTrappingBlackChanged,
    required this.onTrappingBilderChanged,
    required this.onTrappingSonderfarbenChanged,
    required this.onTrappingRueckzugChanged,
    required this.onBleedChanged,
    required this.identifier,
    super.key,
  });

  final Trapping initialTrapping;
  final double initialBleed;
  final double width;
  final bool readOnly;
  final void Function(double) onTrappingNormalChanged;
  final void Function(double) onTrappingBlackChanged;
  final void Function(double) onTrappingBilderChanged;
  final void Function(double) onTrappingSonderfarbenChanged;
  final void Function(double) onTrappingRueckzugChanged;
  final void Function(double) onBleedChanged;
  final ComponentIdentifier identifier;
  @override
  Widget build(BuildContext context) {
    final ppL10n = context.prepressL10n;

    return CollapsibleCardSection(
      title: ppL10n.trapping_and_bleed,
      identifier: identifier.name,
      child: FocusTraversalGroup(
        policy: OrderedTraversalPolicy(),
        child: ElbTwoColumnWrap(
          width: width,
          readOnly: true,
          validationGroupId: null,
          customL10n: ppL10n,
          columnLeft: [
            ElbTwoColumnItem.double(
              field: ArtworkFields.fromEnum(
                ArtworkField.trappNormal,
              ),
              initialValue: initialTrapping.trappNormal,
              onChanged: (value) {
                onTrappingNormalChanged(value ?? 0);
              },
              readOnly: readOnly,
            ),
            ElbTwoColumnItem.double(
              field: ArtworkFields.fromEnum(
                ArtworkField.trappBlack,
              ),
              initialValue: initialTrapping.trappBlack,
              onChanged: (value) {
                onTrappingBlackChanged(value ?? 0);
              },
              readOnly: readOnly,
            ),
            ElbTwoColumnItem.double(
              field: ArtworkFields.fromEnum(
                ArtworkField.trappBlack,
              ),
              initialValue: initialTrapping.trappBlack,
              onChanged: (value) {
                onTrappingBlackChanged(value ?? 0);
              },
              readOnly: readOnly,
            ),
            ElbTwoColumnItem.double(
              field: ArtworkFields.fromEnum(
                ArtworkField.trappSonderfarben,
              ),
              initialValue: initialTrapping.trappSonderfarben,
              onChanged: (value) {
                onTrappingSonderfarbenChanged(value ?? 0);
              },
              readOnly: readOnly,
            ),
          ],
          columnRight: [
            ElbTwoColumnItem.double(
              field: ArtworkFields.fromEnum(
                ArtworkField.trappBilder,
              ),
              initialValue: initialTrapping.trappBilder,
              onChanged: (value) {
                onTrappingBilderChanged(value ?? 0);
              },
              readOnly: readOnly,
            ),
            ElbTwoColumnItem.double(
              field: ArtworkFields.fromEnum(
                ArtworkField.trappRueckzug,
              ),
              initialValue: initialTrapping.trappRueckzug,
              onChanged: (value) {
                onTrappingRueckzugChanged(value ?? 0);
              },
              readOnly: readOnly,
            ),
            ElbTwoColumnItem.double(
              field: ArtworkFields.fromEnum(
                ArtworkField.anschnitt,
              ),
              initialValue: initialBleed,
              onChanged: (value) {
                onBleedChanged(value ?? 0);
              },
              readOnly: readOnly,
            ),
          ],
        ),
      ),
    );
  }
}
