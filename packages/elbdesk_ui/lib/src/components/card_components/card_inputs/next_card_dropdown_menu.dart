import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_platform_info/elbdesk_platform_info.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

class NextCardLazyDropdownMenu<T> extends HookConsumerWidget {
  const NextCardLazyDropdownMenu({
    required this.dataProvider,
    required this.labelBuilder,
    required this.onSelected,
    required this.initialValue,
    required this.readOnly,
    required this.label,
    required this.labelPosition,
    required this.validationGroupId,
    this.focusOrderId,
    this.isMandatory = false,
    this.outsideTrailing,
    this.focusNode,
    this.controller,
    this.validator,
    this.width,
    super.key,
  });

  final ProviderListenable<AsyncValue<List<T>>> dataProvider;

  final String Function(T) labelBuilder;
  final void Function(T?) onSelected;
  final String? initialValue;
  final bool readOnly;
  final double? focusOrderId;
  final bool isMandatory;
  final NextCardFormFieldLabelPosition labelPosition;
  final String label;
  final Widget? outsideTrailing;
  final String? validationGroupId;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final double? width;

  static final isMobile = ElbDeskPlatformInfo.isMobileDevice;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureFocusNode = useFocusNode();
    final focusNode = this.focusNode ?? useFocusNode();
    final isActivated = useState<bool>(false);
    final temporaryProps = context.appTheme.temporaryProperties;
    final l10n = context.l10n;
    final fieldId = useRef<String>(const Uuid().v4());
    useEffect(
      () {
        focusNode.addListener(() {
          if (focusNode.hasFocus && !readOnly) {
            isActivated.value = true;
          }
        });
        return null;
      },
      [],
    );

    if (!isActivated.value) {
      return ExcludeFocus(
        excluding: readOnly,
        child: Row(
          children: [
            Expanded(
              child: ElbFocusOrderWrapper(
                focusOrderId: focusOrderId,
                child: NextCardFormField.text(
                  controller: controller,
                  suffixPadding: EdgeInsets.zero,
                  suffix: AppIconButton.rotating(
                    visualDensity: VisualDensity.compact,
                    skipTraversal: true,
                    turns: 0,
                    iconData: AppIcons.expand_more,
                    color: readOnly
                        ? temporaryProps.appNextDropdownMenuReadOnlyColor
                        : temporaryProps.appNextDropdownMenuForegroundColor,
                    onPressed: () {
                      isActivated.value = true;
                    },
                  ),
                  focusNode: focusNode,
                  label: label,
                  validator: (value) {
                    // Check mandatory validation first
                    if (isMandatory && (value?.isEmpty ?? false)) {
                      return l10n.validation_invalid_selection;
                    }
                    // Apply additional custom validator if provided
                    if (validator != null) {
                      return validator!(value);
                    }
                    return null;
                  },
                  initialText: initialValue,
                  labelPosition: labelPosition,
                  readOnly: readOnly,
                  validationGroup: validationGroupId,
                  validationFieldId: fieldId.value,
                  onChanged: null,
                ),
              ),
            ),
            if (outsideTrailing != null) ...[
              const SizedBox(
                width: UiConstants.elementMargin,
              ),
              outsideTrailing!,
            ],
          ],
        ),
      );
    }

    final data = ref.watch(dataProvider);
    return data.componentWhen(
      loadingWidget: ExcludeFocus(
        excluding: readOnly,
        child: Row(
          children: [
            Expanded(
              child: NextCardLoadingTextField(
                label: label,
                labelPosition: labelPosition,
                suffix: AppIconButton.rotating(
                  visualDensity: VisualDensity.compact,
                  skipTraversal: true,
                  turns: 0,
                  iconData: AppIcons.expand_more,
                  color: readOnly
                      ? temporaryProps.appNextDropdownMenuReadOnlyColor
                      : temporaryProps.appNextDropdownMenuForegroundColor,
                  onPressed: null,
                ),
              ),
            ),
            if (outsideTrailing != null) ...[
              const SizedBox(
                width: UiConstants.elementMargin,
              ),
              outsideTrailing!,
            ],
          ],
        ),
      ),
      data: (data) {
        useEffect(
          () {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              futureFocusNode.requestFocus();
            });
            return null;
          },
          [],
        );

        return NextCardDropdownMenu<T>(
          isLazy: true,
          width: width,
          readOnly: readOnly,
          controller: controller,
          focusOrderId: focusOrderId,
          validationGroupId: validationGroupId,
          focusNode: futureFocusNode,
          validationFieldId: fieldId.value,
          dropdownMenuEntries: data
              .map(
                (e) => NextDropdownMenuEntry(
                  label: labelBuilder(e),
                  value: e,
                ),
              )
              .toList(),
          labelPosition: labelPosition,
          label: label,
          initialValue: initialValue,
          onSelected: onSelected,
          outsideTrailing: outsideTrailing,
          isMandatory: isMandatory,
          validator: validator,
        );
      },
    );
  }
}

class NextCardDropdownMenu<T> extends StatelessWidget {
  const NextCardDropdownMenu({
    required this.dropdownMenuEntries,
    required this.onSelected,
    required this.readOnly,
    required this.validationGroupId,
    this.initialValue,
    this.isInTableCell = false,
    this.focusOrderId,
    this.isMandatory = false,
    this.labelPosition = NextCardFormFieldLabelPosition.top,
    this.label = '',
    this.outsideTrailing,
    this.focusNode,
    this.validationFieldId,
    this.isLazy = false,
    this.showLabel = true,
    this.controller,
    this.width,
    this.validator,
    super.key,
  });
  final List<NextDropdownMenuEntry<T>> dropdownMenuEntries;
  final void Function(T?) onSelected;
  final String? initialValue;
  final bool readOnly;
  final bool isInTableCell;
  final double? focusOrderId;
  final bool isMandatory;
  final NextCardFormFieldLabelPosition labelPosition;

  final String label;
  final Widget? outsideTrailing;

  final FocusNode? focusNode;
  final bool isLazy;
  final String? validationGroupId;
  // we have to pass this if we interact with multiple valdidators at once,
  // eg a lazy dropdown menu inside a validation group
  final String? validationFieldId;
  final bool showLabel;
  final TextEditingController? controller;
  final double? width;

  /// Additional validator function that will be combined with mandatory validation
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiConstants.cardFieldPadding,
      child: ExcludeFocus(
        excluding: readOnly,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (labelPosition == NextCardFormFieldLabelPosition.top &&
                showLabel)
              AppText(label),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (labelPosition == NextCardFormFieldLabelPosition.left &&
                    showLabel)
                  SizedBox(
                    width: UiConstants.leftLabelWidth,
                    child: NextAppFieldLeftLabel(
                      label: label,
                      maxLines: 1,
                    ),
                  ),
                Expanded(
                  child: NextDropdownMenu<T>(
                    width: width,
                    label: label,
                    controller: controller,
                    validationFieldId: validationFieldId,
                    validationGroup: validationGroupId,
                    isLazy: isLazy,
                    focusOrderId: focusOrderId,
                    dropdownMenuEntries: dropdownMenuEntries,
                    onSelected: onSelected,
                    initialValue: initialValue,
                    readOnly: readOnly,
                    isInTableCell: isInTableCell,
                    focusNode: focusNode,
                    isMandatory: isMandatory,
                    validator: validator,
                  ),
                ),
                if (outsideTrailing != null) ...[
                  const SizedBox(
                    width: UiConstants.elementMargin,
                  ),
                  outsideTrailing!,
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
