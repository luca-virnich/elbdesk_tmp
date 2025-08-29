import 'package:flutter/widgets.dart';

// currently the IconButton uses the ButtonStyles to set the theming,
// would be better to have a separate theming for the IconButton here

class AppIconButtonProperties {
  const AppIconButtonProperties({
    required this.foregroundColorActive,
    required this.foregroundColorInactive,
  });

  final Color foregroundColorActive;
  final Color foregroundColorInactive;
}
