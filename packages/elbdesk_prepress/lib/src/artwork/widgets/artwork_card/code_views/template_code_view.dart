import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/artwork/logic/artwork_state.dart';
import 'package:elbdesk_prepress/src/artwork_code/_export_artwork_code.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Widget that displays and allows editing of template code specific fields
class TemplateCodeView extends HookConsumerWidget {
  const TemplateCodeView({
    required this.code,
    required this.readOnly,
    required this.stateNotifier,
    required this.width,
    super.key,
  });

  final ArtworkCode code;
  final bool readOnly;
  final ArtworkState? stateNotifier;
  final double width;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;
    return AppCardTile(
      title: ppL10n.artwork_code_template,
      leadingIcon: const ElbIcon(AppIcons.code_template, size: AppIconSize.l),
      onTitleTap: null,
      onDelete: readOnly
          ? null
          : () {
              stateNotifier?.deleteArtworkCode(code.runtimeId);
            },
      content: _TemplateCodeContent(
        code: code,
        readOnly: readOnly,
        width: width,
        stateNotifier: stateNotifier,
      ),
    );
  }
}

/// Content widget for Template code fields
class _TemplateCodeContent extends StatelessWidget {
  const _TemplateCodeContent({
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
                  initialDouble: code.codeTemplate?.codeSize ?? 0.0,
                  labelPosition: labelPosition,
                  readOnly: readOnly,
                  label: ppL10n.artwork_code_code_size,
                  focusOrder: 1,
                  onChanged: (value) {
                    final parsed = Parser.parseDouble(value);
                    stateNotifier?.updateArtworkCode(
                      code.copyWith(
                        codeTemplate: code.codeTemplate?.copyWith(
                          codeSize: parsed,
                        ),
                      ),
                    );
                  },
                  validationGroup: null,
                  onClear: (v) {
                    stateNotifier?.updateArtworkCode(
                      code.copyWith(
                        codeTemplate: code.codeTemplate?.copyWith(
                          codeSize: 0,
                        ),
                      ),
                    );
                  },
                ),
                // Error Correction
                NextCardFormField.double(
                  initialDouble: code.codeTemplate?.errorCorrection ?? 0.0,
                  labelPosition: labelPosition,
                  readOnly: readOnly,
                  label: ppL10n.artwork_code_error_correction,
                  focusOrder: 2,
                  onChanged: (value) {
                    final parsed = Parser.parseDouble(value);
                    stateNotifier?.updateArtworkCode(
                      code.copyWith(
                        codeTemplate: code.codeTemplate?.copyWith(
                          errorCorrection: parsed,
                        ),
                      ),
                    );
                  },
                  validationGroup: null,
                ),
                // Output Resolution
                NextCardFormField.double(
                  initialDouble: code.codeTemplate?.outputResolution ?? 0.0,
                  labelPosition: labelPosition,
                  readOnly: readOnly,
                  label: ppL10n.artwork_code_output_resolution,
                  focusOrder: 3,
                  onChanged: (value) {
                    final parsed = Parser.parseDouble(value);
                    stateNotifier?.updateArtworkCode(
                      code.copyWith(
                        codeTemplate: code.codeTemplate?.copyWith(
                          outputResolution: parsed,
                        ),
                      ),
                    );
                  },
                  validationGroup: null,
                ),
                // Bar Width Reduction
                NextCardFormField.double(
                  initialDouble: code.codeTemplate?.barWidthReduction ?? 0.0,
                  labelPosition: labelPosition,
                  readOnly: readOnly,
                  label: ppL10n.artwork_code_bar_width_reduction,
                  focusOrder: 4,
                  onChanged: (value) {
                    final parsed = Parser.parseDouble(value);
                    stateNotifier?.updateArtworkCode(
                      code.copyWith(
                        codeTemplate: code.codeTemplate?.copyWith(
                          barWidthReduction: parsed,
                        ),
                      ),
                    );
                  },
                  validationGroup: null,
                ),
                // Device Compensation
                NextCardFormField.double(
                  initialDouble: code.codeTemplate?.deviceCompensation ?? 0.0,
                  labelPosition: labelPosition,
                  readOnly: readOnly,
                  label: ppL10n.artwork_code_device_compensation,
                  focusOrder: 5,
                  onChanged: (value) {
                    final parsed = Parser.parseDouble(value);
                    stateNotifier?.updateArtworkCode(
                      code.copyWith(
                        codeTemplate: code.codeTemplate?.copyWith(
                          deviceCompensation: parsed,
                        ),
                      ),
                    );
                  },
                  validationGroup: null,
                ),
              ],
            ),
            Column(
              children: [
                // Narrow Bar Width
                NextCardFormField.double(
                  initialDouble: code.codeTemplate?.narrowBarWidth ?? 0.0,
                  labelPosition: labelPosition,
                  readOnly: readOnly,
                  label: ppL10n.artwork_code_narrow_bar_width,
                  focusOrder: 6,
                  onChanged: (value) {
                    final parsed = Parser.parseDouble(value);
                    stateNotifier?.updateArtworkCode(
                      code.copyWith(
                        codeTemplate: code.codeTemplate?.copyWith(
                          narrowBarWidth: parsed,
                        ),
                      ),
                    );
                  },
                  validationGroup: null,
                ),
                // Cell Size
                NextCardFormField.double(
                  initialDouble: code.codeTemplate?.cellSize ?? 0.0,
                  labelPosition: labelPosition,
                  readOnly: readOnly,
                  label: ppL10n.artwork_code_cell_size,
                  focusOrder: 7,
                  onChanged: (value) {
                    final parsed = Parser.parseDouble(value);
                    stateNotifier?.updateArtworkCode(
                      code.copyWith(
                        codeTemplate: code.codeTemplate?.copyWith(
                          cellSize: parsed,
                        ),
                      ),
                    );
                  },
                  validationGroup: null,
                ),
                // Magnification
                NextCardFormField.double(
                  initialDouble: code.codeTemplate?.magnification ?? 0.0,
                  labelPosition: labelPosition,
                  readOnly: readOnly,
                  label: ppL10n.artwork_code_magnification,
                  focusOrder: 8,
                  onChanged: (value) {
                    final parsed = Parser.parseDouble(value);
                    stateNotifier?.updateArtworkCode(
                      code.copyWith(
                        codeTemplate: code.codeTemplate?.copyWith(
                          magnification: parsed,
                        ),
                      ),
                    );
                  },
                  validationGroup: null,
                ),
                // Aspect Ratio
                NextCardFormField.double(
                  initialDouble: code.codeTemplate?.aspectRatio ?? 0.0,
                  labelPosition: labelPosition,
                  readOnly: readOnly,
                  label: ppL10n.artwork_code_aspect_ratio,
                  focusOrder: 9,
                  onChanged: (value) {
                    final parsed = Parser.parseDouble(value);
                    stateNotifier?.updateArtworkCode(
                      code.copyWith(
                        codeTemplate: code.codeTemplate?.copyWith(
                          aspectRatio: parsed,
                        ),
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
