import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';

extension NutzenLayoutLaufrichtungExt on NutzenlayoutLaufrichtung {
  String readable(ElbCoreLocalizations l10n) {
    switch (this) {
      case NutzenlayoutLaufrichtung.footForward:
        return 'Fuß voraus'.hc;
      case NutzenlayoutLaufrichtung.headForward:
        return 'Kopf voraus'.hc;
      case NutzenlayoutLaufrichtung.wordStartForward:
        return 'Wortanfang voraus'.hc;
      case NutzenlayoutLaufrichtung.wordEndForward:
        return 'Wortende voraus'.hc;
      case NutzenlayoutLaufrichtung.mixed:
        return 'Mixed'.hc;
    }
  }

  String shortReadable(ElbCoreLocalizations l10n) {
    switch (this) {
      case NutzenlayoutLaufrichtung.footForward:
        return 'Fuß'.hc;
      case NutzenlayoutLaufrichtung.headForward:
        return 'Kopf'.hc;
      case NutzenlayoutLaufrichtung.wordStartForward:
        return 'Wortanfang'.hc;
      case NutzenlayoutLaufrichtung.wordEndForward:
        return 'Wortende'.hc;
      case NutzenlayoutLaufrichtung.mixed:
        return 'Mixed'.hc;
    }
  }

  double get angle {
    switch (this) {
      case NutzenlayoutLaufrichtung.footForward:
        return 0;
      case NutzenlayoutLaufrichtung.headForward:
        return 180;
      case NutzenlayoutLaufrichtung.wordEndForward:
        return 90;
      case NutzenlayoutLaufrichtung.wordStartForward:
        return 270;
      case NutzenlayoutLaufrichtung.mixed:
        return 0;
    }
  }
}
