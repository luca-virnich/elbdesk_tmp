import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';

/// Extension for providing readable field names for CoeColorType
extension ArtworkColorTypeExt on ArtworkColorType {
  /// Returns the readable name of the field
  String readable(ElbPrepressLocalizations ppL10n) {
    return switch (this) {
      ArtworkColorType.normal => ppL10n.color_type_normal,
      ArtworkColorType.opak => ppL10n.color_type_opak,
      ArtworkColorType.nichtDruckend => ppL10n.color_type_non_printing,
    };
  }
}

/// Extension for providing readable field names for
/// ArtworkVerarbeitungsebeneType
extension ArtworkVerarbeitungsebeneTypeExt on ArtworkVerarbeitungsebeneType {
  /// Returns the readable name of the field
  String readable(ElbPrepressLocalizations ppL10n) {
    return switch (this) {
      ArtworkVerarbeitungsebeneType.bemassung => ppL10n.layer_type_dimensions,
      ArtworkVerarbeitungsebeneType.keine => ppL10n.layer_type_none,
      ArtworkVerarbeitungsebeneType.lack => ppL10n.layer_type_varnish,
      ArtworkVerarbeitungsebeneType.stanzen => ppL10n.layer_type_die_cutter,
    };
  }
}

/// Extension for providing readable field names for
/// ArtworkColorPrintProcessType
extension ArtworkColorPrintProcessTypeExt on ArtworkColorPrintProcessType {
  /// Returns the readable name of the field
  String readable(ElbPrepressLocalizations ppL10n) {
    return switch (this) {
      ArtworkColorPrintProcessType.flexo => ppL10n.print_process_flexo,
      ArtworkColorPrintProcessType.flexoRef => ppL10n.print_process_flexo_ref,
      ArtworkColorPrintProcessType.siebdruck =>
        ppL10n.print_process_type_screen,
      ArtworkColorPrintProcessType.siebdruckRef =>
        '${ppL10n.print_process_type_screen} Ref',
      ArtworkColorPrintProcessType.buchdruck =>
        ppL10n.print_process_type_letterpress,
      ArtworkColorPrintProcessType.buchdruckRef =>
        '${ppL10n.print_process_type_letterpress} Ref',
      ArtworkColorPrintProcessType.digitaldruck =>
        ppL10n.print_process_type_digital,
      ArtworkColorPrintProcessType.digitaldruckRef =>
        '${ppL10n.print_process_type_digital} Ref',
      ArtworkColorPrintProcessType.offsetdruck =>
        ppL10n.print_process_type_offset,
      ArtworkColorPrintProcessType.offsetdruckRef =>
        '${ppL10n.print_process_type_offset} Ref',
      ArtworkColorPrintProcessType.nichtDruckend =>
        ppL10n.print_process_nicht_druckend,
    };
  }
}

/// Extension for providing readable field names for ArtworkColorSpecType
extension ArtworkColorSpecTypeExt on ArtworkColorSpecType {
  /// Returns the readable name of the field
  String readable(ElbPrepressLocalizations ppL10n) {
    return switch (this) {
      ArtworkColorSpecType.kodak => ppL10n.color_spec_type_kodak,
      ArtworkColorSpecType.quartz => ppL10n.color_spec_type_quartz,
      ArtworkColorSpecType.standard => ppL10n.color_spec_type_standard,
      ArtworkColorSpecType.verarbeitungsSchritt =>
        ppL10n.color_spec_type_processing_step,
    };
  }
}
