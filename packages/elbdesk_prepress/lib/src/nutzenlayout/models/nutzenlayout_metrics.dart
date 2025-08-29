import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutzenlayout_metrics.freezed.dart';

@freezed
class NutzenlayoutMetrics with _$NutzenlayoutMetrics {
  const factory NutzenlayoutMetrics({
    required int reihenCount,
    required double drucklaenge,
    required int nutzenProReihe,
    required NutzenlayoutLaufrichtung laufrichtung,
    required double gapH,
    required double kuerzung,
    required NutzenlayoutType type,
    required NutzenlayoutUnitSystem unitSystem,
    required String description,
  }) = _NutzenlayoutMetrics;

  const NutzenlayoutMetrics._();

  factory NutzenlayoutMetrics.initial() {
    return const NutzenlayoutMetrics(
      reihenCount: 0,
      drucklaenge: 0,
      nutzenProReihe: 0,
      laufrichtung: NutzenlayoutLaufrichtung.footForward,
      gapH: 0,
      kuerzung: 0,
      type: NutzenlayoutType.rotativ,
      unitSystem: NutzenlayoutUnitSystem.teeth,
      description: '',
    );
  }
}

// Just a class for temporary values when editing the nutzenlayout reihe

@freezed
class NutzenlayoutEditValues with _$NutzenlayoutEditValues {
  const factory NutzenlayoutEditValues({
    required double? gapH,
    required int cells,
    required NutzenlayoutLaufrichtung laufrichtung,
    required double offset,
    required double kuerzung,
    required Artwork? artwork,
  }) = _NutzenlayoutEditValues;
}
