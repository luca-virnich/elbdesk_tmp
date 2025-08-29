import 'package:flutter/material.dart';

/// A table preview widget that uses a mockup style for consistent appearance
class AppTableMockUpPreview extends StatelessWidget {
  const AppTableMockUpPreview({
    super.key,
    required this.title,
    this.icon,
  });

  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    // Use default material colors since we don't have access to WindowManagerTheme here
    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.blue);
    
    return Center(
      child: Container(
        width: 240,
        height: 140,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: Row(
                  children: [
                    if (icon != null) ...[
                      Icon(
                        icon,
                        size: 14,
                        color: colorScheme.onSurface,
                      ),
                      const SizedBox(width: 6),
                    ],
                    if (title.isNotEmpty)
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Table mockup
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    // Search bar and controls mockup
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 6,
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 10,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: colorScheme.surfaceContainerHighest,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Table rows
                    Expanded(
                      child: Column(
                        children: [
                          _buildTableRow(colorScheme, [3, 1, 2, 1]),
                          _buildTableRow(colorScheme, [2, 2, 1, 2]),
                          _buildTableRow(colorScheme, [1, 3, 2, 1]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableRow(ColorScheme colorScheme, List<int> flexValues) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colorScheme.surfaceContainerHighest,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Row header
          Container(
            width: 20,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: colorScheme.surfaceContainerHighest,
                  width: 1,
                ),
              ),
            ),
            child: Center(
              child: Container(
                width: 12,
                height: 4,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
          // Data columns
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Row(
                      children: [
                        Flexible(
                          flex: flexValues[0],
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: flexValues[1],
                          child: const SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: double.infinity,
                  color: colorScheme.surfaceContainerHighest,
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Flexible(
                          flex: flexValues[2],
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: flexValues[3],
                          child: const SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}