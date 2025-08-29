import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

enum CoreFloatingWindowType {
  coreAdminLog(isTable: true, icon: AppIcons.admin_log),
  coreFlutterLog(isTable: true, icon: AppIcons.flutter_log),
  coreServerpodLog(isTable: true, icon: AppIcons.serverpod_log);

  const CoreFloatingWindowType({
    required this.isTable,
    required this.icon,
  });

  final bool isTable;
  final IconData icon;
}

extension CoreFloatingWindowTypeExtension on CoreFloatingWindowType {
  String recentWindowFilterReadable(ElbCoreLocalizations l10n) {
    return switch (this) {
      CoreFloatingWindowType.coreAdminLog => 'Admin Log',
      CoreFloatingWindowType.coreFlutterLog => 'Flutter Log',
      CoreFloatingWindowType.coreServerpodLog => 'Serverpod Log',
    };
  }

  String title(ElbCoreLocalizations l10n) {
    return switch (this) {
      CoreFloatingWindowType.coreAdminLog => 'Admin Log',
      CoreFloatingWindowType.coreFlutterLog => 'Flutter Log',
      CoreFloatingWindowType.coreServerpodLog => 'Serverpod Log',
    };
  }
}
