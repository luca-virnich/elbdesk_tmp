import 'package:collection/collection.dart';
import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/logic/multi_nutzenlayout_state.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/logic/nutzenlayout_utils.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/models/nutzenlayout_column.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/models/nutzenlayout_metrics.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/widgets/nutzenlayout_laufrichtung_button.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NutzenlayoutMatrixListView extends HookConsumerWidget {
  const NutzenlayoutMatrixListView({
    required this.nutzenlayout,
    required this.formType,
    this.sessionId,
    this.navigatorKey,
    this.isEditable = false,
    this.availableArtworks,
    this.isExistingMultiNutzenlayout = false,
    super.key,
  }) : assert(
          !isEditable || (sessionId != null && navigatorKey != null),
          'When isEditable is true, sessionId and navigatorKey must not be null',
        );
  final Nutzenlayout nutzenlayout;
  final String? sessionId;
  final GlobalKey<NavigatorState>? navigatorKey;
  final bool isEditable;
  final NutzenlayoutFormType formType;
  final List<Artwork>? availableArtworks;
  final bool isExistingMultiNutzenlayout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final verticalScrollController = useScrollController();
    final drucklaenge = nutzenlayout.drucklaenge;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            CardSectionTitle(
              title: '${drucklaenge.mmToTeeth().formatted(
                        locale,
                        fractionsWhenDoubleDouble: 3,
                      )} Zähne / Drucklänge: ${drucklaenge.formatted(
                locale,
                fractionsWhenDoubleDouble: 3,
              )} mm / ${drucklaenge.mmToInch().formatted(
                        locale,
                        fractionsWhenDoubleDouble: 3,
                      )} Zoll'
                  .hc,
              trailingWidgets: const [],
            ),
            Expanded(
              child: AppScrollbar(
                controller: verticalScrollController,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  controller: verticalScrollController,
                  child: Column(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth,
                        child: DataTable(
                          horizontalMargin: 0,
                          columnSpacing: AppSpace.s,
                          columns: [
                            DataColumn(
                              label: AppText(
                                'Spalte'.hc,
                                autoSize: false,
                                maxLines: 1,
                              ),
                              headingRowAlignment: MainAxisAlignment.center,
                              columnWidth: const FlexColumnWidth(8),
                            ),
                            DataColumn(
                              label: AppText(
                                'Nutzen'.hc,
                                autoSize: false,
                                maxLines: 1,
                              ),
                              headingRowAlignment: MainAxisAlignment.center,
                              columnWidth: const FlexColumnWidth(8),
                            ),
                            DataColumn(
                              label: AppText(
                                'Gap H'.hc,
                                autoSize: false,
                                maxLines: 1,
                              ),
                              headingRowAlignment: MainAxisAlignment.center,
                              columnWidth: const FlexColumnWidth(10),
                            ),
                            DataColumn(
                              label: AppText(
                                'Gap V'.hc,
                                autoSize: false,
                                maxLines: 1,
                              ),
                              headingRowAlignment: MainAxisAlignment.center,
                              columnWidth: const FlexColumnWidth(10),
                            ),
                            DataColumn(
                              label: AppText(
                                'Offset'.hc,
                                autoSize: false,
                                maxLines: 1,
                              ),
                              headingRowAlignment: MainAxisAlignment.center,
                              columnWidth: const FlexColumnWidth(10),
                            ),
                            DataColumn(
                              label: AppText(
                                'Laufrichtung'.hc,
                                autoSize: false,
                                maxLines: 1,
                              ),
                              headingRowAlignment: MainAxisAlignment.center,
                              columnWidth: const FlexColumnWidth(15),
                            ),
                            if (isEditable &&
                                sessionId != null &&
                                navigatorKey != null)
                              const DataColumn(
                                headingRowAlignment: MainAxisAlignment.center,
                                columnWidth: FixedColumnWidth(50),
                                label: SizedBox.shrink(),
                              ),
                          ],
                          rows: nutzenlayout.columns.indexed.map((column) {
                            final index = column.$1;
                            final row = column.$2;
                            return DataRow(
                              cells: [
                                DataCell(
                                  Center(
                                    child: AppText(
                                      (index + 1).toString(),
                                      autoSize: false,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: AppText(
                                      row.cells.length.toString(),
                                      autoSize: false,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: AppText(
                                      // '${row.gapHorizontal.formatted(l10n.localeName)} mm',
                                      row.gapHReadable(l10n),
                                      autoSize: false,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: AppText(
                                      '${row.gapVertical(drucklaenge).formatted(l10n.localeName)} mm',
                                      autoSize: false,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: AppText(
                                      '${row.offset.formatted(l10n.localeName)} mm',
                                      autoSize: false,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: AppText(
                                      row.laufrichtung.readable(l10n),
                                      autoSize: false,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                if (isEditable &&
                                    sessionId != null &&
                                    navigatorKey != null)
                                  DataCell(
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Consumer(
                                        builder: (context, ref, child) {
                                          return AppIconButton.secondary(
                                            icon: const Icon(AppIcons.edit),
                                            color: context.appTheme.buttonStyles
                                                .secondary.foregroundColor,
                                            colorOnHover: context
                                                .appTheme.generalColors.primary,
                                            overlayColor: context.appTheme
                                                .generalColors.transparent,
                                            tooltip: 'Spalte bearbeiten'.hc,
                                            onPressed: () async {
                                              final result =
                                                  await showElbDialog<
                                                      NutzenlayoutEditValues?>(
                                                navigatorKey: navigatorKey,
                                                context: context,
                                                isDismissible: true,
                                                child: isExistingMultiNutzenlayout
                                                    ? _EditExistingMultiNutzenlayoutColumnDialog(
                                                        column: row,
                                                        index: index,
                                                        sessionId: sessionId!,
                                                        drucklaenge:
                                                            drucklaenge,
                                                        formType: formType,
                                                        availableArtworks:
                                                            availableArtworks,
                                                        nutzenlayout:
                                                            nutzenlayout,
                                                      )
                                                    : _EditColumnDialog(
                                                        column: row,
                                                        index: index,
                                                        sessionId: sessionId!,
                                                        drucklaenge:
                                                            drucklaenge,
                                                        formType: formType,
                                                        availableArtworks:
                                                            availableArtworks,
                                                        nutzenlayout:
                                                            nutzenlayout,
                                                      ),
                                              );

                                              if (result != null) {
                                                if (formType ==
                                                    NutzenlayoutFormType
                                                        .einzelform) {
                                                  ref
                                                      .read(
                                                        singleNutzenLayoutStateProvider(
                                                          sessionId!,
                                                        ).notifier,
                                                      )
                                                      .updateColumn(
                                                        index,
                                                        result,
                                                      );
                                                } else {
                                                  ref
                                                      .read(
                                                        multiNutzenLayoutStateProvider(
                                                          sessionId!,
                                                        ).notifier,
                                                      )
                                                      .updateColumn(
                                                        index,
                                                        result,
                                                      );
                                                }
                                              }
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                      if (isEditable &&
                          sessionId != null &&
                          navigatorKey != null &&
                          !isExistingMultiNutzenlayout) ...[
                        const SizedBox(height: UiConstants.elementMargin),
                        Row(
                          children: [
                            AppButton.secondary(
                              label: 'Spalte hinzufügen'.hc,
                              onPressed: () {
                                if (formType ==
                                    NutzenlayoutFormType.einzelform) {
                                  ref
                                      .read(
                                        singleNutzenLayoutStateProvider(
                                          sessionId!,
                                        ).notifier,
                                      )
                                      .addColumn();
                                } else {
                                  ref
                                      .read(
                                        multiNutzenLayoutStateProvider(
                                          sessionId!,
                                        ).notifier,
                                      )
                                      .addColumn();
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// class _DrucklaengeEditDialog extends HookConsumerWidget {
//   const _DrucklaengeEditDialog({
//     required this.sessionId,
//     required this.drucklaenge,
//     required this.nutzenlayout,
//   });
//   final String sessionId;
//   final double drucklaenge;
//   final Nutzenlayout nutzenlayout;

//   static const double factor = 3.175;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final drucklaengeNotifier = useState<double>(drucklaenge);

//     final drucklaengeController =
//         useTextEditingController(text: drucklaenge.toString());
//     final zaehneController = useTextEditingController(
//       text: (drucklaenge / 3.175).toStringAsFixed(0),
//     );
//     final zaehneErrorNotifier = useValueNotifier<String?>(null);

//     final onSave = useCallback(
//       () {
//         if (drucklaengeNotifier.value == 0) {
//           return;
//         }
//         if (zaehneErrorNotifier.value != null) {
//           return;
//         }

//         // get the height of each Spalte, we need all the cells
//         final heights = <double>[];
//         for (final column in nutzenlayout.columns) {
//           final sumOfColumnHeights = column.cells.fold<double>(0, (sum, cell) {
//             return sum + cell.height;
//           });
//           final withOffset = sumOfColumnHeights + column.offset;
//           heights.add(withOffset);
//         }

//         // get the highest height
//         final highestHeight = heights.reduce((a, b) => a > b ? a : b);
//         if (highestHeight > drucklaengeNotifier.value) {
//           AppNotificationOverlay.error(
//             context,
//             'Die Drucklänge ist kleiner als die Summe der Spaltenhöhen'.hc,
//           );
//           return;
//         }

//         Navigator.pop(context, drucklaengeNotifier.value);
//       },
//       [],
//     );
//     void onChangeDrucklaenge(String v) {
//       final localDrucklaenge = Parser.parseDouble(v);
//       drucklaengeNotifier.value = localDrucklaenge ?? 0;
//       if (localDrucklaenge == null) {
//         zaehneController.text = '';
//       } else {
//         final zaehne = localDrucklaenge / factor;
//         final zaehneModulu = zaehne % 1;
//         if (zaehneModulu != 0) {
//           zaehneErrorNotifier.value =
//               'Die Zähne müssen eine ganze Zahl sein'.hc;
//           zaehneController.text = zaehne.toStringAsFixed(3);
//         } else {
//           zaehneErrorNotifier.value = null;
//           zaehneController.text = zaehne.toStringAsFixed(0);
//         }
//       }
//     }

//     void onChangeZaehne(String v) {
//       final localZaehne = int.tryParse(v);
//       if (localZaehne == null) {
//         drucklaengeController.text = '';
//         drucklaengeNotifier.value = 0;
//       } else {
//         zaehneErrorNotifier.value = null;
//         drucklaengeController.text = (localZaehne * factor).toStringAsFixed(3);
//         drucklaengeNotifier.value = localZaehne * factor;
//       }
//     }

//     return FocusScope(
//       autofocus: true,
//       child: Shortcuts(
//         shortcuts: {
//           saveAndCloseWindowShortcutMeta: const SaveAndCloseWindowIntent(),
//           saveAndCloseWindowShortcutControl: const SaveAndCloseWindowIntent(),
//         },
//         child: Actions(
//           actions: {
//             SaveAndCloseWindowIntent: CallbackAction<SaveAndCloseWindowIntent>(
//               onInvoke: (intent) async {
//                 onSave();
//                 return null;
//               },
//             ),
//           },
//           child: AppDialogBody(
//             titleText: 'Drucklänge bearbeiten'.hc,
//             onCancel: () {
//               Navigator.pop(context);
//             },
//             actions: [
//               AppButton.primary(
//                 onPressed: drucklaengeNotifier.value == 0 ||
//                         zaehneErrorNotifier.value != null
//                     ? null
//                     : onSave,
//                 label: 'Speichern'.hc,
//               ),
//             ],
//             child: Row(
//               children: [
//                 Expanded(
//                   child: NextCardFormField.double(
//                     selectAllOnFocus: true,
//                     fractionsWhenDoubleDouble: 3,
//                     label: 'Drucklänge'.hc,
//                     autofocus: true,
//                     labelPosition: NextCardFormFieldLabelPosition.top,
//                     readOnly: false,
//                     controller: drucklaengeController,
//                     suffix: const AppText(
//                       'mm',
//                       color: Colors.grey,
//                     ),
//                     onChanged: onChangeDrucklaenge,
//                     validationGroup: null,
//                   ),
//                 ),
//                 const SizedBox(width: UiConstants.elementMargin),
//                 Expanded(
//                   child: NextCardFormField.int(
//                     label: 'Zähne'.hc,
//                     controller: zaehneController,
//                     labelPosition: NextCardFormFieldLabelPosition.top,
//                     readOnly: false,
//                     customErrorMessageNotifier: zaehneErrorNotifier,
//                     suffix: const AppText(
//                       'Zähne',
//                       color: Colors.grey,
//                     ),
//                     onChanged: onChangeZaehne,
//                     validationGroup: null,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class _EditColumnDialog extends HookConsumerWidget {
  const _EditColumnDialog({
    required this.column,
    required this.index,
    required this.sessionId,
    required this.drucklaenge,
    required this.formType,
    required this.availableArtworks,
    required this.nutzenlayout,
  });
  final NutzenlayoutColumn column;
  final int index;
  final String sessionId;
  final double drucklaenge;
  final NutzenlayoutFormType formType;
  final List<Artwork>? availableArtworks;
  final Nutzenlayout nutzenlayout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final areCellArtworkIdsInColumnAllTheSame = column.cells
        .every((element) => element.artworkId == column.cells.first.artworkId);
    final selectedArtworkId = useState<Artwork?>(
      areCellArtworkIdsInColumnAllTheSame
          ? availableArtworks?.firstWhere(
              (element) => element.id == column.cells.first.artworkId,
            )
          : null,
    );

    final r = useRef(column);
    final initalRotation = useMemoized<NutzenlayoutLaufrichtung>(
      () {
        return column.laufrichtung;
      },
      [],
    );

    final currentRotation = useState<NutzenlayoutLaufrichtung>(initalRotation);
    final formKey = useFormKey();

    final cells = useRef<int>(column.cells.length);
    final rotationFocus = useFocusNode();

    final onSave = useCallback(
      () {
        final isValid = formKey.currentState!.validate();
        if (!isValid) {
          return;
        } else {
          final initialRotation = column.cells.first.laufrichtung;

          final swapHeightAndWidth = NutzenlayoutUtils.shouldSwapDimensions(
            initialRotation: initialRotation,
            targetRotation: currentRotation.value,
          );

          final firstCell = column.cells.first;
          final cellheight =
              swapHeightAndWidth ? firstCell.width : firstCell.height;

          final heightOfAllCells = cellheight * cells.value;

          final reiheGapV = NutzenlayoutUtils.calculateGapH(
            drucklaenge,
            column.cells.length,
            cellheight,
          );

          // return;
          if (heightOfAllCells + reiheGapV > drucklaenge) {
            AppNotificationOverlay.error(
              context,
              'Die Spalte passt nicht in die Drucklänge'.hc,
            );
            return;
          }

          Navigator.pop(
            context,
            NutzenlayoutEditValues(
              gapH: r.value.gapH,
              cells: cells.value,
              laufrichtung: currentRotation.value,
              offset: r.value.offset,
              artwork: selectedArtworkId.value,
              kuerzung: 0,
            ),
          );
        }
      },
      [],
    );

    return Form(
      key: formKey,
      child: ElbAlertDialog(
        onSaveAndCloseShortcut: onSave,
        titleText: 'Spalte ${index + 1} bearbeiten'.hc,
        actions: [
          if (index != 0)
            AppButton.danger(
              onPressed: () {
                if (nutzenlayout.columns.length == 1) {
                  AppNotificationOverlay.error(
                    context,
                    'Es muss mindestens eine Spalte vorhanden sein'.hc,
                  );
                  return;
                }
                if (formType == NutzenlayoutFormType.einzelform) {
                  ref
                      .read(
                        singleNutzenLayoutStateProvider(sessionId).notifier,
                      )
                      .deleteColumn(index);
                } else {
                  ref
                      .read(
                        multiNutzenLayoutStateProvider(sessionId).notifier,
                      )
                      .deleteColumn(index);
                }
                Navigator.pop(context);
              },
              label: 'Löschen'.hc,
            ),
          AppButton.primary(
            onPressed: onSave,
            label: 'Anwenden'.hc,
          ),
        ],
        onCancel: () {
          Navigator.pop(context);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (availableArtworks != null)
              for (final (index, artwork) in availableArtworks!.indexed)
                ElbListTile(
                  leading: IgnorePointer(
                    ignoring: true,
                    child: artwork.id == selectedArtworkId.value?.id
                        ? const AppCheckbox(value: true, onChanged: null)
                        : const AppCheckbox(
                            value: false,
                            onChanged: null,
                          ),
                  ),
                  onPressed: () {
                    selectedArtworkId.value = artwork;
                  },
                  titleText:
                      '${index + 1}: ${artwork.fullArtworkIdWithProduct(artwork.product!)}',
                ),
            Row(
              children: [
                Expanded(
                  child: NextCardFormField.double(
                    emptyWhenZero: false,
                    validationGroup: null,
                    label: 'Offset'.hc,
                    labelPosition: NextCardFormFieldLabelPosition.top,
                    readOnly: false,
                    initialDouble: r.value.offset,
                    onChanged: (v) {
                      final asDouble = Parser.parseDouble(v);
                      if (asDouble != null) {
                        r.value = r.value.copyWith(offset: asDouble);
                      }
                    },
                    suffix: const AppText(
                      'mm',
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(width: UiConstants.elementMargin),
                Expanded(
                  child: NextCardFormField.int(
                    validator: (v) {
                      if (v == null) {
                        return 'Bitte geben Sie eine gültige Anzahl an Nutzen ein'
                            .hc;
                      }
                      final asInt = int.tryParse(v);
                      if (asInt == null) {
                        return 'Bitte geben Sie eine gültige Anzahl an Nutzen ein'
                            .hc;
                      }
                      if (asInt <= 0) {
                        return 'Die Anzahl der Nutzen muss größer als 0 sein'
                            .hc;
                      }
                      return null;
                    },
                    emptyWhenZero: false,
                    validationGroup: null,
                    label: 'Nutzen'.hc,
                    labelPosition: NextCardFormFieldLabelPosition.top,
                    readOnly: false,
                    initialInt: r.value.cells.length,
                    onChanged: (v) {
                      final asInt = int.tryParse(v);
                      if (asInt != null) {
                        cells.value = asInt;
                      }
                    },
                  ),
                ),
              ],
            ),
            if (column.gapH != null)
              Row(
                children: [
                  Expanded(
                    child: NextCardFormField.double(
                      allowNegative: index != 0,
                      emptyWhenZero: false,
                      validationGroup: null,
                      label: 'Gap Horizontal'.hc,
                      labelPosition: NextCardFormFieldLabelPosition.top,
                      readOnly: false,
                      initialDouble: column.gapH ?? 0,
                      onChanged: (v) {
                        final asDouble = Parser.parseDouble(v);
                        if (asDouble != null) {
                          r.value = r.value.copyWith(
                            cells: r.value.cells
                                .map(
                                  (cell) => cell.copyWith(
                                    gapHorizontal: asDouble,
                                  ),
                                )
                                .toList(),
                          );
                        }
                      },
                      suffix: const AppText(
                        'mm',
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(width: UiConstants.elementMargin),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppText('Rotation'.hc),
                        NutzenlayoutLaufrichtungButton(
                          rotationFocus: rotationFocus,
                          readOnly: false,
                          selectedLaufrichtung: currentRotation.value,
                          onSelected: (v) {
                            currentRotation.value = v;
                            rotationFocus.nextFocus();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _EditExistingMultiNutzenlayoutColumnDialog extends HookConsumerWidget {
  const _EditExistingMultiNutzenlayoutColumnDialog({
    required this.column,
    required this.index,
    required this.sessionId,
    required this.drucklaenge,
    required this.formType,
    required this.availableArtworks,
    required this.nutzenlayout,
  });
  final NutzenlayoutColumn column;
  final int index;
  final String sessionId;
  final double drucklaenge;
  final NutzenlayoutFormType formType;
  final List<Artwork>? availableArtworks;
  final Nutzenlayout nutzenlayout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final areCellArtworkIdsInColumnAllTheSame = column.cells
        .every((element) => element.artworkId == column.cells.first.artworkId);

    final areCellDimensionsInColumnAllTheSame = column.cells.every(
      (element) =>
          element.width == column.cells.first.width &&
          element.height == column.cells.first.height,
    );

    final selectedArtworkId = useState<Artwork?>(
      areCellArtworkIdsInColumnAllTheSame
          ? availableArtworks?.firstWhereOrNull(
              (element) => element.id == column.cells.first.artworkId,
            )
          : null,
    );

    final selectableArtworks = useMemoized(
      () {
        if (areCellDimensionsInColumnAllTheSame) {
          return availableArtworks
              ?.where(
                (element) =>
                    element.width == column.cells.first.width &&
                    element.height == column.cells.first.height,
              )
              .toList();
        } else {
          return <Artwork>[];
        }
      },
      [
        areCellDimensionsInColumnAllTheSame,
        availableArtworks,
        selectedArtworkId.value,
      ],
    );

    final r = useRef(column);
    final initalRotation = useMemoized<NutzenlayoutLaufrichtung>(
      () {
        return column.laufrichtung;
      },
      [],
    );

    final currentRotation = useState<NutzenlayoutLaufrichtung>(initalRotation);
    final formKey = useFormKey();

    final cells = useRef<int>(column.cells.length);
    final rotationFocus = useFocusNode();

    final onSave = useCallback(
      () {
        final isValid = formKey.currentState!.validate();
        if (!isValid) {
          return;
        } else {
          final initialRotation = column.cells.first.laufrichtung;

          final swapHeightAndWidth = NutzenlayoutUtils.shouldSwapDimensions(
            initialRotation: initialRotation,
            targetRotation: currentRotation.value,
          );

          final firstCell = column.cells.first;
          final cellheight =
              swapHeightAndWidth ? firstCell.width : firstCell.height;

          final heightOfAllCells = cellheight * cells.value;

          final reiheGapV = NutzenlayoutUtils.calculateGapH(
            drucklaenge,
            column.cells.length,
            cellheight,
          );

          // return;
          if (heightOfAllCells + reiheGapV > drucklaenge) {
            AppNotificationOverlay.error(
              context,
              'Die Spalte passt nicht in die Drucklänge'.hc,
            );
            return;
          }

          Navigator.pop(
            context,
            NutzenlayoutEditValues(
              // TODO: gap H
              gapH: 0,
              cells: cells.value,
              laufrichtung: currentRotation.value,
              offset: r.value.offset,
              artwork: selectedArtworkId.value,
              kuerzung: 0,
            ),
          );
        }
      },
      [],
    );

    int getIndexFromArtworkId(int artworkId) {
      return availableArtworks!
          .indexWhere((element) => element.id == artworkId);
    }

    return Form(
      key: formKey,
      child: ElbAlertDialog(
        onSaveAndCloseShortcut: onSave,
        titleText: 'Spalte ${index + 1} bearbeiten'.hc,
        actions: [
          AppButton.primary(
            onPressed: onSave,
            label: 'Anwenden'.hc,
          ),
        ],
        onCancel: () {
          Navigator.pop(context);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (selectableArtworks != null)
              for (final (artwork) in selectableArtworks)
                ElbListTile(
                  leading: IgnorePointer(
                    ignoring: true,
                    child: artwork.id == selectedArtworkId.value?.id
                        ? const AppCheckbox(value: true, onChanged: null)
                        : const AppCheckbox(
                            value: false,
                            onChanged: null,
                          ),
                  ),
                  onPressed: () {
                    selectedArtworkId.value = artwork;
                  },
                  titleText:
                      '${getIndexFromArtworkId(artwork.meta.id!) + 1}: ${artwork.fullArtworkIdWithProduct(artwork.product!)}',
                ),
            Row(
              children: [
                Expanded(
                  child: NextCardFormField.double(
                    emptyWhenZero: false,
                    validationGroup: null,
                    label: 'Offset'.hc,
                    labelPosition: NextCardFormFieldLabelPosition.top,
                    readOnly: true,
                    initialDouble: r.value.offset,
                    onChanged: (v) {
                      final asDouble = Parser.parseDouble(v);
                      if (asDouble != null) {
                        r.value = r.value.copyWith(offset: asDouble);
                      }
                    },
                    suffix: const AppText(
                      'mm',
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(width: UiConstants.elementMargin),
                Expanded(
                  child: NextCardFormField.int(
                    validator: (v) {
                      return null;
                    },
                    emptyWhenZero: false,
                    validationGroup: null,
                    label: 'Nutzen'.hc,
                    labelPosition: NextCardFormFieldLabelPosition.top,
                    readOnly: true,
                    initialInt: r.value.cells.length,
                    onChanged: (v) {
                      final asInt = int.tryParse(v);
                      if (asInt != null) {
                        cells.value = asInt;
                      }
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: NextCardFormField.double(
                    emptyWhenZero: false,
                    validationGroup: null,
                    label: 'Gap Horizontal'.hc,
                    labelPosition: NextCardFormFieldLabelPosition.top,
                    readOnly: true,
                    initialDouble: 0,
                    onChanged: (v) {},
                    suffix: const AppText(
                      'mm',
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(width: UiConstants.elementMargin),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText('Rotation'.hc),
                      NutzenlayoutLaufrichtungButton(
                        rotationFocus: rotationFocus,
                        readOnly: true,
                        selectedLaufrichtung: currentRotation.value,
                        onSelected: (v) {
                          currentRotation.value = v;
                          rotationFocus.nextFocus();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
