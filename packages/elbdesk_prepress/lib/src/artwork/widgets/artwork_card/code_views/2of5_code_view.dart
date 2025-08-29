import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/artwork/logic/artwork_state.dart';
import 'package:elbdesk_prepress/src/artwork_code/_export_artwork_code.dart';
import 'package:elbdesk_prepress/src/artwork_code/config/artwork_code_fields.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Widget that displays and allows editing of 2OF5 code specific fields
class TwoOf5CodeView extends HookConsumerWidget {
  const TwoOf5CodeView({
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
      title: ppL10n.artwork_code_2of5,
      leadingIcon: const ElbIcon(AppIcons.code_2of5, size: AppIconSize.l),
      onTitleTap: null,
      onDelete: readOnly
          ? null
          : () {
              stateNotifier?.deleteArtworkCode(code.runtimeId);
            },
      content: _TwoOf5CodeContent(
        code: code,
        readOnly: readOnly,
        width: width,
        stateNotifier: stateNotifier,
      ),
    );
  }
}

/// Content widget for 2OF5 code fields
class _TwoOf5CodeContent extends StatelessWidget {
  const _TwoOf5CodeContent({
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
      child: ElbTwoColumnWrap(
        readOnly: readOnly,
        validationGroupId: null,
        customL10n: ppL10n,
        width: width - AppSpace.l * 2,
        columnLeft: [
          ElbTwoColumnItem.double(
            field:
                ArtworkCodeFields.fromEnum(ArtworkCodeField.barWidthReduction),
            initialValue: code.code2of5?.barWidthReduction,
            readOnly: readOnly,
            onChanged: (value) {
              stateNotifier?.updateArtworkCode(
                code.copyWith(
                  code2of5: code.code2of5?.copyWith(
                    barWidthReduction: value,
                  ),
                ),
              );
            },
          ),
          // Device Compensation
          ElbTwoColumnItem.double(
            field: ArtworkCodeFields.fromEnum(
              ArtworkCodeField.deviceCompensation,
            ),
            initialValue: code.code2of5?.deviceCompensation,
            readOnly: readOnly,
            onChanged: (value) {
              stateNotifier?.updateArtworkCode(
                code.copyWith(
                  code2of5: code.code2of5?.copyWith(
                    deviceCompensation: value,
                  ),
                ),
              );
            },
          ),
        ],
        columnRight: [
          // Narrow Bar Width
          ElbTwoColumnItem.double(
            field: ArtworkCodeFields.fromEnum(
              ArtworkCodeField.narrowBarWidth,
            ),
            initialValue: code.code2of5?.narrowBarWidth,
            readOnly: readOnly,
            onChanged: (value) {
              stateNotifier?.updateArtworkCode(
                code.copyWith(
                  code2of5: code.code2of5?.copyWith(
                    narrowBarWidth: value,
                  ),
                ),
              );
            },
          ),
          // Aspect Ratio
          ElbTwoColumnItem.double(
            field: ArtworkCodeFields.fromEnum(ArtworkCodeField.aspectRatio),
            initialValue: code.code2of5?.aspectRatio,
            readOnly: readOnly,
            onChanged: (value) {
              stateNotifier?.updateArtworkCode(
                code.copyWith(
                  code2of5: code.code2of5?.copyWith(
                    aspectRatio: value,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
