import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';

class FloatingContactCompanyWindowData extends FloatingWindowData {
  /// @nodoc
  FloatingContactCompanyWindowData({
    required this.contactId,
    this.initialNoteId,
    this.initialNoteParentId,
  }) : super(
          windowType: FloatingWindowType.contactCompany.name,
          minSize: const Size(400, 600),
          defaultSize: const Size(1250, 800),
          icon: FloatingWindowType.contactCompany.icon,
        );

  /// The id of the contact
  final int? contactId;

  /// The type of the contact

  final int? initialNoteId;
  final int? initialNoteParentId;
}
