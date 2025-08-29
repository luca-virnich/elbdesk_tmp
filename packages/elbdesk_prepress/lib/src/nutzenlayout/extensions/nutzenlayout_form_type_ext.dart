import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart' show IconData;

extension NutzenLayoutFormTypeExt on NutzenlayoutFormType {
  String readable(ElbPrepressLocalizations ppL10n) {
    switch (this) {
      case NutzenlayoutFormType.einzelform:
        return ppL10n.layout_einzelform;
      case NutzenlayoutFormType.sammelform:
        return ppL10n.layout_sammelform;
    }
  }

  String shortReadable(ElbPrepressLocalizations ppL10n) {
    switch (this) {
      case NutzenlayoutFormType.einzelform:
        return ppL10n.layout_einzelform_short;
      case NutzenlayoutFormType.sammelform:
        return ppL10n.layout_sammelform_short;
    }
  }

  IconData get icon {
    return switch (this) {
      NutzenlayoutFormType.einzelform => AppIcons.soiEinzelformaufbau,
      NutzenlayoutFormType.sammelform => AppIcons.soiSammelformaufbau,
    };
  }
}
