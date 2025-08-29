import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

@Deprecated('Use ElbPopup instead')
class AppSimpleOverlay extends StatefulWidget {
  @Deprecated('Use ElbPopup instead')
  const AppSimpleOverlay({
    required this.overlayContent,
    required this.child,
    this.overlayAlignment = Alignment.topRight,
    this.childAlignment = Alignment.bottomLeft,
    this.overlayOffset = Offset.zero,
    super.key,
  });
  final Widget Function(
    ListenableOverlayPortalController controller,
  ) overlayContent;
  final Widget Function(
    ListenableOverlayPortalController controller,
  ) child;
  final Alignment overlayAlignment;
  final Alignment childAlignment;
  final Offset overlayOffset;

  @override
  State<AppSimpleOverlay> createState() => _AppSimpleOverlayState();
}

class _AppSimpleOverlayState extends State<AppSimpleOverlay> {
  late ListenableOverlayPortalController overlayPortalController;
  late LayerLink layerLink;

  void _onOverlayPortalControllerChange(bool isShowing) {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    overlayPortalController = ListenableOverlayPortalController();
    overlayPortalController.addListener(_onOverlayPortalControllerChange);
    layerLink = LayerLink();
  }

  @override
  void dispose() {
    super.dispose();
    overlayPortalController.removeAllListeners();
  }

  @override
  Widget build(BuildContext context) {
    final transparent = context.appTheme.generalColors.transparent;

    return OverlayPortal(
      controller: overlayPortalController,
      overlayChildBuilder: (context) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.deferToChild,
                onTap: overlayPortalController.hide,
                child: Container(
                  color: transparent,
                ),
              ),
            ),
            CompositedTransformFollower(
              link: layerLink,
              targetAnchor: widget.childAlignment,
              followerAnchor: widget.overlayAlignment,
              offset: widget.overlayOffset,
              child: widget.overlayContent(overlayPortalController),
            ),
          ],
        );
      },
      child: CompositedTransformTarget(
        link: layerLink,
        child: widget.child(overlayPortalController),
      ),
    );
  }
}

class ListenableOverlayPortalController extends OverlayPortalController {
  ListenableOverlayPortalController();

  final _listeners = <void Function(bool isShowing)>[];
  Offset? currentTapPosition;

  void addListener(void Function(bool isShowing) listener) {
    _listeners.add(listener);
  }

  void removeListener(void Function(bool isShowing) listener) {
    _listeners.remove(listener);
  }

  void removeAllListeners() {
    _listeners.clear();
  }

  void _notifyListeners() {
    // Create a copy to avoid concurrent modification during iteration
    final listenersCopy = List<void Function(bool)>.from(_listeners);
    for (final listener in listenersCopy) {
      listener(super.isShowing);
    }
  }

  @override
  void hide() {
    currentTapPosition = null;
    super.hide();
    _notifyListeners();
  }

  @override
  void show() {
    currentTapPosition = null;
    super.show();
    _notifyListeners();
  }

  /// Shows the overlay at a specific global position.
  void showAt({required Offset globalPosition}) {
    currentTapPosition = globalPosition;
    super.show();
    _notifyListeners();
  }

  @override
  void toggle() {
    if (!super.isShowing) {
      currentTapPosition = null;
    }
    super.toggle();
    _notifyListeners();
  }
}
