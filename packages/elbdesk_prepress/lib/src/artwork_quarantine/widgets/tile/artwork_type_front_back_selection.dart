import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations_ext.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_type_ext.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// Reusable artwork type selector widget
class ArtworkTypeFrontBackSelection extends StatelessWidget {
  const ArtworkTypeFrontBackSelection({
    required this.value,
    required this.onPressed,
    this.readOnly = false,
    super.key,
  });

  final ArtworkType? value;
  final ValueChanged<ArtworkType> onPressed;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final ppL10n = context.prepressL10n;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpace.s,
        vertical: AppSpace.xs,
      ),
      decoration: BoxDecoration(
        color: theme.generalColors.primarySurface.withAppOpacity(0.08),
        borderRadius: BorderRadius.circular(theme.borderRadiuses.xs),
        border: Border.all(
          color: theme.generalColors.primary.withAppOpacity(0.15),
        ),
      ),
      child: readOnly
          ? AppText(
              '${value?.readable(ppL10n)}',
              style: theme.textStyles.defaultText.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: theme.generalColors.primary,
              ),
            )
          : _ArtworkTypeCheckboxes(
              value: value,
              onPressed: onPressed,
            ),
    );
  }
}

class _ArtworkTypeCheckboxes extends StatelessWidget {
  const _ArtworkTypeCheckboxes({
    required this.value,
    required this.onPressed,
  });

  final ArtworkType? value;
  final ValueChanged<ArtworkType> onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Front checkbox
        ElbMouseRegionGestureDetector(
          onTap: () => onPressed(ArtworkType.front),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 14,
                height: 14,
                child: AppCheckbox(
                  value: value == ArtworkType.front,
                  onChanged: (checkboxValue) {
                    if (checkboxValue == true) {
                      onPressed(ArtworkType.front);
                    }
                  },
                ),
              ),
              const SizedBox(width: AppSpace.s),
              AppText(
                'F'.hc,
                style: theme.textStyles.defaultText.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: theme.generalColors.primary,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: AppSpace.m),

        // Back checkbox
        ElbMouseRegionGestureDetector(
          onTap: () => onPressed(ArtworkType.back),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 14,
                height: 14,
                child: AppCheckbox(
                  value: value == ArtworkType.back,
                  onChanged: (checkboxValue) {
                    if (checkboxValue == true) {
                      onPressed(ArtworkType.back);
                    }
                  },
                ),
              ),
              const SizedBox(width: AppSpace.s),
              AppText(
                'B'.hc,
                style: theme.textStyles.defaultText.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: theme.generalColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
