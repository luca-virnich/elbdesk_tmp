import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';

extension ArtworkPrintProcessTypeExt on ArtworkPrintProcessType {
  String readable(ElbPrepressLocalizations ppL10n) {
    return switch (this) {
      ArtworkPrintProcessType.flexodruck => ppL10n.print_process_type_flexo,
      ArtworkPrintProcessType.digitaldruck => ppL10n.print_process_type_digital,
      ArtworkPrintProcessType.offsetdruck => ppL10n.print_process_type_offset,
      ArtworkPrintProcessType.siebdruck => ppL10n.print_process_type_screen,
      ArtworkPrintProcessType.buchdruck =>
        ppL10n.print_process_type_letterpress,
    };
  }

  /// Short Readable Print Process Type
  ///
  /// Should probably not be translated, these will be part of the filename
  String get shortReadable {
    return switch (this) {
      ArtworkPrintProcessType.flexodruck => 'FL',
      ArtworkPrintProcessType.digitaldruck => 'DI',
      ArtworkPrintProcessType.offsetdruck => 'OF',
      ArtworkPrintProcessType.siebdruck => 'SI',
      ArtworkPrintProcessType.buchdruck => 'BD',
    };
  }
}

extension ArtworkPrintProcessTypeListExt on List<ArtworkPrintProcessType> {
  List<ArtworkPrintProcessType> get ordered {
    return [
      ArtworkPrintProcessType.flexodruck,
      ArtworkPrintProcessType.digitaldruck,
      ArtworkPrintProcessType.offsetdruck,
      ArtworkPrintProcessType.siebdruck,
      ArtworkPrintProcessType.buchdruck,
    ];
  }
}
