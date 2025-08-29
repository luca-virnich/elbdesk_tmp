import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';

/// Extension for providing readable names for ArtworkCodeType
extension ArtworkCodeTypeExt on ArtworkCodeType {
  /// Returns a human-readable string for the code type
  String readable(ElbCoreLocalizations l10n) {
    return switch (this) {
      ArtworkCodeType.twoOf5 => '2OF5'.fixed,
      ArtworkCodeType.aztec => 'Aztec'.fixed,
      ArtworkCodeType.template => 'Template'.fixed,
    };
  }

  /// Returns a short readable string for the code type
  String get shortReadable {
    return switch (this) {
      ArtworkCodeType.twoOf5 => '2OF5'.fixed,
      ArtworkCodeType.aztec => 'AZT'.fixed,
      ArtworkCodeType.template => 'TPL'.fixed,
    };
  }
}
