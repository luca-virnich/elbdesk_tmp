part of 'app_table_toolbar.dart';

/// Shows the current name of the selected view for the table
class _TableName extends HookConsumerWidget {
  const _TableName({
    required this.componentIdentifier,
    required this.sessionId,
    required this.tableDefaultConfig,
    required this.onlyDefaultConfig,
    required this.fixedTableTitle,
    required this.namePlural,
  });

  final String componentIdentifier;
  final String sessionId;
  final List<TableFieldConfig> tableDefaultConfig;
  final bool onlyDefaultConfig;
  final String? fixedTableTitle;
  final String namePlural;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedConfig = ref.watch(
      appTableConfigStateProvider(
        componentIdentifier,
        sessionId,
      ),
    );

    return selectedConfig.emptyWhen(
      data: (config) {
        return AppText(
          fixedTableTitle ?? config!.name,
          maxLines: 1,
          autoSize: false,
          overflow: TextOverflow.ellipsis,
          style: context.appTheme.textStyles.h1,
        );
      },
    );
  }
}
