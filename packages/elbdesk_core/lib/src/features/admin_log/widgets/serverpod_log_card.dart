import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/core_component_identifier.dart';
import 'package:elbdesk_core/src/core_floating_window_type.dart';
import 'package:elbdesk_core/src/features/admin_log/fields/serverpod_log_fields.dart';
import 'package:elbdesk_core/src/features/admin_log/repositories/serverpod_log_repository.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

/// Serverpod Log Entry Card
///
/// This widget displays detailed information about a Serverpod log entry
/// in a floating card format.
class ServerpodLogCard extends HookConsumerWidget {
  const ServerpodLogCard({
    required this.floatingWindowId,
    required this.logId,
    required this.floatingWindowFocus,
    required this.floatingWindowType,
    super.key,
  });

  /// The id of the floating window
  final String floatingWindowId;

  /// The id of the log entry to display
  final int logId;

  /// Focus node for the floating window
  final FocusNode floatingWindowFocus;
  final String floatingWindowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return CustomCard(
      floatingWindowType: floatingWindowType,
      baseTitle: l10n.serverpod_log_entry_singular,
      iconData: AppIcons.serverpod_log,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowId: floatingWindowId,
      childBuilder: (context, selectedNavIndexRef, navigatorKey) {
        return FloatingCardBody(
          floatingWindowType: CoreFloatingWindowType.coreServerpodLogCard.name,
          isFirstRun: true,
          navigatorKey: navigatorKey,
          floatingWindowId: floatingWindowId,
          children: [
            CardBodyItem(
              child: _ServerpodLogDetails(
                logId: logId,
                validationGroupId: null,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ServerpodLogDetails extends ConsumerWidget {
  const _ServerpodLogDetails({
    required this.logId,
    required this.validationGroupId,
  });

  final int logId;
  final String? validationGroupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final asyncLog = ref.watch(
      fetchAdminLogByIdProvider(
        id: logId,
      ),
    );

    return asyncLog.fastWhen(
      data: (log) {
        if (log == null) {
          return AppText(
            l10n.validation_entity_not_found(
              l10n.serverpod_log_entry_singular,
            ),
          );
        }
        return ScrollableCardItem.constrained(
          builder: (context, constraints) {
            return Column(
              children: [
                CollapsibleCardSection(
                  title: l10n.serverpod_log_entry_singular,
                  identifier: CoreComponentIdentifier
                      .coreServerpodLogCardServerpodLogDetails.name,
                  child: ElbTwoColumnWrap(
                    customL10n: l10n,
                    width: constraints.maxWidth,
                    readOnly: true,
                    validationGroupId: validationGroupId,
                    columnLeft: [
                      ElbTwoColumnWrapTextItem(
                        field: ServerpodLogFields.fromEnum(
                          ServerpodLogField.time,
                        ),
                        initialText: log.time.toString(),
                        onChanged: null,
                        validator: null,
                      ),
                      ElbTwoColumnWrapTextItem(
                        field: ServerpodLogFields.fromEnum(
                          ServerpodLogField.logLevel,
                        ),
                        initialText: ServerpodLogFields.getLevelReadable(
                          log.level,
                          l10n,
                        ),
                        onChanged: null,
                        validator: null,
                      ),
                      ElbTwoColumnWrapTextItem(
                        field: ServerpodLogFields.fromEnum(
                          ServerpodLogField.serverId,
                        ),
                        initialText: log.serverId ?? '',
                        onChanged: null,
                        validator: null,
                      ),
                      ElbTwoColumnWrapTextItem(
                        field: ServerpodLogFields.fromEnum(
                          ServerpodLogField.sessionLogId,
                        ),
                        initialText: log.sessionLogId?.toString() ?? '',
                        onChanged: null,
                        validator: null,
                      ),
                    ],
                    columnRight: [
                      ElbTwoColumnWrapTextItem(
                        field: ServerpodLogFields.fromEnum(
                          ServerpodLogField.messageId,
                        ),
                        initialText: log.messageId?.toString() ?? '',
                        onChanged: null,
                        validator: null,
                      ),
                      ElbTwoColumnWrapTextItem(
                        field: ServerpodLogFields.fromEnum(
                          ServerpodLogField.reference,
                        ),
                        initialText: log.reference ?? '',
                        onChanged: null,
                        validator: null,
                      ),
                    ],
                  ),
                ),
                const CardSectionDivider(),
                CollapsibleCardSection(
                  title: l10n.serverpod_log_entry_message,
                  identifier: CoreComponentIdentifier
                      .coreServerpodLogCardServerpodLogEntryError.name,
                  child: OneColumnWrap(
                    width: constraints.maxWidth,
                    builder: (labelPosition, childWidth) {
                      return Column(
                        children: [
                          NextCardFormField.text(
                            validationGroup: validationGroupId,
                            labelPosition: labelPosition,
                            maxLines: 10,
                            minLines: 5,
                            readOnly: true,
                            label: l10n.serverpod_log_entry_message,
                            initialText: log.message,
                            onChanged: (v) {},
                          ),
                          if (log.error != null)
                            NextCardFormField.text(
                              validationGroup: validationGroupId,
                              labelPosition: labelPosition,
                              maxLines: 10,
                              minLines: 5,
                              readOnly: true,
                              label: l10n.serverpod_log_entry_error,
                              initialText: log.error ?? '',
                              onChanged: (v) {},
                            ),
                          if (log.stackTrace != null)
                            NextCardFormField.text(
                              validationGroup: validationGroupId,
                              labelPosition: labelPosition,
                              maxLines: 10,
                              minLines: 5,
                              readOnly: true,
                              label: l10n.serverpod_log_entry_stack_trace,
                              initialText: log.stackTrace ?? '',
                              onChanged: (v) {},
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
