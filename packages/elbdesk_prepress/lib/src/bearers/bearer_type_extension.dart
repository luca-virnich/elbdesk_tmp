import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';

/// Bearer Type Wrapper
///
// Extension for providing readable field names, filter types, and validators
// for BearerField
extension type BearerTypeWrapper(BearerType type) {
  /// Returns the readable name of the field
  String readable(ElbCoreLocalizations l10n) {
    return switch (this) {
      BearerType.none => l10n.bearer_type_none,
      BearerType.type1 => l10n.bearer_type_type1,
      BearerType.type2 => l10n.bearer_type_type2,
      BearerType.standardFlexoPrint => l10n.bearer_type_standard_flexo_print,
      BearerType.flexoPrintMultilayer =>
        l10n.bearer_type_flexo_print_multilayer,
      BearerType.sheetFedPressMinPlate =>
        l10n.bearer_type_sheet_fed_press_min_plate,
      BearerType.sheetFedPressPlateEqualsSub =>
        l10n.bearer_type_sheet_fed_press_plate_equals_sub,
      BearerType.offsetPressFixedPlate =>
        l10n.bearer_type_offset_press_fixed_plate,
      BearerType.sheetFedPressFixedPlate =>
        l10n.bearer_type_sheet_fed_press_fixed_plate,
    };
  }
}
