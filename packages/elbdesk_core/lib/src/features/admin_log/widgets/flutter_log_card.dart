import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/core_component_identifier.dart';
import 'package:elbdesk_core/src/core_floating_window_type.dart';
import 'package:elbdesk_core/src/features/admin_log/fields/flutter_log_fields.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

/// Flutter Log Card
///
/// This widget displays detailed information about a Flutter log entry
/// in a floating card format.
class FlutterLogCard extends HookConsumerWidget {
  const FlutterLogCard({
    required this.floatingWindowId,
    required this.logId,
    required this.floatingWindowFocus,
    required this.floatingWindowType,
    super.key,
  });

  /// The id of the floating window
  final String floatingWindowId;
  final String floatingWindowType;

  /// The id of the log entry to display
  final int logId;

  /// Focus node for the floating window
  final FocusNode floatingWindowFocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final validationGroupId = useUuid();

    return CustomCard(
      floatingWindowType: floatingWindowType,
      baseTitle: l10n.flutter_log_entry_singular,
      iconData: AppIcons.flutter_log,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowId: floatingWindowId,
      childBuilder: (context, selectedNavIndexRef, navigatorKey) {
        return FloatingCardBody(
          floatingWindowType: CoreFloatingWindowType.coreFlutterLogCard.name,
          isFirstRun: true,
          navigatorKey: navigatorKey,
          floatingWindowId: floatingWindowId,
          children: [
            CardBodyItem(
              child: _FlutterLogDetails(
                logId: logId,
                validationGroupId: validationGroupId,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _FlutterLogDetails extends ConsumerWidget {
  const _FlutterLogDetails({
    required this.logId,
    required this.validationGroupId,
  });

  final int logId;
  final String validationGroupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final asyncLog = ref.watch(
      fetchFlutterLogByIdProvider(
        id: logId,
      ),
    );

    return asyncLog.fastWhen(
      data: (log) {
        if (log == null) {
          return AppText(
            l10n.validation_entity_not_found(
              l10n.flutter_log_entry_singular,
            ),
          );
        }
        return ScrollableCardItem.constrained(
          builder: (context, constraints) {
            return Column(
              children: [
                CollapsibleCardSection(
                  title: l10n.flutter_log_entry_singular,
                  identifier: CoreComponentIdentifier
                      .coreFlutterLogCardFlutterLogDetails.name,
                  child: ElbTwoColumnWrap(
                    customL10n: l10n,
                    width: constraints.maxWidth,
                    readOnly: true,
                    validationGroupId: validationGroupId,
                    columnLeft: [
                      ElbTwoColumnWrapTextItem(
                        field: FlutterLogFields.fromEnum(
                          FlutterLogField.time,
                        ),
                        initialText: log.time.toString(),
                        onChanged: null,
                        validator: null,
                      ),
                      ElbTwoColumnWrapTextItem(
                        field: FlutterLogFields.fromEnum(
                          FlutterLogField.flutterLibrary,
                        ),
                        initialText: log.flutterLibrary ?? '',
                        onChanged: null,
                        validator: null,
                      ),
                      ElbTwoColumnWrapTextItem(
                        field: FlutterLogFields.fromEnum(
                          FlutterLogField.information,
                        ),
                        initialText: log.information ?? '',
                        onChanged: null,
                        validator: null,
                      ),
                      ElbTwoColumnWrapTextItem(
                        field: FlutterLogFields.fromEnum(
                          FlutterLogField.deviceId,
                        ),
                        initialText: log.deviceId ?? '',
                        onChanged: null,
                        validator: null,
                      ),
                      ElbTwoColumnWrapTextItem(
                        field: FlutterLogFields.fromEnum(
                          FlutterLogField.userId,
                        ),
                        initialText: log.userId.toString(),
                        onChanged: null,
                        validator: null,
                      ),
                    ],
                    columnRight: [
                      ElbTwoColumnWrapTextItem(
                        field: FlutterLogFields.fromEnum(
                          FlutterLogField.platform,
                        ),
                        initialText: log.platform ?? '',
                        onChanged: null,
                        validator: null,
                      ),
                      ElbTwoColumnWrapTextItem(
                        field: FlutterLogFields.fromEnum(
                          FlutterLogField.appVersion,
                        ),
                        initialText: log.appVersion ?? '',
                        onChanged: null,
                        validator: null,
                      ),
                      ElbTwoColumnWrapTextItem(
                        field: FlutterLogFields.fromEnum(
                          FlutterLogField.buildNumber,
                        ),
                        initialText: log.buildNumber ?? '',
                        onChanged: null,
                        validator: null,
                      ),
                      ElbTwoColumnWrapCustomItem<ElbCoreLocalizations>(
                        label: l10n.flutter_log_entry_silent,
                        childBuilder: (labelPosition) => AppCardCheckbox(
                          readOnly: true,
                          label: l10n.flutter_log_entry_silent,
                          value: log.silent ?? false,
                          onChanged: (v) {},
                        ),
                      ),
                    ],
                  ),
                ),
                const CardSectionDivider(),
                CollapsibleCardSection(
                  title: l10n.flutter_log_entry_error,
                  identifier: CoreComponentIdentifier
                      .coreFlutterLogCardFlutterLogEntryError.name,
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
                            label: l10n.flutter_log_entry_error,
                            initialText: log.exception,
                            onChanged: (v) {},
                          ),
                          if (log.context != null)
                            NextCardFormField.text(
                              validationGroup: validationGroupId,
                              labelPosition: labelPosition,
                              maxLines: 10,
                              minLines: 5,
                              readOnly: true,
                              label: l10n.flutter_log_entry_context,
                              initialText: log.context,
                              onChanged: (v) {},
                            ),
                          if (log.stack != null)
                            NextCardFormField.text(
                              validationGroup: validationGroupId,
                              labelPosition: labelPosition,
                              maxLines: 10,
                              minLines: 5,
                              readOnly: true,
                              label: l10n.flutter_log_entry_stack_trace,
                              initialText: log.stack,
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
