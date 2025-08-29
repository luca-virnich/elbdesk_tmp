import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/artwork/logic/artwork_state.dart';
import 'package:elbdesk_prepress/src/artwork_code/_export_artwork_code.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Widget that displays and allows editing of Aztec code specific fields
class AztecCodeView extends HookConsumerWidget {
  const AztecCodeView({
    required this.code,
    required this.readOnly,
    required this.stateNotifier,
    required this.width,
    super.key,
  });

  final ArtworkCode code;
  final ArtworkState? stateNotifier;
  final bool readOnly;

  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;
    return AppCardTile(
      title: ppL10n.artwork_code_aztec,
      leadingIcon: const ElbIcon(AppIcons.code_aztec, size: AppIconSize.l),
      onTitleTap: null,
      onDelete: readOnly
          ? null
          : () {
              stateNotifier?.deleteArtworkCode(code.runtimeId);
            },
      content: _AztecCodeContent(
        code: code,
        readOnly: readOnly,
        width: width,
        stateNotifier: stateNotifier,
      ),
    );
  }
}

/// Content widget for Aztec code fields
class _AztecCodeContent extends StatelessWidget {
  const _AztecCodeContent({
    required this.code,
    required this.readOnly,
    required this.width,
    required this.stateNotifier,
  });

  final ArtworkCode code;
  final bool readOnly;
  final double width;
  final ArtworkState? stateNotifier;

  @override
  Widget build(BuildContext context) {
    final ppL10n = context.prepressL10n;
    return FocusTraversalGroup(
      policy: OrderedTraversalPolicy(),
      child: TwoColumnWrap(
        width: width - AppSpace.l * 2,
        builder: (labelPosition, childWidth) {
          return [
            Column(
              children: [
                NextCardFormField.double(
                  initialDouble: code.codeAztec?.symbolSize ?? 0.0,
                  labelPosition: labelPosition,
                  readOnly: readOnly,
                  label: ppL10n.artwork_code_symbol_size,
                  focusOrder: 1,
                  onChanged: (value) {
                    final parsed = Parser.parseDouble(value);
                    stateNotifier?.updateArtworkCode(
                      code.copyWith(
                        codeAztec: code.codeAztec?.copyWith(symbolSize: parsed),
                      ),
                    );
                  },
                  validationGroup: null,
                  // onClear: (v) {
                  //   stateNotifier.updateArtworkCode(
                  //     code.copyWith(
                  //       codeAztec: code.codeAztec?.copyWith(symbolSize: 0),
                  //     ),
                  //   );
                  // },
                ),
                // Error Correction
                NextCardFormField.double(
                  initialDouble: code.codeAztec?.errorCorrection ?? 0.0,
                  labelPosition: labelPosition,
                  readOnly: readOnly,
                  label: ppL10n.artwork_code_error_correction,
                  focusOrder: 2,
                  onChanged: (value) {
                    final parsed = Parser.parseDouble(value);
                    stateNotifier?.updateArtworkCode(
                      code.copyWith(
                        codeAztec:
                            code.codeAztec?.copyWith(errorCorrection: parsed),
                      ),
                    );
                  },
                  validationGroup: null,
                ),
              ],
            ),
            Column(
              children: [
                // Device Compensation
                NextCardFormField.double(
                  initialDouble: code.codeAztec?.deviceCompensation ?? 0.0,
                  labelPosition: labelPosition,
                  readOnly: readOnly,
                  label: ppL10n.artwork_code_device_compensation,
                  focusOrder: 3,
                  onChanged: (value) {
                    final parsed = Parser.parseDouble(value);
                    stateNotifier?.updateArtworkCode(
                      code.copyWith(
                        codeAztec: code.codeAztec
                            ?.copyWith(deviceCompensation: parsed),
                      ),
                    );
                  },
                  validationGroup: null,
                ),
                // Cell Size
                NextCardFormField.double(
                  initialDouble: code.codeAztec?.cellSize ?? 0.0,
                  labelPosition: labelPosition,
                  readOnly: readOnly,
                  label: ppL10n.artwork_code_cell_size,
                  focusOrder: 4,
                  onChanged: (value) {
                    final parsed = Parser.parseDouble(value);
                    stateNotifier?.updateArtworkCode(
                      code.copyWith(
                        codeAztec: code.codeAztec?.copyWith(cellSize: parsed),
                      ),
                    );
                  },
                  validationGroup: null,
                ),
              ],
            ),
          ];
        },
      ),
    );
  }
}
