import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

class FloatingArtworkTemplateWindowData extends FloatingWindowData {
  /// @nodoc
  FloatingArtworkTemplateWindowData({
    required this.artworkTemplateId,
    required this.customerId,
    required this.preSelectionId,
    required this.selectionId,
  }) : super(
          windowType: FloatingWindowType.artworkTemplate.name,
          icon: FloatingWindowType.artworkTemplate.icon,
          minSize: const Size(1350, 550),
          defaultSize: const Size(1650, 850),
        );

  /// The id of the contact
  final int? artworkTemplateId;

  /// The id of the customer. If null, this is a global template.
  final int? customerId;

  final int preSelectionId;
  final int selectionId;
}
