part of 'user_settings_dialog.dart';

class _InactiveFloatingOverlayColorArea extends HookConsumerWidget {
  const _InactiveFloatingOverlayColorArea();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final selectedColor = ref.watch(
      userSettingsStateProvider
          .select((state) => state.requireValue.inactiveFloatingOverlayColor),
    );

    final savedColors = ref.watch(
      userSettingsStateProvider.select(
        (state) => state.requireValue.inactiveFloatingOverlaySavedColors,
      ),
    );

    return AppWindowTile(
      isTextField: false,
      title: l10n.user_settings_inactive_floating_overlay_color,
      subTitle: l10n.user_settings_inactive_floating_overlay_color_subtitle,
      content: (width) => Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 100,
                child: AppWrap(
                  children: [
                    // The predefined colors first, not editable
                    ...predefinedInactiveFloatingOverlaySavedColors
                        .map((color) {
                      return _ColorTile(
                        color: color,
                        isSelected: color == selectedColor,
                        width: width,
                        isPredefined: true,
                      );
                    }),
                    // Then the safed colors, editable. but by design only
                    // one color at the moment
                    ...savedColors.map((color) {
                      return _ColorTile(
                        color: color,
                        isSelected: color == selectedColor,
                        width: width,
                        isPredefined: false,
                      );
                    }),
                  ],
                ),
              ),
              _OverlayingAppCardMockUps(selectedColor: selectedColor),
            ],
          ),
          const SizedBox(height: AppSpace.m),
        ],
      ),
    );
  }
}

class _OverlayingAppCardMockUps extends StatelessWidget {
  const _OverlayingAppCardMockUps({
    required this.selectedColor,
  });

  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    final borderRadiuses = context.appTheme.borderRadiuses;
    return Expanded(
      child: Center(
        child: SizedBox(
          width: 150,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // First card with overlay
              Positioned(
                top: 25,
                left: 40,
                child: Stack(
                  children: [
                    const AppCardMockUp.currentTheme(
                      isUnderlaying: true,
                    ),
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(borderRadiuses.m),
                        child: ColoredBox(
                          color: selectedColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Second card without overlay
              const AppCardMockUp.currentTheme(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ColorTile extends HookConsumerWidget {
  const _ColorTile({
    required this.color,
    required this.isSelected,
    required this.width,
    required this.isPredefined,
  });

  final Color color;
  final bool isSelected;
  final double width;
  final bool isPredefined;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;
    final isHovered = useState(false);

    // Function to adjust alpha for display purposes only,
    // to make the color more visible when its alpha is low
    Color getDisplayColor(Color color) {
      final alpha = (color.a * 255).round();
      if (alpha < 50) {
        return color.withAlpha(alpha * 3);
      } else if (alpha < 100) {
        return color.withAlpha(alpha * 2);
      } else if (alpha < 150) {
        return color.withAlpha((alpha * 1.5).round());
      }
      return color;
    }

    final iconForegroundColor = color.computeLuminance() < 0.5
        ? generalColors.computeLuminanceDarkColor
        : generalColors.computeLuminanceLightColor;

    return InkWell(
      onHover: (hovering) => isHovered.value = hovering,
      onTap: () async {
        if (isSelected && !isPredefined) {
          // only show color picker for non-predefined colors when selected
          final pickedColor = await showElbDialog<Color?>(
            navigatorKey: null,
            context: context,
            isDismissible: true,
            child: AppColorPickerDialog(
              initialColor: color,
              width: width,
              enableAlpha: true,
            ),
          );
          if (pickedColor != null) {
            ref
                .read(userSettingsStateProvider.notifier)
                .updateSingleColorInSafedColors(pickedColor, color);
          }
        } else {
          // update selected color for both predefined and non-predefined colors
          ref
              .read(userSettingsStateProvider.notifier)
              .updateInactiveFloatingOverlayColor(color);
        }
      },
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadiuses.m),
          border: (isSelected || isHovered.value)
              ? Border.all(
                  color: generalColors.primarySurfaceBorder,
                )
              : null,
        ),
        // underlying container to make the alpha visible
        child: Center(
          child: Container(
            width: AppSpace.xl,
            height: AppSpace.xl,
            decoration: BoxDecoration(
              color: generalColors.onPrimary,
              shape: BoxShape.circle,
            ),
            // actual color to be picked
            child: Center(
              child: Container(
                width: AppSpace.xl,
                height: AppSpace.xl,
                decoration: BoxDecoration(
                  color: getDisplayColor(color),
                  shape: BoxShape.circle,
                ),
                child: isSelected
                    ? Center(
                        child: ElbIcon(
                          // only show edit icon for non-predefined colors
                          isHovered.value && !isPredefined
                              ? AppIcons.edit
                              : AppIcons.check,
                          size: AppIconSize.m,
                          color: iconForegroundColor,
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
