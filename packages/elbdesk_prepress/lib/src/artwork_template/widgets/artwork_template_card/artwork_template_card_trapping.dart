part of 'artwork_template_card.dart';

// TODO(tk): Do we still need this?
class _ArtworkTemplateCardTrapping extends StatelessWidget {
  const _ArtworkTemplateCardTrapping({
    required this.stateNotifier,
    required this.initialTrapping,
    required this.width,
    required this.readOnly,
    required this.initialAnschnitt,
    required this.validationGroupId,
  });
  final ArtworkTemplateState stateNotifier;
  final Trapping initialTrapping;
  final double initialAnschnitt;
  final double width;
  final bool readOnly;
  final String validationGroupId;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CardSectionTitle(
          title: ppL10n.artwork_trapping_and_deduction,
        ),
        TwoColumnWrap(
          width: width,
          builder: (labelPosition, childWidth) {
            return [
              Column(
                children: [
                  NextCardFormField.double(
                    validationGroup: validationGroupId,
                    labelPosition: labelPosition,
                    initialDouble: initialTrapping.trappNormal,
                    validator: null,
                    onClear: (v) {
                      stateNotifier.updateTrappingNormal(0);
                    },
                    // onEmptyValue: () {
                    //   stateNotifier.updateTrappingNormal(0);
                    // },
                    onChanged: (v) {
                      final parsed = double.tryParse(v);
                      if (parsed != null) {
                        stateNotifier.updateTrappingNormal(parsed);
                      }
                    },
                    label: ppL10n.artwork_trapping_normal,
                    focusOrder: 2,
                    readOnly: readOnly,
                  ),
                  NextCardFormField.double(
                    validationGroup: validationGroupId,
                    labelPosition: labelPosition,
                    initialDouble: initialTrapping.trappBlack,
                    validator: null,
                    onClear: (v) {
                      stateNotifier.updateTrappingBlack(0);
                    },
                    onChanged: (v) {
                      final parsed = double.tryParse(v);
                      if (parsed != null) {
                        stateNotifier.updateTrappingBlack(parsed);
                      }
                    },
                    label: ppL10n.artwork_trapping_black,
                    focusOrder: 3,
                    readOnly: readOnly,
                  ),
                  NextCardFormField.double(
                    validationGroup: validationGroupId,
                    labelPosition: labelPosition,
                    initialDouble: initialTrapping.trappBilder,
                    validator: null,
                    onClear: (v) {
                      stateNotifier.updateTrappingBilder(0);
                    },
                    onChanged: (v) {
                      final parsed = double.tryParse(v);
                      if (parsed != null) {
                        stateNotifier.updateTrappingBilder(parsed);
                      }
                    },
                    label: ppL10n.artwork_trapping_pictures,
                    focusOrder: 4,
                    readOnly: readOnly,
                  ),
                ],
              ),
              Column(
                children: [
                  NextCardFormField.double(
                    validationGroup: validationGroupId,
                    labelPosition: labelPosition,
                    initialDouble: initialTrapping.trappSonderfarben,
                    validator: null,
                    onClear: (v) {
                      stateNotifier.updateTrappingSonderfarben(0);
                    },
                    onChanged: (v) {
                      final parsed = double.tryParse(v);
                      if (parsed != null) {
                        stateNotifier.updateTrappingSonderfarben(parsed);
                      }
                    },
                    label: ppL10n.artwork_trapping_special_colors,
                    focusOrder: 5,
                    readOnly: readOnly,
                  ),
                  NextCardFormField.double(
                    validationGroup: validationGroupId,
                    labelPosition: labelPosition,
                    initialDouble: initialTrapping.trappRueckzug,
                    validator: null,
                    onClear: (v) {
                      stateNotifier.updateTrappingRueckzug(0);
                    },
                    onChanged: (v) {
                      final parsed = double.tryParse(v);
                      if (parsed != null) {
                        stateNotifier.updateTrappingRueckzug(parsed);
                      }
                    },
                    label: ppL10n.artwork_trapping_pullback,
                    focusOrder: 6,
                    readOnly: readOnly,
                  ),
                  NextCardFormField.double(
                    validationGroup: validationGroupId,
                    labelPosition: labelPosition,
                    initialDouble: initialAnschnitt,
                    validator: null,
                    onClear: (v) {
                      stateNotifier.updateAnschnitt(0);
                    },
                    onChanged: (v) {
                      final parsed = double.tryParse(v);
                      if (parsed != null) {
                        stateNotifier.updateAnschnitt(parsed);
                      }
                    },
                    label: ppL10n.artwork_bleed,
                    focusOrder: 7,
                    readOnly: readOnly,
                  ),
                ],
              ),
            ];
          },
        ),
      ],
    );
  }
}

class RasterAngaben extends StatelessWidget {
  const RasterAngaben({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
