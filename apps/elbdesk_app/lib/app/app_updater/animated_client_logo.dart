import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedClientLogo extends HookWidget {
  const AnimatedClientLogo({
    required this.hasError,
    super.key,
  });

  final bool hasError;
  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    final scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1, end: 1.2),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.2, end: 1),
        weight: 1,
      ),
    ]).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    useEffect(
      () {
        animationController.repeat();
        return null;
      },
      [],
    );

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: hasError ? 1 : scaleAnimation.value,
          child: Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.asset(
                switch (appRunMode) {
                  RunMode.dev => 'assets/img/app_icon_development_512.png',
                  RunMode.test => 'assets/img/app_icon_test_512.png',
                  RunMode.staging => 'assets/img/app_icon_staging_512.png',
                  RunMode.prod => 'assets/img/app_icon_production_512.png',
                },
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
