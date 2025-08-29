import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';

extension ArtworkTypeExt on ArtworkType {
  String readable(ElbPrepressLocalizations ppL10n) {
    return switch (this) {
      ArtworkType.front => ppL10n.artwork_front,
      ArtworkType.back => ppL10n.artwork_back,
    };
  }

  String get shortReadable {
    return switch (this) {
      ArtworkType.front => 'F',
      ArtworkType.back => 'B',
    };
  }
}

extension ArtworkTypeListExt on List<ArtworkType> {
  List<ArtworkType> get ordered {
    return [
      ArtworkType.front,
      ArtworkType.back,
    ];
  }
}
