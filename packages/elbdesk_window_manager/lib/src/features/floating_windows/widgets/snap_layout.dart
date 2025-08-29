import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/snap_position.dart';
import 'snap_overlay.dart';
import 'snap_segment.dart';

/// A widget that displays a snap layout with segments
class SnapLayout extends ConsumerWidget {
  const SnapLayout({
    super.key,
    required this.windowId,
    required this.layoutType,
    required this.positions,
    required this.screenSize,
    required this.windowManagementTheme,
    required this.onClose,
  });

  final String windowId;
  final SnapLayoutType layoutType;
  final List<SnapPosition> positions;
  final Size screenSize;
  final dynamic windowManagementTheme;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 110,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(
          color: windowManagementTheme.snapLayoutBorderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(6),
        color: windowManagementTheme.snapLayoutBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: positions.asMap().entries.map((entry) {
                final index = entry.key;
                final position = entry.value;
                return SnapSegment(
                  windowId: windowId,
                  layoutType: layoutType,
                  position: position,
                  index: index,
                  constraints: constraints,
                  windowManagementTheme: windowManagementTheme,
                  screenSize: screenSize,
                  onClose: onClose,
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}