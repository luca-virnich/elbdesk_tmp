import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

/// Floating window data for {{#pascalCase}}{{feature_name}}{{/pascalCase}}
@immutable
class Floating{{#pascalCase}}{{feature_name}}{{/pascalCase}}WindowData extends FloatingWindowData {
  /// Creates floating window data for {{#snakeCase}}{{feature_name}}{{/snakeCase}}
  Floating{{#pascalCase}}{{feature_name}}{{/pascalCase}}WindowData({
    required this.entityId,
    required this.customerId,
    this.initialNoteId,
    this.initialNoteParentId,
  }) : super(
          type: FloatingWindowType.{{#camelCase}}{{feature_name}}{{/camelCase}},
          floatingWindowId: const Uuid().v4(),
          createdAt: DateTime.now(),
          taskbarIcon: AppIcons.{{#camelCase}}{{feature_name}}{{/camelCase}},
        );

  @override
  void onClose() {}

  @override
  void onSave() {}

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Floating{{#pascalCase}}{{feature_name}}{{/pascalCase}}WindowData &&
        other.entityId == entityId &&
        other.customerId == customerId &&
        other.type == type &&
        other.floatingWindowId == floatingWindowId &&
        other.createdAt == createdAt &&
        other.taskbarIcon == taskbarIcon &&
        other.initialNoteId == initialNoteId &&
        other.initialNoteParentId == initialNoteParentId;
  }

  @override
  int get hashCode => Object.hash(
        entityId,
        customerId,
        type,
        floatingWindowId,
        createdAt,
        taskbarIcon,
        initialNoteId,
        initialNoteParentId,
      );

  /// The id of the {{#snakeCase}}{{feature_name}}{{/snakeCase}}
  final int? entityId;

  /// The customer id
  final int customerId;

  /// Initial note id for navigation
  final int? initialNoteId;

  /// Initial note parent id for navigation
  final int? initialNoteParentId;
} 
