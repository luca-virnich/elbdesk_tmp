part of '../add_multi_nutzenlayout_dialog.dart';

const _width = 700.0;

class _AddMultiNutzenlayoutSelectMetricsPage extends HookWidget {
  const _AddMultiNutzenlayoutSelectMetricsPage({
    required this.salesOrderId,
    required this.sessionId,
    required this.customerId,
    required this.navigatorKey,
  });
  final int salesOrderId;
  final String sessionId;
  final int customerId;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      policy: OrderedTraversalPolicy(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Description(
            sessionId: sessionId,
          ),
          _Drucklaenge(
            sessionId: sessionId,
          ),
          const AppDivider(
            height: 32,
          ),
          SizedBox(
            width: _width,
            child: Row(
              children: [
                Expanded(child: _ReihenNutzenProReihe(sessionId: sessionId)),
                const SizedBox(width: UiConstants.defaultPadding),
                Expanded(child: _LaufrichtungGap(sessionId: sessionId)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Description extends HookConsumerWidget {
  const _Description({
    required this.sessionId,
  });
  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final initial = useMemoized(() {
      final metrics = ref.read(
        nutzenLayoutMetricsStateProvider(sessionId),
      );
      return metrics.description;
    });
    return SizedBox(
      width: _width,
      child: NextCardFormField.text(
        initialText: initial,
        onChanged: (v) {
          ref
              .read(
                nutzenLayoutMetricsStateProvider(sessionId).notifier,
              )
              .updateDescription(v);
        },
        validationGroup: null,
        label: l10n.gen_description,
        labelPosition: NextCardFormFieldLabelPosition.left,
        focusOrder: 1,
        readOnly: false,
      ),
    );
  }
}

class _Drucklaenge extends HookConsumerWidget {
  const _Drucklaenge({
    required this.sessionId,
  });
  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.l10n.localeName;
    final appTheme = context.appTheme;
    final inactiveBorderColor =
        appTheme.textFieldProperties.borderColor.withAppOpacity(0.3);

    final suffixColor =
        context.appTheme.generalColors.onBackground.withAppOpacity(0.5);

    final initialMetrics = useMemoized(() {
      final metrics = ref.read(
        nutzenLayoutMetricsStateProvider(sessionId),
      );
      return metrics;
    });
    final drucklaengeController = useTextEditingController(
      text: initialMetrics.drucklaenge.formatted(
        locale,
        fractionsWhenDoubleDouble: 3,
      ),
    );
    final zaehneController = useTextEditingController(
      text: initialMetrics.drucklaenge == 0
          ? ''
          : initialMetrics.drucklaenge.mmToTeeth().formatted(
                locale,
                fractionsWhenDoubleDouble: 3,
              ),
    );
    final inchController = useTextEditingController(
      text: initialMetrics.drucklaenge
          .mmToInch()
          .formatted(locale, fractionsWhenDoubleDouble: 3),
    );
    final zaehneErrorNotifier = useValueNotifier<String?>(null);
    final leadingUnitSystem = ref.watch(
      nutzenLayoutMetricsStateProvider(sessionId)
          .select((value) => value.unitSystem),
    );

    final mmFocusNode = useFocusNode();
    final inchFocusNode = useFocusNode();
    final zaehneFocusNode = useFocusNode();

    void onChangeDrucklaenge(String v) {
      final localDrucklaenge = Parser.parseDouble(v);
      ref
          .read(nutzenLayoutMetricsStateProvider(sessionId).notifier)
          .updateDrucklaenge(localDrucklaenge ?? 0);
      if (localDrucklaenge == null) {
        zaehneController.text = '';
        inchController.text = '';
      } else {
        final zaehne = localDrucklaenge.mmToTeeth();
        final inch = localDrucklaenge.mmToInch();
        final zaehneModulu = zaehne % 1;
        if (zaehneModulu != 0) {
          if (leadingUnitSystem == NutzenlayoutUnitSystem.teeth) {
            zaehneErrorNotifier.value =
                'Die Zähne müssen eine ganze Zahl sein'.hc;
          }

          zaehneController.text = zaehne.toStringAsFixed(3);
          inchController.text = inch.toStringAsFixed(3);
        } else {
          zaehneErrorNotifier.value = null;
          zaehneController.text = zaehne.toStringAsFixed(0);
          inchController.text = inch.toStringAsFixed(3);
        }
      }
    }

    void onChangeZaehne(String v) {
      final localZaehne = int.tryParse(v);
      if (localZaehne == null) {
        drucklaengeController.text = '';
        ref
            .read(
              nutzenLayoutMetricsStateProvider(sessionId).notifier,
            )
            .updateDrucklaenge(0);
      } else {
        zaehneErrorNotifier.value = null;
        drucklaengeController.text = localZaehne.teethToMm().formatted(
              locale,
              fractionsWhenDoubleDouble: 3,
            );
        inchController.text = localZaehne.teethToInch().formatted(
              locale,
              fractionsWhenDoubleDouble: 3,
            );
        ref
            .read(
              nutzenLayoutMetricsStateProvider(sessionId).notifier,
            )
            .updateDrucklaenge(localZaehne.teethToMm());
      }
    }

    void onInchChanged(String v) {
      final localInch = Parser.parseDouble(v);
      if (localInch == null) {
        ref
            .read(nutzenLayoutMetricsStateProvider(sessionId).notifier)
            .updateDrucklaenge(0);
        zaehneController.text = '';
        drucklaengeController.text = '';
      } else {
        ref
            .read(nutzenLayoutMetricsStateProvider(sessionId).notifier)
            .updateDrucklaenge(localInch.inchToMm());
        final inchToMm = localInch.inchToMm();
        zaehneController.text = inchToMm.mmToTeeth().formatted(
              locale,
              fractionsWhenDoubleDouble: 3,
            );
        drucklaengeController.text = inchToMm.formatted(
          locale,
          fractionsWhenDoubleDouble: 3,
        );
      }
    }

    return SizedBox(
      width: _width,
      child: NextCardMultiField(
        label: 'Drucklänge'.hc,
        labelPosition: NextCardFormFieldLabelPosition.left,
        fields: [
          NextCardFormField.int(
            focusNode: zaehneFocusNode,
            // autovalidateMode: AutovalidateMode.disabled,
            // customErrorMessageNotifier: zaehneErrorNotifier,
            label: ''.hc,
            showLabel: false,
            textColor: leadingUnitSystem == NutzenlayoutUnitSystem.teeth
                ? null
                : appTheme.textFieldProperties.disabledForegroundColor,
            focusOrder: 2.1,
            controller: zaehneController,
            borderColor: leadingUnitSystem == NutzenlayoutUnitSystem.teeth
                ? null
                : inactiveBorderColor,
            hideCopyButton: true,
            hideClearButton: true,
            validationGroup: null,
            validator: (v) {
              final leadingUnitSystem = ref.read(
                nutzenLayoutMetricsStateProvider(sessionId)
                    .select((value) => value.unitSystem),
              );
              if (leadingUnitSystem != NutzenlayoutUnitSystem.teeth) {
                return null;
              }
              final drucklaenge = ref
                  .read(nutzenLayoutMetricsStateProvider(sessionId))
                  .drucklaenge;
              final zaehne = drucklaenge.mmToTeeth();
              final zaehneModulu = zaehne % 1;
              if (zaehneModulu != 0) {
                return 'Die Zähne müssen eine ganze Zahl sein'.hc;
              }
              if (zaehne <= 0) {
                return 'Die Zähne müssen größer als 0 sein'.hc;
              }

              return null;
            },
            onChanged: onChangeZaehne,
            labelPosition: NextCardFormFieldLabelPosition.left,
            readOnly: false,
            suffix: ExcludeFocus(
              child: AppButton.blank(
                label: 'Zähne'.hc,
                color: leadingUnitSystem == NutzenlayoutUnitSystem.teeth
                    ? Colors.blue
                    : Colors.grey,
                onPressed: () {
                  final currentDrucklaenge = ref
                      .read(nutzenLayoutMetricsStateProvider(sessionId))
                      .drucklaenge;
                  final zaehne = currentDrucklaenge.mmToTeeth();

                  final zaehneModulu = zaehne % 1;
                  if (zaehneModulu != 0) {
                    zaehneController.text = '';
                    inchController.text = '';
                    drucklaengeController.text = '';
                    ref
                        .read(
                          nutzenLayoutMetricsStateProvider(sessionId).notifier,
                        )
                        .updateDrucklaenge(0);
                  }
                  ref
                      .read(
                        nutzenLayoutMetricsStateProvider(sessionId).notifier,
                      )
                      .updateUnitSystem(
                        NutzenlayoutUnitSystem.teeth,
                      );
                  zaehneFocusNode.requestFocus();
                },
              ),
            ),
          ),
          NextCardFormField.double(
            autovalidateMode: AutovalidateMode.disabled,
            focusNode: mmFocusNode,
            label: ''.hc,
            showLabel: false,
            fractionsWhenDoubleDouble: 3,
            controller: drucklaengeController,
            borderColor: leadingUnitSystem == NutzenlayoutUnitSystem.millimeter
                ? null
                : inactiveBorderColor,
            labelPosition: NextCardFormFieldLabelPosition.left,
            hideCopyButton: true,
            hideClearButton: true,
            readOnly: false,
            focusOrder: 2.2,
            validationGroup: null,
            onChanged: onChangeDrucklaenge,
            textColor: leadingUnitSystem == NutzenlayoutUnitSystem.millimeter
                ? null
                : appTheme.textFieldProperties.disabledForegroundColor,
            validator: (v) {
              final drucklaenge = ref
                  .read(nutzenLayoutMetricsStateProvider(sessionId))
                  .drucklaenge;

              if (drucklaenge <= 0) {
                return 'Die Drucklänge muss größer als 0 sein'.hc;
              }

              return null;
            },
            suffix: ExcludeFocus(
              child: AppButton.blank(
                label: 'mm'.hc,
                color: leadingUnitSystem == NutzenlayoutUnitSystem.millimeter
                    ? context.appTheme.generalColors.primary
                    : suffixColor,
                onPressed: () {
                  zaehneErrorNotifier.value = null;
                  ref
                      .read(
                        nutzenLayoutMetricsStateProvider(sessionId).notifier,
                      )
                      .updateUnitSystem(
                        NutzenlayoutUnitSystem.millimeter,
                      );
                  mmFocusNode.requestFocus();
                },
              ),
            ),
          ),
          NextCardFormField.double(
            autovalidateMode: AutovalidateMode.disabled,
            focusNode: inchFocusNode,
            label: ''.hc,
            showLabel: false,
            controller: inchController,
            fractionsWhenDoubleDouble: 3,
            labelPosition: NextCardFormFieldLabelPosition.left,
            readOnly: false,
            focusOrder: 2.3,
            hideCopyButton: true,
            hideClearButton: true,
            validationGroup: null,
            textColor: leadingUnitSystem == NutzenlayoutUnitSystem.inch
                ? null
                : appTheme.textFieldProperties.disabledForegroundColor,
            borderColor: leadingUnitSystem == NutzenlayoutUnitSystem.inch
                ? null
                : inactiveBorderColor,
            onChanged: onInchChanged,
            validator: (v) {
              final drucklaenge = ref
                  .read(nutzenLayoutMetricsStateProvider(sessionId))
                  .drucklaenge;

              if (drucklaenge <= 0) {
                return 'Die Drucklänge muss größer als 0 sein'.hc;
              }

              return null;
            },
            suffix: ExcludeFocus(
              child: AppButton.blank(
                label: 'Zoll'.hc,
                color: leadingUnitSystem == NutzenlayoutUnitSystem.inch
                    ? context.appTheme.generalColors.primary
                    : suffixColor,
                onPressed: () {
                  zaehneErrorNotifier.value = null;
                  ref
                      .read(
                        nutzenLayoutMetricsStateProvider(sessionId).notifier,
                      )
                      .updateUnitSystem(
                        NutzenlayoutUnitSystem.inch,
                      );
                  inchFocusNode.requestFocus();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReihenNutzenProReihe extends ConsumerWidget {
  const _ReihenNutzenProReihe({
    required this.sessionId,
  });
  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metrics = ref.watch(
      nutzenLayoutMetricsStateProvider(sessionId),
    );
    return Column(
      children: [
        NextCardFormField.int(
          initialInt: metrics.reihenCount,
          labelPosition: NextCardFormFieldLabelPosition.left,
          readOnly: false,
          label: 'Spalten'.hc,
          validator: (v) {
            if (v == null) {
              return 'Bitte geben Sie eine gültige Anzahl an Spalten ein'.hc;
            }
            final asInt = int.tryParse(v);
            if (asInt == null) {
              return 'Bitte geben Sie eine gültige Anzahl an Spalten ein'.hc;
            }
            if (asInt <= 0) {
              return 'Die Anzahl der Spalten muss größer als 0 sein'.hc;
            }
            return null;
          },
          validationGroup: null,
          onChanged: (v) {
            final asInt = int.tryParse(v);
            if (asInt == null) return;
            ref
                .read(
                  nutzenLayoutMetricsStateProvider(
                    sessionId,
                  ).notifier,
                )
                .updateReihenCount(asInt);
          },
          focusOrder: 3,
        ),
        NextCardFormField.int(
          initialInt: metrics.nutzenProReihe,
          labelPosition: NextCardFormFieldLabelPosition.left,
          readOnly: false,
          label: 'Nutzen / Spalte'.hc,
          validator: (v) {
            if (v == null) {
              return 'Bitte geben Sie eine gültige Anzahl an Nutzen pro Spalte ein'
                  .hc;
            }
            final asInt = int.tryParse(v);
            if (asInt == null) {
              return 'Bitte geben Sie eine gültige Anzahl an Nutzen pro Spalte ein'
                  .hc;
            }
            if (asInt <= 0) {
              return 'Die Anzahl der Nutzen pro Spalte muss größer als 0 sein'
                  .hc;
            }
            return null;
          },
          validationGroup: null,
          focusOrder: 3.2,
          onChanged: (v) {
            final asInt = int.tryParse(v);
            if (asInt == null) return;
            ref
                .read(
                  nutzenLayoutMetricsStateProvider(
                    sessionId,
                  ).notifier,
                )
                .updateNutzenProReihe(asInt);
          },
        ),
      ],
    );
  }
}

class _LaufrichtungGap extends ConsumerWidget {
  const _LaufrichtungGap({
    required this.sessionId,
  });
  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metrics = ref.watch(
      nutzenLayoutMetricsStateProvider(sessionId),
    );

    final suffixColor =
        context.appTheme.generalColors.onBackground.withAppOpacity(0.5);

    return Column(
      children: [
        Padding(
          padding: UiConstants.cardFieldPadding,
          child: Row(
            children: [
              SizedBox(
                width: UiConstants.leftLabelWidth,
                child: NextAppFieldLeftLabel(
                  label: 'Laufrichtung'.hc,
                  maxLines: 1,
                ),
              ),
              Expanded(
                child: NutzenlayoutLaufrichtungButton(
                  focusOrderId: 4,
                  readOnly: false,
                  selectedLaufrichtung: metrics.laufrichtung,
                  onSelected: (v) {
                    ref
                        .read(
                          nutzenLayoutMetricsStateProvider(
                            sessionId,
                          ).notifier,
                        )
                        .updateLaufrichtung(v);
                  },
                ),
              ),
            ],
          ),
        ),
        NextCardFormField.double(
          fractionsWhenDoubleDouble: 3,
          initialDouble: metrics.gapH,
          labelPosition: NextCardFormFieldLabelPosition.left,
          readOnly: false,
          suffix: AppText(
            'mm'.hc,
            color: suffixColor,
          ),
          label: 'Gap H'.hc,
          validationGroup: null,
          focusOrder: 4.1,
          onChanged: (v) {
            final asDouble = Parser.parseDouble(v);
            if (asDouble == null) return;
            ref
                .read(
                  nutzenLayoutMetricsStateProvider(
                    sessionId,
                  ).notifier,
                )
                .updateGapH(asDouble);
          },
        ),
      ],
    );
  }
}
