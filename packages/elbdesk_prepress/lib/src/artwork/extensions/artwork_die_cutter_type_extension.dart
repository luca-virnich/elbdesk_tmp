import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';

extension ArtworkDieCutterTypeExtension on ArtworkDieCutterType {
  String readable(ElbPrepressLocalizations ppL10n) {
    return switch (this) {
      ArtworkDieCutterType.circle => ppL10n.artwork_die_cutter_type_circle,
      ArtworkDieCutterType.square => ppL10n.artwork_die_cutter_type_square,
      ArtworkDieCutterType.custom => ppL10n.artwork_die_cutter_type_custom,
    };
  }
}

extension ArtworkDieCutterTypeListExt on List<ArtworkDieCutterType> {
  List<ArtworkDieCutterType> get ordered {
    return [
      ArtworkDieCutterType.circle,
      ArtworkDieCutterType.square,
      ArtworkDieCutterType.custom,
    ];
  }
}
