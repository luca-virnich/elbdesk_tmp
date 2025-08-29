import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/artwork_color/widgets/color_table/base_color_table.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Table for editing colors with short name editing and delete capabilities
class EditColorTable extends HookWidget {
  const EditColorTable({
    required this.colors,
    required this.maxWidth,
    required this.tableViewPage,
    required this.isLoading,
    required this.onColorDeleted,
    required this.onShortNameChanged,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    this.isImporting = false,
    this.bottomLeadingWidget,
    this.bottomTrailingWidget,
    super.key,
  });

  final List<ArtworkColor> colors;
  final double maxWidth;
  final ValueNotifier<int> tableViewPage;
  final bool isLoading;
  final bool isImporting;
  final void Function(ArtworkColor)? onColorDeleted;
  final void Function(ArtworkColor, String) onShortNameChanged;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final Widget? bottomLeadingWidget;
  final Widget? bottomTrailingWidget;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final generalColors = context.appTheme.generalColors;
    final hoveredColor = useState<ArtworkColor?>(null);

    return BaseColorTable(
      colors: colors,
      maxWidth: maxWidth,
      tableViewPage: tableViewPage,
      isLoading: isLoading,
      bottomLeadingWidget: bottomLeadingWidget,
      bottomTrailingWidget: bottomTrailingWidget,
      onColorHovered: (color) => hoveredColor.value = color,
      buildExtraColumns: () => [
        if (onColorDeleted != null)
          DataColumn(
            headingRowAlignment: MainAxisAlignment.center,
            columnWidth: const FixedColumnWidth(100),
            label: AppText(
              l10n.gen_delete,
              autoSize: false,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
      buildExtraDataCells: (color) => [
        if (onColorDeleted != null)
          DataCell(
            Center(
              child: AppIconButton.secondary(
                icon: const Icon(AppIcons.delete),
                color: context.appTheme.buttonStyles.secondary.foregroundColor,
                colorOnHover:
                    context.appTheme.buttonStyles.danger.foregroundColor,
                overlayColor: generalColors.transparent,
                onPressed: isImporting
                    ? null
                    : () {
                        onColorDeleted?.call(color);
                      },
              ),
            ),
          ),
      ],
      isImportMode: true,
      buildShortNameCell: (color) => DataCell(
        _ShortNameCell(
          color: color,
          isImporting: isImporting,
          isHovered: hoveredColor.value == color,
          onEdit: () async {
            final changedName = await showElbDialog<String?>(
              navigatorKey: navigatorKey,
              context: context,
              child: _ChangeColorShortNameDialog(
                shortName: color.shortName,
                navigatorKey: navigatorKey,
                floatingWindowId: floatingWindowId,
                floatingWindowFocus: floatingWindowFocus,
              ),
            );
            if (changedName != null) {
              onShortNameChanged(color, changedName);
            }
          },
        ),
      ),
    );
  }
}

class _ShortNameCell extends HookWidget {
  const _ShortNameCell({
    required this.color,
    required this.isImporting,
    required this.isHovered,
    required this.onEdit,
  });

  final ArtworkColor color;
  final bool isImporting;
  final bool isHovered;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final hovered = useState(false);
    final textStyle = context.appTheme.textStyles.h3;

    return RepaintBoundary(
      child: ElbMouseRegionGestureDetector(
        onEnter: (_) => hovered.value = true,
        onExit: (_) => hovered.value = false,
        onTap: isImporting ? null : onEdit,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: AppText(
                color.shortName,
                style: textStyle,
                maxLines: 1,
              ),
            ),
            AnimatedOpacity(
              opacity: hovered.value ? 1 : 0,
              duration: AnimationConstants.shortDuration,
              child: Padding(
                padding: const EdgeInsets.only(left: AppSpace.s),
                child: ElbIcon(
                  AppIcons.edit,
                  color: !isImporting
                      ? context
                          .appTheme.iconButtonProperties.foregroundColorActive
                      : context.appTheme.iconButtonProperties
                          .foregroundColorInactive,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChangeColorShortNameDialog extends HookWidget {
  const _ChangeColorShortNameDialog({
    required this.shortName,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
  });
  final String shortName;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textController = useTextEditingController(text: shortName);
    final focusNode = useFocusNode();
    final formKey = useFormKey();
    useEffect(
      () {
        focusNode.requestFocus();
        return null;
      },
      [],
    );
    final ppL10n = context.prepressL10n;
    return ElbDialog(
      floatingWindowId: floatingWindowId,
      isSelfScrollable: false,
      maxWidth: 600,
      title: '${ppL10n.color_change_short_name}: $shortName',
      onSaveAndCloseShortcut: () {
        final isValid = formKey.currentState?.validate();
        if (isValid ?? false) {
          navigatorKey.currentState?.pop(textController.text.trim());
        }
      },
      contentPadding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: UiConstants.defaultPadding,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: UiConstants.defaultPadding,
                ),
                child: NextCardFormField.text(
                  focusNode: focusNode,
                  label: ppL10n.color_short_name,
                  labelPosition: NextCardFormFieldLabelPosition.left,
                  readOnly: false,
                  validationGroup: null,
                  onChanged: null,
                  controller: textController,
                  validator: (value) {
                    final trimmed = value?.trim();
                    if (trimmed == null || trimmed.isEmpty) {
                      return l10n.validation_name_required;
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: AppSpace.m),
              const AppDivider(),
              const SizedBox(height: AppSpace.m),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: UiConstants.defaultPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppButton.primary(
                      icon: const Icon(AppIcons.save),
                      label: l10n.gen_save,
                      onPressed: () {
                        final isValid = formKey.currentState?.validate();
                        if (isValid ?? false) {
                          navigatorKey.currentState
                              ?.pop(textController.text.trim());
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
