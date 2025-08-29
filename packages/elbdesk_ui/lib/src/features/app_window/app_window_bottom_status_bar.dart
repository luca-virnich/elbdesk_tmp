import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A widget that displays a bottom status bar with creation and modification
/// details.
///
/// The [AppWindowBottomStatusBar] widget is used to show information about who
/// created and last edited an item, along with the respective timestamps.
/// It is typically used at the bottom of a window to provide context about the
/// item's history.
///
/// {@tool snippet}
/// This example shows how to create an [AppWindowBottomStatusBar] with
/// creation and modification details:
///
/// ```dart
/// AppWindowBottomStatusBar(
///   createdBy: 'John Doe',
///   createdAt: '2023-10-01',
///   editingBy: 'Jane Smith',
///   lastModifiedAt: '2023-10-05',
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [RichText], which is used to display the text with different styles.
class AppWindowBottomStatusBar extends ConsumerWidget {
  /// Creates an [AppWindowBottomStatusBar].
  ///
  /// The `createdBy`, `createdAt`, `editingBy`, and `lastModifiedAt` parameters
  /// are optional.
  const AppWindowBottomStatusBar({
    required this.meta,
    super.key,
    this.backgroundColor,
    this.isEntityDeleted = false,
    this.padding,
  });

  /// The background color of the widget
  final Color? backgroundColor;
  final DataMeta meta;
  final bool isEntityDeleted;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final elbStyles = context.appTheme.textStyles;
    final l10n = context.l10n;

    final lastModifiedByString = meta.lastModifiedById == null
        ? null
        : meta.lastModifiedById == 1
            ? 'System'
            : ref
                .watch(
                  fetchLocalLightUserByUserInfoIdProvider(
                    meta.lastModifiedById!,
                  ),
                )
                .fullName;
    final deletedByString = meta.deletedById == null
        ? l10n.gen_not_available
        : meta.deletedById == 1
            ? 'System'
            : ref
                .watch(
                  fetchLocalLightUserByUserInfoIdProvider(meta.deletedById!),
                )
                .fullName;

    final createdByString = meta.createdById == null
        ? null
        : meta.createdById == 1
            ? 'System'
            : ref
                .watch(
                  fetchLocalLightUserByUserInfoIdProvider(meta.createdById!),
                )
                .fullName;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Padding(
        padding: padding ??
            const EdgeInsets.symmetric(horizontal: UiConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppRichText(
              maxLines: 1,
              children: [
                TextSpan(
                  style: elbStyles.elbCardBottomStatusBarStyle.copyWith(
                    fontSize: 12,
                    overflow: TextOverflow.visible,
                  ),
                  children: isEntityDeleted
                      ? <TextSpan>[
                          TextSpan(text: '${l10n.gen_deleted}:'),
                          TextSpan(
                            text: ' $deletedByString',
                            style:
                                elbStyles.elbCardBottomStatusBarStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ...[
                            TextSpan(
                              text: ' - ',
                              // minFontSize: 12,
                              style: elbStyles.elbCardBottomStatusBarStyle
                                  .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  meta.deletedAt!.toTimestamp(l10n.localeName),
                              style: elbStyles.elbCardBottomStatusBarStyle
                                  .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ]
                      : <TextSpan>[
                          ..._buildCreatedByTextSpan(
                            createdBy: createdByString,
                            createdAt: meta.createdAt,
                            l10n: l10n,
                            boldStyle:
                                elbStyles.elbCardBottomStatusBarStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                ),
              ],
            ),
            AppRichText(
              maxLines: 1,
              children: [
                TextSpan(
                  style: elbStyles.elbCardBottomStatusBarStyle.copyWith(
                    fontSize: 12,
                    overflow: TextOverflow.visible,
                  ),
                  children: isEntityDeleted
                      ? <TextSpan>[
                          TextSpan(text: '${l10n.gen_deleted}:'),
                          TextSpan(
                            text: ' $deletedByString',
                            style:
                                elbStyles.elbCardBottomStatusBarStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ...[
                            TextSpan(
                              text: ' - ',
                              // minFontSize: 12,
                              style: elbStyles.elbCardBottomStatusBarStyle
                                  .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  meta.deletedAt!.toTimestamp(l10n.localeName),
                              style: elbStyles.elbCardBottomStatusBarStyle
                                  .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ]
                      : <TextSpan>[
                          ..._lastModifiedByTextSpan(
                            lastModifiedBy: lastModifiedByString,
                            lastModifiedAt: meta.lastModifiedAt,
                            l10n: l10n,
                            boldStyle:
                                elbStyles.elbCardBottomStatusBarStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<TextSpan> _buildCreatedByTextSpan({
    required String? createdBy,
    required DateTime? createdAt,
    required ElbCoreLocalizations l10n,
    required TextStyle boldStyle,
  }) {
    if (createdBy == null || createdAt == null) {
      return [];
    }
    return [
      TextSpan(
        text: l10n.window_bottom_status_bar_created,
      ),
      TextSpan(
        text: ' $createdBy',
        style: boldStyle,
      ),
      const TextSpan(
        text: ' - ',
      ),
      TextSpan(
        text: meta.createdAt!.toTimestamp(l10n.localeName),
        style: boldStyle,
      ),
      const TextSpan(
        text: '     ',
      ),
    ];
  }

  List<TextSpan> _lastModifiedByTextSpan({
    required String? lastModifiedBy,
    required DateTime? lastModifiedAt,
    required ElbCoreLocalizations l10n,
    required TextStyle boldStyle,
  }) {
    if (lastModifiedBy == null || lastModifiedAt == null) {
      return [];
    }
    return [
      TextSpan(
        text: l10n.window_bottom_status_bar_edited,
      ),
      TextSpan(
        text: ' $lastModifiedBy',
        style: boldStyle,
      ),
      const TextSpan(
        text: ' - ',
      ),
      TextSpan(
        text: lastModifiedAt.toTimestamp(l10n.localeName),
        style: boldStyle,
      ),
    ];
  }
}
