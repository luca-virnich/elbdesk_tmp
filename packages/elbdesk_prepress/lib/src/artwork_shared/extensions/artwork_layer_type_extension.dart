import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';

/// Extension for providing readable field names, filter Statuss, and validators
/// for SalesOrderStatus
extension ArtworkLayerTypeExt on ArtworkLayerType {
  /// Returns the readable name of the field
  String readable(ElbPrepressLocalizations ppL10n) {
    return switch (this) {
      ArtworkLayerType.none => ppL10n.layer_type_none,
      ArtworkLayerType.opaque_white => ppL10n.layer_type_opaque_white,
      ArtworkLayerType.die_cut => ppL10n.layer_type_die_cutter,
      ArtworkLayerType.varnish => ppL10n.layer_type_varnish,
      ArtworkLayerType.dimensions => ppL10n.layer_type_dimensions,
    };
  }
}

extension ArtworkLayerTypeListExt on List<ArtworkLayerType> {
  List<ArtworkLayerType> get ordered {
    return [
      ArtworkLayerType.none,
      ArtworkLayerType.opaque_white,
      ArtworkLayerType.die_cut,
      ArtworkLayerType.varnish,
      ArtworkLayerType.dimensions,
    ];
  }
}
