import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

class FilterValueDropdownAssignUser extends HookConsumerWidget {
  const FilterValueDropdownAssignUser.quickSearch({
    required this.componentIdentifier,
    required this.sessionId,
    required this.valueFocus,
    required this.filterFieldNotifier,
    required this.typeFocus,
    required this.formKey,
    required this.width,
    required this.controller,
    super.key,
  })  : availableFilterFields = null,
        groupIndex = null,
        filterIndex = null,
        filterLength = null,
        operatorValue = null;

  const FilterValueDropdownAssignUser.filter({
    required this.valueFocus,
    required this.controller,
    required this.sessionId,
    required this.availableFilterFields,
    required this.groupIndex,
    required this.filterIndex,
    required this.filterLength,
    required this.componentIdentifier,
    required this.operatorValue,
    required this.typeFocus,
    required this.width,
    super.key,
  })  : filterFieldNotifier = null,
        formKey = null;

  final double width;

  final FocusNode typeFocus;
  final String sessionId;
  final String componentIdentifier;
  final FocusNode valueFocus;
  // Quicksearch specific
  final ValueNotifier<FilterField>? filterFieldNotifier;
  final GlobalKey<FormState>? formKey;

  // Filter specific
  final Map<dynamic, TableFieldData>? availableFilterFields;

  final int? groupIndex;
  final int? filterIndex;
  final int? filterLength;
  final FilterOperator? operatorValue;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(watchAllLightUsersProvider).requireValue;
    final initialUser = useMemoized(
      () {
        final text = controller.text;
        if (text.isEmpty) {
          return '';
        }
        final asInt = int.tryParse(text);
        if (asInt == null) return '';
        final user = ref.read(
          fetchLocalLightUserByUserInfoIdProvider(asInt),
        );
        return user.fullName;
      },
      [],
    );
    return NextDropdownMenu(
      controller: controller,
      readOnly: false,
      isMandatory: true,
      onSelected: (user) {
        if (user == null) {
          return;
        }
        controller.text = user.fullName;
        ref
            .read(
              appTableFilterTempStateProvider(componentIdentifier, sessionId)
                  .notifier,
            )
            .updateFilterFieldValue(
              groupIndex!,
              filterIndex!,
              user.userInfoId.toString(),
            );
      },
      initialValue: initialUser,
      dropdownMenuEntries: users
          .map(
            (user) => NextDropdownMenuEntry(
              label: user.fullName,
              value: user,
            ),
          )
          .toList(),
    );
  }
}
