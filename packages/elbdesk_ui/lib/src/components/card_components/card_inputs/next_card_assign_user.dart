import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NextCardAssignUser extends HookConsumerWidget {
  const NextCardAssignUser({
    required this.label,
    required this.initialUser,
    required this.onSelected,
    required this.labelPosition,
    required this.readOnly,
    required this.validationGroupId,
    this.availableUsers,
    this.isMandatory = false,
    this.focusOrderId,
    super.key,
  });
  final String label;
  final LightUser? initialUser;
  final void Function(LightUser?) onSelected;
  final NextCardFormFieldLabelPosition labelPosition;
  // we could use this later for filterin departmens etc.
  final List<LightUser>? availableUsers;
  final bool readOnly;
  final bool isMandatory;
  final double? focusOrderId;
  final String? validationGroupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialUserName = useMemoized(
      () {
        return initialUser?.fullName ?? '';
      },
      [],
    );
    final users = availableUsers ??
        ref.watch(watchAllActiveLightUsersProvider).requireValue;
    return NextCardDropdownMenu(
      labelPosition: labelPosition,
      isMandatory: isMandatory,
      label: label,
      readOnly: readOnly,
      validationGroupId: validationGroupId,
      focusOrderId: focusOrderId,
      onSelected: onSelected,
      initialValue: initialUserName,
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
