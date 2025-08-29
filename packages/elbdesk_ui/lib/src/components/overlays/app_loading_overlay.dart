import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppLoadingOverlay extends HookWidget {
  const AppLoadingOverlay({
    required this.isLoading,
    required this.child,
    this.showInstant = false,
    super.key,
    this.duration = AnimationConstants.shortDuration,
    this.barrierColor,
  });
  final bool isLoading;

  final Widget child;
  final bool showInstant;
  final Duration duration;
  final Color? barrierColor;

  @override
  Widget build(BuildContext context) {
    final barrierColor =
        this.barrierColor ?? context.appTheme.generalColors.barrierColor;
    final overlayVisible = useState<bool>(false);
    final animationController = useAnimationController(
      duration: showInstant ? Duration.zero : duration,
    );
    final animation =
        Tween<double>(begin: 0, end: 1).animate(animationController);
    useEffect(
      () {
        if (isLoading) {
          overlayVisible.value = true;
          animationController.forward();
        } else {
          animationController.reverse().then((_) {
            overlayVisible.value = false;
          });
        }
        return null;
      },
      [isLoading],
    );
    final widgets = <Widget>[child];

    if (overlayVisible.value) {
      final modal = FadeTransition(
        opacity: animation,
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: 1,
              child: ModalBarrier(
                dismissible: false,
                color: barrierColor,
              ),
            ),
            const Center(
              child: AppLoadingIndicator(),
            ),
          ],
        ),
      );
      widgets.add(modal);
    }

    return Stack(children: widgets);
  }
}

class SmallAppLoadingOverlay extends HookWidget {
  const SmallAppLoadingOverlay({
    required this.isLoading,
    required this.child,
    this.showInstant = true,
    super.key,
    this.duration = AnimationConstants.shortDuration,
    this.barrierColor,
  });
  final bool isLoading;

  final Widget child;
  final bool showInstant;
  final Duration duration;
  final Color? barrierColor;

  @override
  Widget build(BuildContext context) {
    final barrierColor =
        this.barrierColor ?? context.appTheme.generalColors.barrierColor;
    final overlayVisible = useState<bool>(false);
    final animationController = useAnimationController(
      duration: showInstant ? Duration.zero : duration,
    );
    final animation =
        Tween<double>(begin: 0, end: 1).animate(animationController);
    useEffect(
      () {
        if (isLoading) {
          overlayVisible.value = true;
          animationController.forward();
        } else {
          animationController.reverse().then((_) {
            if (context.mounted) {
              overlayVisible.value = false;
            }
          });
        }
        return null;
      },
      [isLoading],
    );
    final widgets = <Widget>[child];

    if (overlayVisible.value) {
      final modal = FadeTransition(
        opacity: animation,
        child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            color: barrierColor,
            borderRadius: BorderRadius.circular(
              context.appTheme.borderRadiuses.s,
            ),
          ),
          child: const Center(
            child: AppLoadingIndicator(),
          ),
        ),
      );
      widgets.add(modal);
    }

    return Stack(
      alignment: Alignment.center,
      children: widgets,
    );
  }
}
