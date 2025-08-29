import 'dart:async';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum HoverProgress { none, initial, halfway, completed }

/// Defines the types of icon buttons available.
///
/// The [_AppIconButtonType] enum is used internally to specify the type of
/// the icon button, which determines its appearance and behavior.
enum _AppIconButtonType { primary, secondary, danger, blank }

/// A customizable icon button widget with various styles.
///
/// The [AppIconButton] widget is a stateless widget that displays an icon
/// button with different styles such as primary, secondary, danger, and blank.
/// It uses the [HookWidget] from the flutter_hooks package to manage the focus
/// node.
///
/// {@tool snippet}
/// This example shows how to use [AppIconButton] in a Flutter application:
///
/// ```dart
/// AppIconButton.primary(
///   onPressed: () {
///     print('Primary icon button pressed');
///   },
///   iconData: Icons.add,
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [IconButton], which is the underlying button widget used.
///  * [VoidCallback], which is the type of the callback function.
class AppIconButton extends HookWidget {
  /// Creates an [AppIconButton] with the blank style.
  ///
  /// The [onPressed] parameter must not be null.
  const AppIconButton({
    this.turns,
    super.key,
    this.tooltip,
    this.useFixedSize = true,
    this.onLongPressed,
    this.iconData,
    this.icon,
    this.onPressed,
    this.skipTraversal = false,
    this.iconSize = 20,
    this.visualDensity = VisualDensity.compact,
    this.color,
    this.overlayColor,
    this.colorOnHover,
    this.fixedSize,
    this.disabledColor,
    this.onHoverEnded,
    this.onSecondaryTap,
  }) : _type = _AppIconButtonType.blank;

  /// Creates an [AppIconButton] with a specific type.
  ///
  /// This constructor is used internally to create buttons with different
  /// styles.
  const AppIconButton._({
    required _AppIconButtonType type,
    super.key,
    this.tooltip,
    this.iconData,
    this.icon,
    this.onPressed,
    this.skipTraversal = false,
    this.iconSize = 20,
    this.color,
    this.overlayColor,
    this.turns,
    this.visualDensity,
    this.fixedSize,
    this.colorOnHover,
    this.disabledColor,
    this.onLongPressed,
    this.onHoverEnded,
    this.onSecondaryTap,
    this.useFixedSize = true,
  }) : _type = type;

  /// Creates a primary style [AppIconButton].
  const AppIconButton.primary({
    required VoidCallback? onPressed,
    Key? key,
    String? tooltip,
    IconData? iconData,
    double iconSize = 20,
    Icon? icon,
    bool skipTraversal = false,
    VisualDensity? visualDensity = VisualDensity.compact,
    Color? color,
    Color? overlayColor,
    Color? colorOnHover,
    Size? fixedSize,
    VoidCallback? onHoverEnded,
    VoidCallback? onSecondaryTap,
    bool useFixedSize = true,
  }) : this._(
          key: key,
          type: _AppIconButtonType.primary,
          onPressed: onPressed,
          iconSize: iconSize,
          icon: icon,
          iconData: iconData,
          tooltip: tooltip,
          visualDensity: visualDensity,
          skipTraversal: skipTraversal,
          color: color,
          overlayColor: overlayColor,
          colorOnHover: colorOnHover,
          fixedSize: fixedSize,
          onHoverEnded: onHoverEnded,
          onSecondaryTap: onSecondaryTap,
          useFixedSize: useFixedSize,
        );

  /// Creates a secondary style [AppIconButton].
  const AppIconButton.secondary({
    required VoidCallback? onPressed,
    VoidCallback? onLongPressed,
    Key? key,
    String? tooltip,
    IconData? iconData,
    double iconSize = 20,
    bool useFixedSize = true,
    Icon? icon,
    bool skipTraversal = false,
    VisualDensity? visualDensity = VisualDensity.compact,
    Color? color,
    Color? overlayColor,
    Color? colorOnHover,
    Size? fixedSize,
    VoidCallback? onHoverEnded,
    VoidCallback? onSecondaryTap,
  }) : this._(
          key: key,
          type: _AppIconButtonType.secondary,
          onPressed: onPressed,
          onLongPressed: onLongPressed,
          iconSize: iconSize,
          icon: icon,
          iconData: iconData,
          tooltip: tooltip,
          skipTraversal: skipTraversal,
          visualDensity: visualDensity,
          color: color,
          useFixedSize: useFixedSize,
          overlayColor: overlayColor,
          colorOnHover: colorOnHover,
          fixedSize: fixedSize,
          onHoverEnded: onHoverEnded,
          onSecondaryTap: onSecondaryTap,
        );

  const AppIconButton.rotating({
    required VoidCallback? onPressed,
    required double turns,
    Key? key,
    String? tooltip,
    IconData? iconData,
    double iconSize = 20,
    Icon? icon,
    bool skipTraversal = false,
    VisualDensity? visualDensity = VisualDensity.compact,
    Color? color,
    Color? overlayColor,
    Color? colorOnHover,
    Size? fixedSize,
    VoidCallback? onHoverEnded,
    VoidCallback? onSecondaryTap,
    bool useFixedSize = true,
  }) : this._(
          key: key,
          type: _AppIconButtonType.secondary,
          onPressed: onPressed,
          iconSize: iconSize,
          icon: icon,
          iconData: iconData,
          turns: turns,
          tooltip: tooltip,
          skipTraversal: skipTraversal,
          visualDensity: visualDensity,
          color: color,
          overlayColor: overlayColor,
          colorOnHover: colorOnHover,
          fixedSize: fixedSize,
          onHoverEnded: onHoverEnded,
          onSecondaryTap: onSecondaryTap,
          useFixedSize: useFixedSize,
        );

  /// Creates a blank style [AppIconButton].
  const AppIconButton.blank({
    required VoidCallback? onPressed,
    Key? key,
    String? tooltip,
    bool useFixedSize = true,
    IconData? iconData,
    double iconSize = 20,
    Icon? icon,
    bool skipTraversal = false,
    VisualDensity? visualDensity = VisualDensity.compact,
    Color? color,
    Color? overlayColor,
    Color? colorOnHover,
    Size? fixedSize,
    VoidCallback? onHoverEnded,
    VoidCallback? onSecondaryTap,
  }) : this._(
          key: key,
          type: _AppIconButtonType.blank,
          onPressed: onPressed,
          iconSize: iconSize,
          icon: icon,
          iconData: iconData,
          tooltip: tooltip,
          skipTraversal: skipTraversal,
          useFixedSize: useFixedSize,
          visualDensity: visualDensity,
          color: color,
          overlayColor: overlayColor,
          colorOnHover: colorOnHover,
          fixedSize: fixedSize,
          onHoverEnded: onHoverEnded,
          onSecondaryTap: onSecondaryTap,
        );

  /// Creates a danger style [AppIconButton].
  const AppIconButton.danger({
    required VoidCallback? onPressed,
    Key? key,
    String? tooltip,
    IconData? iconData,
    double iconSize = 20,
    Icon? icon,
    bool skipTraversal = false,
    Color? color,
    Color? overlayColor,
    Color? colorOnHover,
    VisualDensity? visualDensity = VisualDensity.compact,
    Size? fixedSize,
    VoidCallback? onHoverEnded,
    VoidCallback? onSecondaryTap,
    bool useFixedSize = true,
  }) : this._(
          key: key,
          type: _AppIconButtonType.danger,
          onPressed: onPressed,
          iconSize: iconSize,
          icon: icon,
          iconData: iconData,
          tooltip: tooltip,
          skipTraversal: skipTraversal,
          visualDensity: visualDensity,
          color: color,
          overlayColor: overlayColor,
          colorOnHover: colorOnHover,
          fixedSize: fixedSize,
          useFixedSize: useFixedSize,
          onHoverEnded: onHoverEnded,
          onSecondaryTap: onSecondaryTap,
        );

  /// The type of the icon button.
  final _AppIconButtonType _type;

  /// The tooltip text to display when the button is long-pressed.
  final String? tooltip;

  /// The icon data to display inside the button.
  final IconData? iconData;

  /// The size of the icon inside the button.
  final double iconSize;

  /// The icon widget to display inside the button.
  final Icon? icon;

  /// The callback function that is called when the button is pressed.
  final VoidCallback? onPressed;

  /// Whether to skip traversal for the focus node.
  final bool skipTraversal;

  /// The color of the icon inside the button.
  final Color? color;

  /// The color of the icon inside the button when it is hovered.
  final Color? colorOnHover;

  /// The overlay color of the button.
  final Color? overlayColor;

  final double? turns;

  final VisualDensity? visualDensity;

  /// The fixed size of the button.
  final Size? fixedSize;

  final Color? disabledColor;

  final VoidCallback? onLongPressed;

  final VoidCallback? onHoverEnded;

  final VoidCallback? onSecondaryTap;

  final bool useFixedSize;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode(skipTraversal: skipTraversal);

    return onHoverEnded != null
        ? _AppIconButtonWithHover(
            type: _type,
            onHover: onHoverEnded!,
            focusNode: focusNode,
            onPressed: onPressed,
            onLongPressed: onLongPressed,
            visualDensity: visualDensity,
            overlayColor: overlayColor,
            skipTraversal: skipTraversal,
            fixedSize: fixedSize,
            disabledColor: disabledColor,
            tooltip: tooltip,
            iconData: iconData,
            icon: icon,
            iconSize: iconSize,
            turns: turns,
            color: color,
            colorOnHover: colorOnHover,
            onSecondaryTap: onSecondaryTap,
            useFixedSize: useFixedSize,
          )
        : _AppIconButtonWithoutHover(
            type: _type,
            onPressed: onPressed,
            onLongPressed: onLongPressed,
            visualDensity: visualDensity,
            tooltip: tooltip,
            focusNode: focusNode,
            iconData: iconData,
            icon: icon,
            iconSize: iconSize,
            turns: turns,
            color: color,
            colorOnHover: colorOnHover,
            overlayColor: overlayColor,
            skipTraversal: skipTraversal,
            fixedSize: fixedSize,
            disabledColor: disabledColor,
            useFixedSize: useFixedSize,
          );
  }
}

class _AppIconButtonWithHover extends HookWidget {
  const _AppIconButtonWithHover({
    required this.type,
    required this.onHover,
    required this.focusNode,
    this.onPressed,
    this.onLongPressed,
    this.visualDensity,
    this.overlayColor,
    this.skipTraversal = false,
    this.fixedSize,
    this.disabledColor,
    this.colorOnHover,
    this.color,
    this.iconSize = 20,
    this.iconData,
    this.icon,
    this.turns,
    this.tooltip,
    this.onSecondaryTap,
    this.useFixedSize = true,
  });

  /// The type of the icon button.
  final _AppIconButtonType type;

  /// The tooltip text to display when the button is long-pressed.
  final String? tooltip;

  /// The icon data to display inside the button.
  final IconData? iconData;

  /// The size of the icon inside the button.
  final double iconSize;

  /// The icon widget to display inside the button.
  final Icon? icon;

  /// The callback function that is called when the button is pressed.
  final VoidCallback? onPressed;

  /// Whether to skip traversal for the focus node.
  final bool skipTraversal;

  /// The color of the icon inside the button.
  final Color? color;

  /// The color of the icon inside the button when it is hovered.
  final Color? colorOnHover;

  /// The overlay color of the button.
  final Color? overlayColor;

  final double? turns;

  final VisualDensity? visualDensity;

  /// The fixed size of the button.
  final Size? fixedSize;

  final Color? disabledColor;

  final VoidCallback? onLongPressed;

  final VoidCallback onHover;

  final VoidCallback? onSecondaryTap;

  final FocusNode focusNode;
  final bool useFixedSize;

  @override
  Widget build(BuildContext context) {
    final buttonStyles = context.appTheme.buttonStyles;

    final buttonStyleProperties = switch (type) {
      _AppIconButtonType.primary => buttonStyles.primary,
      _AppIconButtonType.secondary => buttonStyles.secondary,
      _AppIconButtonType.danger => buttonStyles.danger,
      _AppIconButtonType.blank => buttonStyles.blank,
    };

    final hoverProgress = useState<HoverProgress>(HoverProgress.none);
    final isHovering = useState<bool>(false);
    final hoverStartTime = useRef<DateTime?>(null);

    const waitDuration = Duration(milliseconds: 200);
    const animationDuration = Duration(milliseconds: 800);

    void useInterval(
      VoidCallback callback,
      Duration delay, {
      bool active = true,
    }) {
      final savedCallback = useRef(callback)..value = callback;

      useEffect(
        () {
          if (!active) return null;

          final timer = Timer.periodic(delay, (_) => savedCallback.value());
          return timer.cancel;
        },
        [delay, active],
      );
    }

    // check hover progress
    useInterval(
      () {
        if (!isHovering.value || hoverStartTime.value == null) return;

        final elapsedTime = DateTime.now().difference(hoverStartTime.value!);

        if (elapsedTime >= (waitDuration + animationDuration) &&
            hoverProgress.value == HoverProgress.halfway) {
          onHover.call();
          hoverProgress.value = HoverProgress.completed;
        } else if (elapsedTime >= waitDuration &&
            hoverProgress.value == HoverProgress.initial) {
          hoverProgress.value = HoverProgress.halfway;
        }
      },
      const Duration(milliseconds: 50),
      active: isHovering.value,
    );

    // function to reset hover state
    void resetHoverState({required VoidCallback? methodToExecute}) {
      isHovering.value = false;
      hoverStartTime.value = null;
      hoverProgress.value = HoverProgress.none;
      if (methodToExecute != null) {
        methodToExecute();
      }
    }

    return AppTooltip(
      message: tooltip ?? '',
      waitDuration: AnimationConstants.shortDuration,
      preferBelow: false,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (hoverProgress.value == HoverProgress.halfway)
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: 1),
              duration: animationDuration,
              curve: AnimationConstants.easeOut,
              builder: (context, value, child) {
                // Calculate the button size
                final buttonSize = fixedSize ??
                    const Size(
                      UiConstants.buttonHeight - 4,
                      UiConstants.buttonHeight - 4,
                    );

                return Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  width: buttonSize.width * value,
                  child: Container(
                    decoration: BoxDecoration(
                      color: buttonStyleProperties.overlayColor
                          .withAppOpacity(0.5),
                      borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(buttonStyleProperties.borderRadius),
                        bottomLeft:
                            Radius.circular(buttonStyleProperties.borderRadius),
                        topRight: value == 1.0
                            ? Radius.circular(
                                buttonStyleProperties.borderRadius,
                              )
                            : Radius.zero,
                        bottomRight: value == 1.0
                            ? Radius.circular(
                                buttonStyleProperties.borderRadius,
                              )
                            : Radius.zero,
                      ),
                    ),
                  ),
                );
              },
            ),
          GestureDetector(
            onTapDown: (_) => resetHoverState(methodToExecute: null),
            onSecondaryTapDown: (_) => resetHoverState(methodToExecute: null),
            onSecondaryTapUp: onSecondaryTap != null
                ? (_) => resetHoverState(methodToExecute: onSecondaryTap)
                : null,
            child: _AppRawIconButton(
              focusNode: focusNode,
              type: type,
              onPressed: onPressed != null
                  ? () => resetHoverState(methodToExecute: onPressed)
                  : null,
              onLongPressed: onLongPressed != null
                  ? () => resetHoverState(methodToExecute: onLongPressed)
                  : null,
              onHover: (hovering) {
                if (hovering && !isHovering.value) {
                  // Start hover tracking
                  isHovering.value = true;
                  hoverStartTime.value = DateTime.now();
                  hoverProgress.value = HoverProgress.initial;
                } else if (!hovering && isHovering.value) {
                  // End hover tracking
                  isHovering.value = false;
                  hoverStartTime.value = null;
                  hoverProgress.value = HoverProgress.none;
                }
              },
              visualDensity: visualDensity,
              overlayColor: overlayColor,
              skipTraversal: skipTraversal,
              fixedSize: fixedSize,
              disabledColor: disabledColor,
              colorOnHover: colorOnHover,
              color: color,
              iconSize: iconSize,
              iconData: iconData,
              icon: icon,
              turns: turns,
            ),
          ),
        ],
      ),
    );
  }
}

class _AppIconButtonWithoutHover extends StatelessWidget {
  const _AppIconButtonWithoutHover({
    required this.type,
    required this.tooltip,
    required this.iconData,
    required this.icon,
    required this.iconSize,
    required this.turns,
    required this.onPressed,
    required this.onLongPressed,
    required this.visualDensity,
    required this.focusNode,
    this.overlayColor,
    this.skipTraversal = false,
    this.fixedSize,
    this.disabledColor,
    this.colorOnHover,
    this.color,
    this.useFixedSize = true,
  });

  final _AppIconButtonType type;
  final String? tooltip;
  final IconData? iconData;
  final Icon? icon;
  final double iconSize;
  final double? turns;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final VisualDensity? visualDensity;
  final Color? overlayColor;
  final bool skipTraversal;
  final Size? fixedSize;
  final Color? disabledColor;
  final Color? colorOnHover;
  final Color? color;
  final FocusNode focusNode;
  final bool useFixedSize;
  @override
  Widget build(BuildContext context) {
    return AppTooltip(
      message: tooltip,
      waitDuration: AnimationConstants.shortDuration,
      preferBelow: false,
      child: _AppRawIconButton(
        useFixedSize: useFixedSize,
        type: type,
        onPressed: onPressed,
        onLongPressed: onLongPressed,
        visualDensity: visualDensity,
        iconData: iconData,
        icon: icon,
        iconSize: iconSize,
        turns: turns,
        overlayColor: overlayColor,
        skipTraversal: skipTraversal,
        fixedSize: fixedSize,
        disabledColor: disabledColor,
        colorOnHover: colorOnHover,
        color: color,
        focusNode: focusNode,
      ),
    );
  }
}

class _AppRawIconButton extends StatelessWidget {
  const _AppRawIconButton({
    required this.type,
    required this.focusNode,
    this.onPressed,
    this.onLongPressed,
    this.onHover,
    this.visualDensity,
    this.overlayColor,
    this.skipTraversal = false,
    this.fixedSize,
    this.disabledColor,
    this.colorOnHover,
    this.color,
    this.iconSize = 20,
    this.iconData,
    this.icon,
    this.turns,
    this.useFixedSize = true,
  });

  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final void Function(bool)? onHover;
  final VisualDensity? visualDensity;
  final bool skipTraversal;
  final Color? overlayColor;
  final _AppIconButtonType type;
  final Size? fixedSize;
  final Color? disabledColor;
  final Color? colorOnHover;
  final Color? color;
  final double iconSize;
  final IconData? iconData;
  final Icon? icon;
  final double? turns;
  final FocusNode? focusNode;
  final bool useFixedSize;
  @override
  Widget build(BuildContext context) {
    final buttonStyles = context.appTheme.buttonStyles;

    final buttonStyleProperties = switch (type) {
      _AppIconButtonType.primary => buttonStyles.primary,
      _AppIconButtonType.secondary => buttonStyles.secondary,
      _AppIconButtonType.danger => buttonStyles.danger,
      _AppIconButtonType.blank => buttonStyles.blank,
    };
    return IconButton(
      onLongPress: onLongPressed,
      onHover: onHover,
      visualDensity: visualDensity,
      focusNode: focusNode,
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.zero,
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.focused)) {
              return buttonStyleProperties.overlayColor;
            }
            return context.appTheme.generalColors.transparent;
          },
        ),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              buttonStyleProperties.borderRadius,
            ),
          ),
        ),
        // remove padding
        minimumSize: WidgetStateProperty.all<Size>(
          Size.zero,
        ),
        fixedSize: useFixedSize
            ? WidgetStateProperty.all<Size>(
                fixedSize ??
                    const Size(
                      UiConstants.buttonHeight - 4,
                      UiConstants.buttonHeight - 4,
                    ),
              )
            : WidgetStateProperty.all<Size?>(null),
        foregroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return disabledColor ??
                  buttonStyleProperties.foregroundColorDisabled;
            }
            if (states.contains(WidgetState.hovered)) {
              return colorOnHover ??
                  buttonStyleProperties.foregroundColorOnHover;
            }
            if (states.contains(WidgetState.focused)) {
              return colorOnHover ??
                  buttonStyleProperties.foregroundColorOnHover;
            }

            return color ?? buttonStyleProperties.foregroundColor;
          },
        ),
        overlayColor: WidgetStateProperty.all(
          overlayColor ?? buttonStyleProperties.overlayColor,
        ),
        // overlayColor: MaterialStateProperty.all<Color>(
        //   overlayColor ?? elbColors.transparentButtonOverlay,
        // ),
      ),
      iconSize: iconSize,
      icon: turns != null
          ? AnimatedRotation(
              turns: turns!,
              duration: AnimationConstants.defaultDuration,
              curve: AnimationConstants.defaultCurve,
              child: icon ??
                  (iconData != null ? Icon(iconData) : const SizedBox.shrink()),
            )
          : icon ??
              (iconData != null ? Icon(iconData) : const SizedBox.shrink()),
    );
  }
}
