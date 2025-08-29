import 'package:flutter/widgets.dart';

/// Callbacks for drag operations
class DragCallbacks {
  const DragCallbacks({
    required this.onDragStarted,
    required this.onDragUpdate,
    required this.onDragEnded,
  });

  final void Function(DragStartDetails) onDragStarted;
  final void Function(DragUpdateDetails) onDragUpdate;
  final VoidCallback onDragEnded;
}

/// Callbacks for resize operations
class ResizeCallbacks {
  const ResizeCallbacks({
    required this.onHorizontalStart,
    required this.onHorizontalUpdate,
    required this.onHorizontalEnd,
    required this.onVerticalStart,
    required this.onVerticalUpdate,
    required this.onVerticalEnd,
  });

  final void Function(DragStartDetails) onHorizontalStart;
  final void Function(DragUpdateDetails) onHorizontalUpdate;
  final VoidCallback onHorizontalEnd;
  final void Function(DragStartDetails) onVerticalStart;
  final void Function(DragUpdateDetails) onVerticalUpdate;
  final VoidCallback onVerticalEnd;
}
