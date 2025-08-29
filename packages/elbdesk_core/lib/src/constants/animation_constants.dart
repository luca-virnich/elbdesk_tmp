import 'package:flutter/widgets.dart';

class AnimationConstants {
  static const Duration veryLongDuration = Duration(milliseconds: 1000);
  static const Duration longDuration = Duration(milliseconds: 500);
  static const Duration defaultDuration = Duration(milliseconds: 250);
  static const Duration shortDuration = Duration(milliseconds: 150);
  static const Duration staggeredDelay = Duration(milliseconds: 50);
  static const Curve defaultCurve = Curves.easeInOut;
  static const Curve easeIn = Curves.easeIn;
  static const Curve easeOut = Curves.easeOut;
  static const Curve linear = Curves.linear;
}
