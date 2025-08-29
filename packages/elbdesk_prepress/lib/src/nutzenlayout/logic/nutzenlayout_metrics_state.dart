import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/models/nutzenlayout_metrics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nutzenlayout_metrics_state.g.dart';

// Holds the metrics for a single nutzenlayout, used before going to the
// designer page

@riverpod
class NutzenLayoutMetricsState extends _$NutzenLayoutMetricsState {
  @override
  NutzenlayoutMetrics build(String sessionId) {
    return NutzenlayoutMetrics.initial();
  }

  void updateType(NutzenlayoutType type) {
    state = state.copyWith(type: type);
  }

  void updateReihenCount(int reihenCount) {
    state = state.copyWith(reihenCount: reihenCount);
  }

  void updateDrucklaenge(double drucklaenge) {
    state = state.copyWith(drucklaenge: drucklaenge);
  }

  void updateNutzenProReihe(int nutzenProReihe) {
    state = state.copyWith(nutzenProReihe: nutzenProReihe);
  }

  void updateUnitSystem(NutzenlayoutUnitSystem unitSystem) {
    state = state.copyWith(unitSystem: unitSystem);
  }

  void updateKuerzung(double kuerzung) {
    state = state.copyWith(kuerzung: kuerzung);
  }

  void updateLaufrichtung(NutzenlayoutLaufrichtung laufrichtung) {
    state = state.copyWith(laufrichtung: laufrichtung);
  }

  void updateGapH(double gapH) {
    state = state.copyWith(gapH: gapH);
  }

  void updateDescription(String description) {
    state = state.copyWith(description: description);
  }
}
