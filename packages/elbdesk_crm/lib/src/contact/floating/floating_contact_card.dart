import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_crm/src/contact/widgets/contact_card/contact_card.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Floating Contact Card
///
/// This widget is used to display the contact information in a floating window
/// It is e.g. called from a button in the ContactTable
/// The definition of the FloatingCard is done in the DashboardScreen
// class FloatingContactCard extends HookConsumerWidget {
//   /// Constructor for the FloatingContactCard
//   const FloatingContactCard({
//     required this.data,
//     super.key,
//   });

//   /// The data for the floating window
//   final FloatingContactWindowData data;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ContactCard(
//       initialContactType: data.initialContactType,
//       floatingWindowId: data.floatingWindowId,
//       tableSessionId: data.tableSessionId,
//       contactId: data.contactId,
//       floatingWindowType: data.windowType,
//       initialNoteId: data.initialNoteId,
//       initialNoteParentId: data.initialNoteParentId,
//     );
//   }
// }

class FloatingContactPersonCard extends HookConsumerWidget {
  /// Constructor for the FloatingContactCard
  const FloatingContactPersonCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingContactPersonWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ContactCard(
      initialContactType: ContactType.person,
      floatingWindowId: data.floatingWindowId,
      contactId: data.contactId,
      floatingWindowType: data.windowType,
      initialNoteId: data.initialNoteId,
      initialNoteParentId: data.initialNoteParentId,
    );
  }
}

class FloatingContactCompanyCard extends HookConsumerWidget {
  /// Constructor for the FloatingContactCard
  const FloatingContactCompanyCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingContactCompanyWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ContactCard(
      initialContactType: ContactType.company,
      floatingWindowId: data.floatingWindowId,
      contactId: data.contactId,
      floatingWindowType: data.windowType,
      initialNoteId: data.initialNoteId,
      initialNoteParentId: data.initialNoteParentId,
    );
  }
}
