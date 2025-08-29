import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_platform_info/elbdesk_platform_info.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EntityNotificationBaseTile extends HookConsumerWidget {
  const EntityNotificationBaseTile({
    required this.onPressed,
    required this.icon,
    required this.subtitle,
    required this.notification,
    super.key,
    this.label,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final String subtitle;
  final String? label;
  final EntityNoteNotification notification;
  static final isMobileDevice = ElbDeskPlatformInfo.isMobileDevice;

  static final mobileBreakpoint =
      WindowManagerInitialization.instance.mobileBreakpoint;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final appUsers = ref.watch(watchAllLightUsersProvider);
    final appTheme = context.appTheme;
    final isUnread = notification.readAt == null;
    final isHovered = useState<bool>(false);

    final defaultTextStyle = appTheme.textStyles.defaultText.copyWith(
      fontWeight: isUnread ? FontWeight.w700 : null,
      fontSize: 15,
    );
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = (screenWidth < mobileBreakpoint) || isMobileDevice;

    return appUsers.fastWhen(
      data: (appUsers) {
        return ElbMouseRegionGestureDetector(
          onEnter: (_) => isHovered.value = true,
          onExit: (_) => isHovered.value = false,
          child: AnimatedContainer(
            duration: AnimationConstants.defaultDuration,
            decoration: BoxDecoration(
              color: isUnread
                  ? appTheme.generalColors.primary.withAppOpacity(0.08)
                  : Colors.transparent,
            ),
            child: Tooltip(
              verticalOffset: 0,
              message: notification.message.length <= 100 ? '' : null,
              textAlign: TextAlign.start,
              constraints: const BoxConstraints(maxWidth: 300),
              richMessage: notification.message.length > 100
                  ? Parser.parseMessageFromDbEntry(
                      notification.message,
                      defaultTextStyle,
                      appUsers,
                      Colors.black,
                      Colors.red,
                    )
                  : null,
              child: ElbTile(
                // tooltip: notification.message,
                contentPadding: EdgeInsets.symmetric(
                  vertical: isMobile ? 8 : AppSpace.l,
                  horizontal: isMobile ? 12 : 14,
                ),
                buttonBorderRadius: 0,
                onPressed: () {
                  ref.read(entityNoteNotificationRepositoryProvider).markAsRead(
                        notification.id,
                      );
                  onPressed();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        if (notification.hardcodedSender == null)
                          LightUserAvatar(
                            size: 36,
                            user: appUsers.firstWhere(
                              (user) =>
                                  user.userInfoId == notification.senderId,
                            ),
                            isActive: false,
                          ),
                        if (notification.hardcodedSender != null)
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: appTheme.generalColors.background,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: appTheme.generalColors.onBackground
                                    .withAppOpacity(0.7),
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: AppText(
                                notification.hardcodedSender!,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        if (isUnread)
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: AppSpace.m,
                              height: AppSpace.m,
                              decoration: BoxDecoration(
                                color: appTheme
                                    .buttonStyles.primary.backgroundColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: appTheme.generalColors.background,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(width: AppSpace.m),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              ElbIcon(
                                icon,
                                size: AppIconSize.m,
                                color: appTheme.generalColors.primary
                                    .withAppOpacity(0.7),
                              ),
                              const SizedBox(width: AppSpace.xs),
                              AppText(
                                label ?? notification.label,
                                fontWeight: isUnread ? FontWeight.w700 : null,
                              ),
                              const SizedBox(width: AppSpace.xs),
                              Flexible(
                                child: AppText(
                                  subtitle,
                                  color: appTheme.generalColors.onBackground
                                      .withAppOpacity(0.7),
                                  fontWeight: isUnread ? FontWeight.w700 : null,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                          AppRichText(
                            children: [
                              Parser.parseMessageFromDbEntry(
                                notification.message,
                                defaultTextStyle,
                                appUsers,
                              ),
                              if (notification.isThread)
                                TextSpan(
                                  text: ' (${l10n.chat_thread})',
                                  style: defaultTextStyle.copyWith(
                                    color: appTheme.generalColors.onBackground
                                        .withAppOpacity(0.7),
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                            ],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          // const AppText('text'),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppSpace.m),
                    _Trailing(
                      createdAt: notification.createdAt,
                      notificationId: notification.id,
                      isRead: notification.readAt != null,
                      isUpdate: notification.isUpdate,
                      isHovered: isHovered.value,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Trailing extends ConsumerWidget {
  const _Trailing({
    required this.createdAt,
    required this.notificationId,
    required this.isRead,
    required this.isUpdate,
    required this.isHovered,
  });

  final DateTime createdAt;
  final int notificationId;
  final bool isRead;
  final bool isUpdate;
  final bool isHovered;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = ref.watch(watchTimeProvider).value;
    if (now == null) return const AppLoadingIndicator();

    final l10n = context.l10n;
    final appTheme = context.appTheme;

    return AnimatedSwitcher(
      duration: AnimationConstants.defaultDuration,
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      layoutBuilder: (currentChild, previousChildren) {
        return Stack(
          alignment: Alignment.centerRight,
          children: <Widget>[
            ...previousChildren,
            if (currentChild != null) currentChild,
          ],
        );
      },
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: !isHovered
          ? Container(
              key: const ValueKey('timestamp'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText(
                    _getDateString(now, createdAt, l10n),
                    fontSize: 14,
                    textAlign: TextAlign.end,
                    color:
                        appTheme.generalColors.onBackground.withAppOpacity(0.6),
                  ),
                  AppText(
                    _getTimeString(now, createdAt, l10n) +
                        (isUpdate ? ' (${l10n.chat_notification_edited})' : ''),
                    fontSize: 14,
                    textAlign: TextAlign.end,
                    color:
                        appTheme.generalColors.onBackground.withAppOpacity(0.6),
                  ),
                ],
              ),
            )
          : Container(
              key: const ValueKey('actions'),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppIconButton.secondary(
                    iconData: isRead
                        ? AppIcons.mark_mail_unread
                        : AppIcons.mark_mail_read,
                    tooltip: isRead
                        ? l10n.chat_mark_as_unread
                        : l10n.chat_mark_as_read,
                    onPressed: () {
                      if (isRead) {
                        ref
                            .read(
                              entityNoteNotificationRepositoryProvider,
                            )
                            .markAsUnRead(
                              notificationId,
                            );
                      } else {
                        ref
                            .read(
                              entityNoteNotificationRepositoryProvider,
                            )
                            .markAsRead(
                              notificationId,
                            );
                      }
                    },
                  ),
                  const SizedBox(width: AppSpace.s),
                  AppButton.primary(
                    onPressed: () {
                      ref
                          .read(
                            entityNoteNotificationRepositoryProvider,
                          )
                          .markAsCleared(
                            notificationId,
                          );
                    },
                    label: l10n.gen_remove,
                  ),
                ],
              ),
            ),
    );
  }
}

String _getDateString(
  DateTime now,
  DateTime dateTime,
  ElbCoreLocalizations l10n,
) {
  final nowDate = DateTime(now.year, now.month, now.day);
  final createdAtDate = DateTime(
    dateTime.year,
    dateTime.month,
    dateTime.day,
  );
  final isSameDay = nowDate.isAtSameMomentAs(createdAtDate);
  final isYesterday =
      nowDate.subtract(const Duration(days: 1)).isAtSameMomentAs(createdAtDate);

  if (isSameDay) {
    return l10n.notification_today;
  }
  if (isYesterday) {
    return l10n.notification_yesterday;
  }
  return dateTime.toDate(l10n.localeName);
}

String _getTimeString(
  DateTime now,
  DateTime dateTime,
  ElbCoreLocalizations l10n,
) {
  final isDifferenceLessThanOneMinute =
      now.difference(dateTime).inMinutes.abs() < 1;
  if (isDifferenceLessThanOneMinute) {
    return l10n.chat_just_now;
  }

  final differenceInMin = now.difference(dateTime).inMinutes.abs();
  if (differenceInMin < 60) {
    return l10n.chat_message_min_ago(differenceInMin);
  }

  return dateTime.toTimeWithoutSeconds(l10n.localeName);
}
