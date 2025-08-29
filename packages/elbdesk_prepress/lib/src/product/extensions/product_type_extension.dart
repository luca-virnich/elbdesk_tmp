import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';

/// Extension for providing readable field names, filter types, and validators
/// for ProductType
extension ProductTypeExt on ProductType {
  /// Returns the readable name of the field
  String readable(ElbPrepressLocalizations ppL10n) {
    return switch (this) {
      ProductType.banderole => ppL10n.product_type_banderole,
      ProductType.boden => ppL10n.product_type_bottom,
      ProductType.multilayer => ppL10n.product_type_multilayer,
      ProductType.deckel => ppL10n.product_type_lid,
      ProductType.rueckseite => ppL10n.product_type_back,
      ProductType.vorderseite => ppL10n.product_type_front,
      ProductType.kit => ppL10n.product_type_kit,
      ProductType.vorlageDigitaldruck => ppL10n.product_type_template_digital,
    };
  }

  /// Short Readable Product Type
  ///
  /// Should probably not be translated, these will be part of the filename
  String get shortReadable {
    return switch (this) {
      ProductType.banderole => 'BA'.fixed,
      ProductType.boden => 'BO'.fixed,
      ProductType.multilayer => 'ML'.fixed,
      ProductType.deckel => 'DE'.fixed,
      ProductType.rueckseite => 'RS'.fixed,
      ProductType.vorderseite => 'VS'.fixed,
      ProductType.kit => 'KIT'.fixed,
      ProductType.vorlageDigitaldruck => 'VD'.fixed,
    };
  }
}

extension ProcuctTypeListExt on List<ProductType> {
  List<ProductType> get ordered {
    return [
      ProductType.vorderseite,
      ProductType.rueckseite,
      ProductType.deckel,
      ProductType.boden,
      ProductType.banderole,
      ProductType.multilayer,
      ProductType.kit,
      ProductType.vorlageDigitaldruck,
    ];
  }
}
