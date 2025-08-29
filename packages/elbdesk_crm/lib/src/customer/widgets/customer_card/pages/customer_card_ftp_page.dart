// ! Will be used later, don't delete it !

// class CustomerFtp extends StatelessWidget {
//   const CustomerFtp({
//     required this.customerId,
//     required this.sessionId,
//     required this.navigatorKey,
//     super.key,
//   });

//   final GlobalKey<NavigatorState> navigatorKey;
//   final int customerId;
//   final String sessionId;
//   @override
//   Widget build(BuildContext context) {
//     final l10n = context.l10n;
//     return ScrollableCardItem.constrained(
//       builder: (context, constraints) {
//         return Column(
//           children: [
//             CardSectionTitle(
//               title: l10n.crm_customer_ftp,
//               trailingWidgets: [
//                 AddEntityInCardButton(
//                   label: l10n.gen_add,
//                   tooltip: l10n.gen_add_entity(l10n.crm_customer_ftp),
//                   onPressed: () async {
//                     await AppResponsiveDialog.show<void>(
//                       context: context,
//                       navigatorKey: navigatorKey,
//                       child: AddFtpInterface(
//                         sessionId: sessionId,
//                         navigatorKey: navigatorKey,
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//             const CardSectionTitle(
//               title: 'Andere Daten',
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class _FtpView extends ConsumerWidget {
//   const _FtpView({
//     required this.sessionId,
//     required this.customerId,
//   });

//   final String sessionId;
//   final int customerId;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final ftpInterfaces = ref.watch(
//       customerStateProvider(customerId, sessionId)
//           .select((value) => value.requireValue.ftpInterfaces),
//     );
//     return ListView.separated(
//       separatorBuilder: (context, index) => const SizedBox(height: 8),
//       itemCount: ftpInterfaces.length,
//       itemBuilder: (context, index) => _FtpListTile(
//         ftpInterface: ftpInterfaces[index],
//       ),
//     );
//   }
// }

// class _FtpListTile extends StatelessWidget {
//   const _FtpListTile({
//     required this.ftpInterface,
//   });
//   final FTPInterfaceDTO ftpInterface;

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// class AddFtpInterface extends HookWidget {
//   const AddFtpInterface({
//     required this.sessionId,
//     required this.navigatorKey,
//     super.key,
//   });

//   final String sessionId;
//   final GlobalKey<NavigatorState> navigatorKey;

//   @override
//   Widget build(BuildContext context) {
//     final l10n = context.l10n;
//     final descriptionController = useTextEditingController();
//     final hostController = useTextEditingController();
//     final userController = useTextEditingController();
//     final passwordController = useTextEditingController();
//     final portController = useTextEditingController();
//     final dataInputController = useTextEditingController();
//     final workflowStartController = useTextEditingController();
//     final incomingReplyTypeController = useTextEditingController();
//     final incomingConfirmationReferenceController = useTextEditingController();
//     final incomingConfirmationMessageController = useTextEditingController();
//     final incomingConfirmationEmailController = useTextEditingController();
//     final incomingClientConfirmationReferenceController =
//         useTextEditingController();
//     final incomingClientConfirmationEmailController =
//         useTextEditingController();
//     final incomingClientConfirmationMessageController =
//         useTextEditingController();
//     final dataOutputController = useTextEditingController();
//     return ScrollableCardItem.constrained(
//       builder: (context, constraints) {
//         final labelPosition =
//             constraints.maxWidth > UiConstants.twoColumnWrapBreakpointWidth
//                 ? NextCardFormFieldLabelPosition.left
//                 : NextCardFormFieldLabelPosition.top;
//         return Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CardSectionTitle(
//               title: l10n.crm_customer_ftp_master_data,
//             ),
//             TwoColumnWrap(
//               width: constraints.maxWidth,
//               builder: (labelPosition, childWidth) {
//                 return [
//                   NextCardFormField.text(
//                     readOnly: false,
//                     label: l10n.crm_customer_ftp_description,
//                     labelPosition: labelPosition,
//                     controller: descriptionController,
//                     focusOrder: 1,
//                     onChanged: null,
//                     validationGroup: null,
//                   ),
//                   NextCardFormField.int(
//                     readOnly: false,
//                     label: l10n.crm_customer_ftp_host,
//                     labelPosition: labelPosition,
//                     controller: hostController,
//                     focusOrder: 2,
//                     onChanged: null,
//                     validationGroup: null,
//                   ),
//                   NextCardFormField.text(
//                     readOnly: false,
//                     label: l10n.crm_customer_ftp_user,
//                     labelPosition: labelPosition,
//                     controller: userController,
//                     focusOrder: 3,
//                     onChanged: null,
//                     validationGroup: null,
//                   ),
//                   NextCardFormField.text(
//                     readOnly: false,
//                     label: l10n.crm_customer_ftp_password,
//                     labelPosition: labelPosition,
//                     controller: passwordController,
//                     focusOrder: 4,
//                     onChanged: null,
//                     validationGroup: null,
//                   ),
//                   NextCardFormField.text(
//                     readOnly: false,
//                     label: l10n.crm_customer_ftp_port,
//                     labelPosition: labelPosition,
//                     controller: portController,
//                     focusOrder: 5,
//                     onChanged: null,
//                     validationGroup: null,
//                   ),
//                   NextCardFormField.text(
//                     readOnly: false,
//                     label: l10n.crm_customer_ftp_data_input,
//                     labelPosition: labelPosition,
//                     controller: dataInputController,
//                     focusOrder: 6,
//                     onChanged: null,
//                     validationGroup: null,
//                   ),
//                   NextCardFormField.text(
//                     readOnly: false,
//                     label: l10n.crm_customer_ftp_workflow_start,
//                     labelPosition: labelPosition,
//                     controller: workflowStartController,
//                     focusOrder: 7,
//                     onChanged: null,
//                     validationGroup: null,
//                   ),
//                 ];
//               },
//             ),
//             const SizedBox(height: UiConstants.defaultPadding),
//             CardSectionTitle(
//               title: l10n.crm_customer_ftp_confirmation_recepient_coe,
//             ),
//             TwoColumnWrap(
//               width: constraints.maxWidth,
//               builder: (labelPosition, childWidth) {
//                 return [
//                   NextCardFormField.text(
//                     readOnly: false,
//                     label: l10n.crm_customer_ftp_confirmation_recepient_type,
//                     labelPosition: labelPosition,
//                     controller: incomingReplyTypeController,
//                     focusOrder: 8,
//                     onChanged: null,
//                     validationGroup: null,
//                   ),
//                   NextCardFormField.text(
//                     readOnly: false,
//                     label: l10n.crm_customer_ftp_confirmation_subject,
//                     labelPosition: labelPosition,
//                     controller: incomingConfirmationReferenceController,
//                     focusOrder: 9,
//                     onChanged: null,
//                     validationGroup: null,
//                   ),
//                   NextCardFormField.email(
//                     readOnly: false,
//                     label: l10n.crm_customer_ftp_confirmation_email,
//                     labelPosition: labelPosition,
//                     controller: incomingConfirmationEmailController,
//                     focusOrder: 10,
//                     onChanged: null,
//                     validationGroup: null,
//                   ),
//                   NextCardFormField.text(
//                     readOnly: false,
//                     label: l10n.crm_customer_ftp_confirmation_message,
//                     labelPosition: labelPosition,
//                     controller: incomingConfirmationMessageController,
//                     focusOrder: 10,
//                     onChanged: null,
//                     validationGroup: null,
//                   ),
//                 ];
//               },
//             ),
//             const SizedBox(height: UiConstants.defaultPadding),
//             CardSectionTitle(
//               title: l10n.crm_customer_ftp_confirmation_recepient_customer,
//             ),
//             TwoColumnWrap(
//               width: constraints.maxWidth,
//               builder: (labelPosition, childWidth) {
//                 return [
//                   NextCardFormField.text(
//                     readOnly: false,
//                     label: l10n.crm_customer_ftp_confirmation_subject,
//                     labelPosition: labelPosition,
//                     controller: incomingClientConfirmationReferenceController,
//                     focusOrder: 11,
//                     onChanged: null,
//                     validationGroup: null,
//                   ),
//                   NextCardFormField.email(
//                     readOnly: false,
//                     label: l10n.crm_customer_ftp_confirmation_email,
//                     labelPosition: labelPosition,
//                     controller: incomingClientConfirmationEmailController,
//                     focusOrder: 12,
//                     onChanged: null,
//                     validationGroup: null,
//                   ),
//                   NextCardFormField.text(
//                     readOnly: false,
//                     label: l10n.crm_customer_ftp_confirmation_message,
//                     labelPosition: labelPosition,
//                     controller: incomingClientConfirmationMessageController,
//                     focusOrder: 13,
//                     onChanged: null,
//                     validationGroup: null,
//                   ),
//                 ];
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
