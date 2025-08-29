// import 'package:elbdesk_client/elbdesk_client.dart';
// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:elbdesk_core/src/features/json_designer/extensions/json_field_type_extension.dart';
// import 'package:elbdesk_core/src/features/json_designer/logic/json_template_state.dart';
// import 'package:elbdesk_core/src/features/json_designer/models/json.dart';
// import 'package:elbdesk_core/src/features/json_designer/models/json_template.dart';
// import 'package:elbdesk_core/src/features/json_designer/repositories/json_template_repository.dart';
// import 'package:elbdesk_ui/elbdesk_ui.dart';
// // ignore: no_flutter_material_import
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class JsonTemplateCard extends HookConsumerWidget {
//   const JsonTemplateCard({
//     required this.id,
//     required this.floatingWindowId,
//     required this.floatingWindowFocus,
//     super.key,
//   });

//   final int? id;
//   final String floatingWindowId;
//   final FocusNode? floatingWindowFocus;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final formKey = useFormKey();
//     final l10n = context.l10n;
//     Future<void> onSavePressed(
//       int entityId,
//       String sessionId,
//     ) async {
//       final jsonTemplate =
//           ref.read(jsonTemplateStateProvider(entityId, sessionId)).requireValue;
//       await ref.read(jsonTemplateRepositoryProvider).update(
//             sessionId: sessionId,
//             entity: jsonTemplate,
//             release: false,
//           );
//       ref
//           .read(jsonTemplateStateProvider(entityId, sessionId).notifier)
//           .updateMetaAfterSave();
//       ref.invalidate(fetchAllJsonTemplatesProvider);
//     }

//     return EntityCard<JsonTemplate>(
//       floatingWindowFocus: floatingWindowFocus,
//       onSave: onSavePressed,
//       invalidateEntityState: (id, sessionId) async {
//         ref.invalidate(jsonTemplateStateProvider(id, sessionId));
//       },
//       stateProvider: jsonTemplateStateProvider.call,
//       floatingWindowId: floatingWindowId,
//       getTitle: (entity) => entity.name,
//       tableIcon: (entityId, sessionId) =>
//           TableTypeWrapper(TableType.jsonTemplate).tableIcon,
//       tablePrefix: (entityId, sessionId) =>
//           TableTypeWrapper(TableType.jsonTemplate).getDefaultNameSingular(l10n),
//       createEntity: (sessionId) =>
//           ref.read(jsonTemplateRepositoryProvider).create(sessionId),
//       formKey: formKey,
//       ribbonsBuilder: null,
//       streamDataProvider: ({
//         required sessionId,
//         required dataId,
//       }) =>
//           watchJsonTemplateProvider(
//         sessionId: sessionId,
//         jsonTemplateId: dataId,
//       ),
//       stateRefetchWithLock: (entityId, sessionId) async {
//         await ref
//             .read(jsonTemplateStateProvider(entityId, sessionId).notifier)
//             .refetchWithLock();
//       },
//       stateSaveUnlockRefetch: (sessionId, entityId, navigatorKey) async {
//         await ref
//             .read(jsonTemplateStateProvider(entityId, sessionId).notifier)
//             .saveAndUnlockAndRefetch();
//       },
//       entityId: id,
//       toComparable: JsonTemplateComparable.fromJsonTemplate,
//       tableType: TableType.jsonTemplate,
//       stateRefetchWithoutLock: (id, sessionId) => ref
//           .read(jsonTemplateStateProvider(id, sessionId).notifier)
//           .refetchWithoutLock(),
//       childBuilder: (
//         context,
//         entityId,
//         sessionId,
//         selectedNavigationIndexNotifier,
//         navigatorKey,
//         readOnly,
//         meta,
//         initialEntity,
//         isSaving,
//         savedOrInitialEntity,
//       ) {
//         return FloatingCardBody(
//           floatingWindowId: floatingWindowId,
//           navigatorKey: navigatorKey,
//           formKey: formKey,
//           footer: _Footer(
//             savedOrInitialEntity: savedOrInitialEntity,
//             isSaving: isSaving,
//             onSavePressed: () => onSavePressed(entityId, sessionId),
//             formKey: formKey,
//             readOnly: readOnly,
//             floatingWindowId: floatingWindowId,
//             navigatorKey: navigatorKey,
//             entityId: entityId,
//             sessionId: sessionId,
//             meta: meta,
//           ),
//           children: [
//             CardBodyItem(
//               child: SelfScrollableCardItem(
//                 child: _JsonTemplateView(
//                   id: entityId,
//                   sessionId: sessionId,
//                   readOnly: readOnly,
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class _JsonTemplateView extends HookConsumerWidget {
//   const _JsonTemplateView({
//     required this.id,
//     required this.sessionId,
//     required this.readOnly,
//   });

//   final int id;
//   final String sessionId;
//   final bool readOnly;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final nameController = useTextEditingController(
//       text:
//           ref.read(jsonTemplateStateProvider(id, sessionId)).requireValue.name,
//     );
//     final l10n = context.l10n;
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(right: UiConstants.defaultPadding),
//           child: Column(
//             children: [
//               const CardSectionTitle(title: 'Json Designer'),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: ConstrainedBox(
//                   constraints: const BoxConstraints(maxWidth: 400),
//                   child: AppTextFormField(
//                     readOnly: readOnly,
//                     label: l10n.gen_description,
//                     controller: nameController,
//                     validator: (value) {
//                       if (value == null || value.trim().isEmpty) {
//                         return l10n.validation_required;
//                       }
//                       return null;
//                     },
//                     onChanged: (value) {
//                       ref
//                           .read(
//                             jsonTemplateStateProvider(id, sessionId).notifier,
//                           )
//                           .updateName(value);
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(height: UiConstants.defaultPadding),
//               const AppDivider(),
//               const SizedBox(height: UiConstants.defaultPadding),
//             ],
//           ),
//         ),
//         Expanded(
//           child: _JsonFieldList(
//             id: id,
//             sessionId: sessionId,
//             readOnly: readOnly,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _JsonFieldList extends ConsumerStatefulWidget {
//   const _JsonFieldList({
//     required this.id,
//     required this.sessionId,
//     required this.readOnly,
//   });

//   final int id;
//   final String sessionId;
//   final bool readOnly;

//   @override
//   ConsumerState<_JsonFieldList> createState() => _JsonFieldListState();
// }

// class _JsonFieldListState extends ConsumerState<_JsonFieldList> {
//   bool isDraggingOver = false;

//   @override
//   Widget build(BuildContext context) {
//     final fields = ref.watch(
//       jsonTemplateStateProvider(widget.id, widget.sessionId).select(
//         (value) {
//           final rootTree = value.requireValue.jsonTree;
//           return <String, Json>{
//             rootTree.uuid: rootTree,
//           };
//         },
//       ),
//     );

//     return AppSingleChildScrollView(
//       child: Column(
//         children: [
//           ...fields.values.map((field) {
//             return _JsonFieldCard(
//               key: ValueKey(field.uuid),
//               field: field,
//               id: widget.id,
//               sessionId: widget.sessionId,
//               readOnly: widget.readOnly,
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }

// class _JsonFieldCard extends ConsumerStatefulWidget {
//   const _JsonFieldCard({
//     required Key key,
//     required this.field,
//     required this.id,
//     required this.sessionId,
//     required this.readOnly,
//     this.parentUuid,
//   }) : super(key: key);

//   final Json field;
//   final String? parentUuid;
//   final int id;
//   final String sessionId;
//   final bool readOnly;

//   @override
//   ConsumerState<_JsonFieldCard> createState() => _JsonFieldCardState();
// }

// class _JsonFieldCardState extends ConsumerState<_JsonFieldCard> {
//   late TextEditingController nameController;
//   late TextEditingController jsonKeyController;
//   late TextEditingController jsonValueController;
//   late FocusNode deletFocusNode;
//   bool isDraggingOver = false;

//   @override
//   void initState() {
//     super.initState();
//     nameController = TextEditingController(text: widget.field.name);
//     jsonKeyController = TextEditingController(text: widget.field.jsonKey);
//     deletFocusNode = FocusNode(skipTraversal: true);
//     jsonValueController = TextEditingController(
//       text: widget.field.jsonValue?.toString() ?? '',
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final appColors = context.appTheme.generalColors;
//     final l10n = context.l10n;
//     return Column(
//       children: [
//         Container(
//           padding: EdgeInsets.zero,
//           child: Row(
//             children: [
//               ConstrainedBox(
//                 constraints: const BoxConstraints(maxWidth: 300),
//                 child: AppTextFormField(
//                   readOnly: widget.readOnly,
//                   labelPosition: NextCardFormFieldLabelPosition.top,
//                   label: 'Name',
//                   hintText: 'Name des Feldes/Beschreibung',
//                   controller: nameController,
//                   onChanged: (value) {
//                     final updatedField = widget.field.copyWith(name: value);
//                     ref
//                         .read(
//                           jsonTemplateStateProvider(
//                             widget.id,
//                             widget.sessionId,
//                           ).notifier,
//                         )
//                         .updateField(
//                           updatedField,
//                           parentUuid: widget.parentUuid,
//                         );
//                   },
//                 ),
//               ),
//               const SizedBox(width: UiConstants.defaultPadding),
//               ConstrainedBox(
//                 constraints: const BoxConstraints(maxWidth: 200),
//                 child: AppTextFormField(
//                   readOnly: widget.readOnly,
//                   labelPosition: NextCardFormFieldLabelPosition.top,
//                   label: l10n.json_key,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.allow(
//                       RegExp('[a-zA-Z0-9_-]'),
//                     ),
//                   ],
//                   errorHintText: l10n.json_key_error_hint,
//                   validator: (value) {
//                     final isEmpty = value?.trim().isEmpty ?? true;
//                     if (isEmpty) {
//                       return l10n.validation_required;
//                     }
//                     final isValid = AppValidator.isValidJsonKey(value ?? '');
//                     if (!isValid) {
//                       return l10n.exception_invalid_input;
//                     }
//                     return null;
//                   },
//                   hintText: '...',
//                   controller: jsonKeyController,
//                   onChanged: (value) {
//                     final updatedField = widget.field.copyWith(jsonKey: value);
//                     ref
//                         .read(
//                           jsonTemplateStateProvider(
//                             widget.id,
//                             widget.sessionId,
//                           ).notifier,
//                         )
//                         .updateField(
//                           updatedField,
//                           parentUuid: widget.parentUuid,
//                         );
//                   },
//                 ),
//               ),
//               if (widget.field.type != JsonFieldType.object &&
//                   widget.field.type != JsonFieldType.array) ...[
//                 const SizedBox(width: UiConstants.defaultPadding),
//                 ConstrainedBox(
//                   constraints: const BoxConstraints(maxWidth: 300),
//                   child: AppTextFormField(
//                     readOnly: widget.readOnly,
//                     labelPosition: NextCardFormFieldLabelPosition.top,
//                     inputFormatters: [
//                       if (widget.field.type == JsonFieldType.number)
//                         AppInputFormatters.onlyDartDouble,
//                     ],
//                     controller: jsonValueController,
//                     label:
//                         // ignore: lines_longer_than_80_chars
//                         '${l10n.json_value} (${widget.field.type.readable(l10n)})',
//                     hintText: '...',
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return null;
//                       }
//                       if (widget.field.type == JsonFieldType.number) {
//                         final isNumber = AppValidator.isValidNumber(value);
//                         if (!isNumber) {
//                           return l10n.exception_invalid_input;
//                         }
//                       }
//                       if (widget.field.type == JsonFieldType.boolean) {
//                         final isBoolean = AppValidator.isValidBoolean(value);
//                         if (!isBoolean) {
//                           return l10n.exception_invalid_input;
//                         }
//                       }
//                       return null;
//                     },
//                     onChanged: (value) {
//                       final convertedValue = value.trim();
//                       final updatedField =
//                           widget.field.copyWith(jsonValue: convertedValue);
//                       ref
//                           .read(
//                             jsonTemplateStateProvider(
//                               widget.id,
//                               widget.sessionId,
//                             ).notifier,
//                           )
//                           .updateField(
//                             updatedField,
//                             parentUuid: widget.parentUuid,
//                           );
//                     },
//                   ),
//                 ),
//               ],
//               const Spacer(),
//               AppButton.dangerText(
//                 focusNode: deletFocusNode,
//                 label: l10n.gen_delete,
//                 onPressed: widget.readOnly
//                     ? null
//                     : () {
//                         ref
//                             .read(
//                               jsonTemplateStateProvider(
//                                 widget.id,
//                                 widget.sessionId,
//                               ).notifier,
//                             )
//                             .removeField(
//                               widget.field.uuid,
//                               parentUuid: widget.parentUuid,
//                             );
//                       },
//               ),
//             ],
//           ),
//         ),
//         if (widget.field.children != null) ...[
//           const Padding(
//             padding: EdgeInsets.only(top: 8),
//             child: Divider(height: 1),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 32,
//               top: 8,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 ...widget.field.children!.values.map((childField) {
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 12),
//                     child: _JsonFieldCard(
//                       key: ValueKey(childField.uuid),
//                       field: childField,
//                       parentUuid: widget.field.uuid,
//                       id: widget.id,
//                       sessionId: widget.sessionId,
//                       readOnly: widget.readOnly,
//                     ),
//                   );
//                 }),
//                 Wrap(
//                   spacing: 8,
//                   runSpacing: 8,
//                   children: JsonFieldType.values.map((type) {
//                     return AppButton.text(
//                       label: type.readable(l10n),
//                       onPressed: widget.readOnly
//                           ? null
//                           : () {
//                               final jsonField = Json(
//                                 name: '',
//                                 type: type,
//                                 jsonKey: '',
//                                 jsonValue: '',
//                                 uuid: const Uuid().v4(),
//                                 children: type == JsonFieldType.object ||
//                                         type == JsonFieldType.array
//                                     ? {}
//                                     : null,
//                               );
//                               ref
//                                   .read(
//                                     jsonTemplateStateProvider(
//                                       widget.id,
//                                       widget.sessionId,
//                                     ).notifier,
//                                   )
//                                   .addField(
//                                     jsonField,
//                                     parentUuid: widget.field.uuid,
//                                   );
//                             },
//                       iconData: AppIcons.add_circle_outline,
//                       color: appColors.primary.withAppOpacity(0.7),
//                     );
//                   }).toList(),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ],
//     );
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     jsonKeyController.dispose();
//     jsonValueController.dispose();
//     deletFocusNode.dispose();
//     super.dispose();
//   }
// }

// class _Footer extends ConsumerWidget {
//   const _Footer({
//     required this.savedOrInitialEntity,
//     required this.readOnly,
//     required this.formKey,
//     required this.navigatorKey,
//     required this.entityId,
//     required this.sessionId,
//     required this.meta,
//     required this.floatingWindowId,
//     required this.isSaving,
//     required this.onSavePressed,
//   });
//   final bool readOnly;
//   final GlobalKey<FormState> formKey;
//   final GlobalKey<NavigatorState> navigatorKey;
//   final int entityId;
//   final String sessionId;
//   final DataMeta meta;
//   final String? floatingWindowId;
//   final ValueNotifier<bool> isSaving;
//   final Future<void> Function() onSavePressed;
//   final ObjectRef<JsonTemplate?> savedOrInitialEntity;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final l10n = context.l10n;
//     return DefaultCardFooter<JsonTemplate>(
//       onSaveError: null,
//       savedOrInitialEntity: savedOrInitialEntity,
//       isSaving: isSaving,
//       readOnly: readOnly,
//       navigatorKey: navigatorKey,
//       onDeletePressed: () async {
//         Future<void> deleteOperation() async {
//           await ref
//               .read(jsonTemplateRepositoryProvider)
//               .delete(entityId, sessionId);
//         }

//         final (:success, :exception, :data) =
//             await AsyncHandler.handleAsyncOperation(
//           context,
//           deleteOperation,
//           successMessage: l10n.gen_saving_success,
//           successNavigatorKey: navigatorKey,
//           errorNavigatorKey: navigatorKey,
//         );
//         if (success) {
//           ref.invalidate(fetchAllJsonTemplatesProvider);

//           ref
//               .read(
//                 floatingWindowDataStateProvider.notifier,
//               )
//               .removeWindow(floatingWindowId!);
//         }
//       },
//       formKey: formKey,
//       meta: meta,
//       windowId: floatingWindowId,
//       onSavePressed: onSavePressed,
//     );
//   }
// }
