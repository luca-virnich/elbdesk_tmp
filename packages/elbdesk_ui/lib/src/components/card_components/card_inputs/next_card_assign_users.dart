import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NextCardAssignUsers extends HookConsumerWidget {
  const NextCardAssignUsers({
    required this.labelPosition,
    required this.width,
    required this.selectedUsers,
    required this.onSelected,
    required this.onRemoved,
    this.isMandatory = false,
    this.label,
    this.singleSelection = true,
    super.key,
  });

  final NextCardFormFieldLabelPosition labelPosition;
  final double width;
  final String? label;

  final List<LightUser> selectedUsers;
  final void Function(LightUser) onSelected;
  final void Function(LightUser) onRemoved;
  final bool isMandatory;
  final bool singleSelection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();

    final controller = useTextEditingController();
    final asyncAllAppUsers = ref.watch(
      watchAllActiveLightUsersProvider,
    );

    useListenable(controller);

    return asyncAllAppUsers.fastWhen(
      data: (users) {
        final sortedUnselectedUsers =
            users.where((user) => !selectedUsers.contains(user)).toList()
              ..sort(
                (a, b) => (a.fullName).compareTo(b.fullName),
              );

        final sortedSelectedUsers =
            selectedUsers.where((user) => users.contains(user)).toList()
              ..sort(
                (a, b) => (a.fullName).compareTo(b.fullName),
              );

        final sortedUsers = [
          ...sortedSelectedUsers,
          ...sortedUnselectedUsers,
        ];

        final temporaryProperties = context.appTheme.temporaryProperties;

        final l10n = context.l10n;
        return SizedBox(
          height: UiConstants.buttonHeight,
          child: FormField(
            initialValue: selectedUsers.length,
            autovalidateMode: AutovalidateMode.always,
            validator: (value) {
              if (isMandatory && value == 0) {
                return l10n.validation_required;
              }
              if (value! > 1) {
                return l10n.user_assignment_error_only_one;
              }
              return null;
            },
            builder: (fieldState) {
              return Row(
                children: [
                  if (labelPosition == NextCardFormFieldLabelPosition.left &&
                      label != null)
                    SizedBox(
                      width: UiConstants.leftLabelWidth,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 2),
                        child: AppText(
                          label!,
                          autoSize: true,
                          height: 1.2,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  Flexible(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return NextMenuAnchor(
                          alignmentOffset: const Offset(
                            0,
                            5,
                          ),
                          style: MenuStyle(
                            backgroundColor: WidgetStatePropertyAll<Color>(
                              temporaryProperties
                                  .appNextDropdownMenuBackgroundColor,
                            ),
                            side: WidgetStatePropertyAll<BorderSide>(
                              BorderSide(
                                color: temporaryProperties
                                    .appNextDropdownMenuBorderColor,
                              ),
                            ),
                            shape: WidgetStatePropertyAll<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  temporaryProperties
                                      .appNextDropdownMenuBorderRadius,
                                ),
                              ),
                            ),
                          ),
                          onDismiss: () {},
                          builder: (context, controller, child) {
                            return InkWell(
                              onTap: () {
                                if (controller.isOpen) {
                                  controller.close();
                                } else {
                                  controller.open();
                                  focusNode.requestFocus();
                                }
                              },
                              child: Builder(
                                builder: (context) {
                                  if (selectedUsers.isEmpty) {
                                    return AbsorbPointer(
                                      absorbing: true,
                                      child: SizedBox(
                                        height: 28,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              if (labelPosition ==
                                                  NextCardFormFieldLabelPosition
                                                      .left)
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                              AppButton.blank(
                                                onPressed: () {},
                                                label: l10n.gen_add_entity(
                                                  'Mitarbeiter'.hc,
                                                  // l10n.crm_employee,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      top: labelPosition ==
                                              NextCardFormFieldLabelPosition
                                                  .left
                                          ? 0
                                          : 4,
                                    ),
                                    child: Wrap(
                                      spacing: -2,
                                      runSpacing: -2,
                                      children: [
                                        ...selectedUsers.map(
                                          (user) => LightUserAvatar(
                                            user: user,
                                            size: 26,
                                            isActive: false,
                                            isInRow: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          menuChildren: [
                            SizedBox(
                              width: constraints.maxWidth,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: NextTextField(
                                  hintText: l10n.gen_search,
                                  focusNode: focusNode,
                                  controller: controller,
                                ),
                              ),
                            ),
                            ...sortedUsers
                                .where(
                                  (user) =>
                                      user.fullName.toLowerCase().contains(
                                            controller.text.toLowerCase(),
                                          ),
                                )
                                .map(
                                  (user) => MenuItemButton(
                                    onPressed: () {
                                      final currentUsers = selectedUsers;
                                      final isNewUser = !currentUsers.any(
                                        (u) => u.userInfoId == user.userInfoId,
                                      );

                                      // single selection logic
                                      if (singleSelection) {
                                        if (isNewUser) {
                                          for (final existingUser in [
                                            ...selectedUsers,
                                          ]) {
                                            onSelected(
                                              existingUser,
                                            );
                                          }
                                          onSelected(user);
                                          fieldState.didChange(1);
                                        } else {
                                          if (selectedUsers.any(
                                            (u) =>
                                                u.userInfoId == user.userInfoId,
                                          )) {
                                            onSelected(user);
                                            fieldState.didChange(0);
                                          }
                                        }
                                        controller.clear();
                                        return;
                                      }

                                      // multi-selection logic
                                      final newLength = isNewUser
                                          ? selectedUsers.length + 1
                                          : selectedUsers.length - 1;

                                      onSelected(user);
                                      controller.clear();
                                      fieldState.didChange(newLength);
                                    },
                                    child: SizedBox(
                                      width: constraints.maxWidth - 29,
                                      child: Row(
                                        children: [
                                          LightUserAvatar(
                                            user: user,
                                            isActive: selectedUsers.any(
                                              (u) =>
                                                  u.userInfoId ==
                                                  user.userInfoId,
                                            ),
                                          ),
                                          const SizedBox(width: AppSpace.s),
                                          Expanded(
                                            child: AppText(
                                              user.fullName,
                                              autoSize: false,
                                            ),
                                          ),
                                          const SizedBox(width: AppSpace.s),
                                          if (selectedUsers.any(
                                            (u) =>
                                                u.userInfoId == user.userInfoId,
                                          ))
                                            AppIconButton(
                                              iconData: AppIcons.close,
                                              onPressed: () {
                                                // remove from selected
                                                onRemoved(user);
                                                fieldState.didChange(
                                                  selectedUsers.length - 1,
                                                );
                                                controller.clear();
                                              },
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
