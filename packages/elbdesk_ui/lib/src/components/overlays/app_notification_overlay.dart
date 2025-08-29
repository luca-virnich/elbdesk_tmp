import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// The types of notifications that can be displayed in the overlay.
enum _AppNotificationOverlayType {
  success,
  error,
  info,
  newEntityNotification,
  updatedEntityNotification,
}

/// A utility class for displaying notification overlays.
///
/// The [AppNotificationOverlay] class provides static methods to display
/// success and error notifications as overlays. The notifications are
/// automatically dismissed after a short duration.
class AppNotificationOverlay {
  const AppNotificationOverlay._();

  /// Displays a success notification overlay with the given [label].
  ///
  /// The [context] is used to find the [Overlay] and insert the notification.
  static void success(
    BuildContext context,
    String label, {
    GlobalKey<NavigatorState>? navigatorKey,
  }) {
    _showNotificationOverlay(
      context,
      label: label,
      type: _AppNotificationOverlayType.success,
      navigatorKey: navigatorKey,
    );
  }

  /// Displays an error notification overlay with the given [label].
  ///
  /// The [context] is used to find the [Overlay] and insert the notification.
  static void error(
    BuildContext context,
    String label, {
    GlobalKey<NavigatorState>? navigatorKey,
  }) {
    _showNotificationOverlay(
      context,
      label: label,
      type: _AppNotificationOverlayType.error,
      navigatorKey: navigatorKey,
    );
  }

  static void info(
    BuildContext context,
    String label, {
    GlobalKey<NavigatorState>? navigatorKey,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showNotificationOverlay(
      context,
      label: label,
      type: _AppNotificationOverlayType.info,
      navigatorKey: navigatorKey,
      duration: duration,
    );
  }

  static void newEntityNotification(
    BuildContext context,
    String label, {
    GlobalKey<NavigatorState>? navigatorKey,
  }) {
    _showNotificationOverlay(
      context,
      label: label,
      type: _AppNotificationOverlayType.newEntityNotification,
      navigatorKey: navigatorKey,
    );
  }

  static void updatedEntityNotification(
    BuildContext context,
    String label, {
    GlobalKey<NavigatorState>? navigatorKey,
  }) {
    _showNotificationOverlay(
      context,
      label: label,
      type: _AppNotificationOverlayType.updatedEntityNotification,
      navigatorKey: navigatorKey,
    );
  }

  /// Displays a notification overlay with the given [label] and [type].
  ///
  /// The [context] is used to find the [Overlay] and insert the notification.
  static void _showNotificationOverlay(
    BuildContext context, {
    required String label,
    required _AppNotificationOverlayType type,
    Duration duration = const Duration(seconds: 3),
    GlobalKey<NavigatorState>? navigatorKey,
  }) {
    final overlay = navigatorKey?.currentState?.overlay ?? Overlay.of(context);
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) {
        return SafeArea(
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: GestureDetector(
                onTap: () {
                  overlayEntry?.remove();
                  overlayEntry = null;
                },
                child: _AnimatedOverlay(
                  type: type,
                  label: label,
                  duration: duration,
                  onComplete: () {
                    overlayEntry?.remove();
                    overlayEntry = null;
                  },
                ),
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(overlayEntry!);
  }
}

/// A widget that displays an animated notification overlay.
///
/// The [_AnimatedOverlay] widget is used internally by the
/// [AppNotificationOverlay] class to display notifications with an animation.
/// The notification slides in from the top and then slides out after a short
/// duration.
class _AnimatedOverlay extends StatefulWidget {
  /// Creates an [_AnimatedOverlay] with the given [type] and [label].
  const _AnimatedOverlay({
    required this.type,
    required this.label,
    required this.duration,
    required this.onComplete,
  });

  /// The type of the notification (success, error, or info).
  final _AppNotificationOverlayType type;

  /// The label to display in the notification.
  final String label;

  final Duration duration;
  final VoidCallback onComplete;

  @override
  State<_AnimatedOverlay> createState() => _AnimatedOverlayState();
}

class _AnimatedOverlayState extends State<_AnimatedOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AnimationConstants.defaultDuration,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: AnimationConstants.easeOut,
    );

    _controller.forward();
    Future.delayed(widget.duration, () {
      if (mounted) {
        _controller.reverse().then((_) {
          widget.onComplete();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final statusColors = context.appTheme.statusColors;
    final borderRadiuses = context.appTheme.borderRadiuses;
    final icon = switch (widget.type) {
      _AppNotificationOverlayType.success => Icon(
          Icons.check_circle_outline,
          color: statusColors.success,
        ),
      _AppNotificationOverlayType.info => Icon(
          Icons.info_outline,
          color: statusColors.info,
        ),
      _AppNotificationOverlayType.error => Icon(
          Icons.error_outline,
          color: statusColors.error,
        ),
      _AppNotificationOverlayType.newEntityNotification => Icon(
          Icons.add_circle_outline,
          color: statusColors.info,
        ),
      _AppNotificationOverlayType.updatedEntityNotification => Icon(
          Icons.edit_note_outlined,
          color: statusColors.warning,
        ),
    };

    return SlideTransition(
      position: _animation.drive(
        Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ),
      ),
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(borderRadiuses.s),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadiuses.s),
            color: context.appTheme.generalColors.primarySurface,
            border: Border.all(
              color: context.appTheme.generalColors.primarySurfaceBorder,
            ),
          ),
          width: screenWidth > 800 ? 300 : double.infinity,
          height: 80,
          child: Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              icon,
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: AppText(
                  widget.label,
                  maxLines: 3,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class _LoadingOverlay extends HookWidget {
//   const _LoadingOverlay({this.child});
//   final Widget? child;

//   @override
//   Widget build(BuildContext context) {
//     final animationController = useAnimationController(
//       duration: const Duration(milliseconds: 500),
//     );

//     // Erstelle eine Animation für die Position
//     final opacityAnimation = Tween<double>(
//       begin: 0, // Beginne vollständig transparent
//       end: 1, // Ende vollständig deckend
//     ).animate(
//       CurvedAnimation(
//         parent: animationController,
//         curve: Curves.easeInOut,
//       ),
//     );

//     useEffect(
//       // ignore: void_checks
//       () {
//         animationController.forward();

//         return animationController.reverse;
//       },
//       const [],
//     );
//     return Positioned(
//       right: 0,
//       top: 0,
//       left: 0,
//       bottom: 0,
//       child: FadeTransition(
//         opacity: opacityAnimation,
//         child: Material(
//           type: MaterialType.transparency,
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.8),
//             ),
//             child: Center(child: child ?? const AppLoadingIndicator()),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class AppLoadingOverlay {
//   static final List<OverlayEntry> _overlayEntries = [];

//   static void show(BuildContext context, [Widget? child]) {
//     final overlay = Overlay.of(context);
//     final overlayEntry = OverlayEntry(
//       builder: (context) => _LoadingOverlay(
//         child: child,
//       ),
//     );

//     _overlayEntries.add(overlayEntry);
//     overlay.insert(overlayEntry);
//   }

//   static void remove() {
//     for (final entry in _overlayEntries) {
//       entry.remove();
//     }
//     _overlayEntries.clear();
//   }
// }

// class AppLoadingBox extends StatelessWidget {
//   const AppLoadingBox({this.label, this.child, super.key});
//   final String? label;
//   final Widget? child;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.black.withOpacity(0.8),
//         borderRadius: BorderRadius.circular(UiConstants.buttonBorderRadius),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(32),
//         child: child ??
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const CupertinoActivityIndicator(
//                   color: Colors.white,
//                 ),
//                 const SizedBox(
//                   width: 16,
//                 ),
//                 Flexible(
//                   child: AppText(
//                     label ?? '',
//                     textAlign: TextAlign.center,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//       ),
//     );
//   }
// }
