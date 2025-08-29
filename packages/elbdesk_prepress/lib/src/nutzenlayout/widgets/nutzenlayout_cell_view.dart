import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/logic/multi_nutzenlayout_state.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/models/nutzenlayout_cell.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/widgets/nutzenlayout_laufrichtung_button.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NutzenLayoutCellView extends ConsumerWidget {
  const NutzenLayoutCellView({
    required this.cell,
    required this.cellIndex,
    required this.columnOffset,
    required this.availableArtworks,
    required this.navigatorKey,
    required this.columnIndex,
    required this.sessionId,
    required this.isExistingMultiNutzenlayout,
    super.key,
  });
  final NutzenlayoutCell cell;

  final int cellIndex;
  final double columnOffset;
  final List<Artwork>? availableArtworks;
  final GlobalKey<NavigatorState> navigatorKey;
  final int columnIndex;
  final String sessionId;
  final bool isExistingMultiNutzenlayout;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.l10n.localeName;
    final l10n = context.l10n;

    return ElbMouseRegionGestureDetector(
      enabled: availableArtworks != null,
      onTap: () async {
        await showElbDialog<void>(
          navigatorKey: navigatorKey,
          context: context,
          isDismissible: true,
          child: isExistingMultiNutzenlayout
              ? _EditCellDialogExistingMultiNutzenlayout(
                  availableArtworks: availableArtworks!,
                  cellArtworkId: cell.artworkId,
                  columnIndex: columnIndex,
                  cellIndex: cellIndex,
                  cellGapHorizontal: cell.gapHorizontal,
                  sessionId: sessionId,
                  initialLaufrichtung: cell.laufrichtung,
                  cellWidth: cell.width,
                  cellHeight: cell.height,
                )
              : _EditCellDialog(
                  availableArtworks: availableArtworks!,
                  cellArtworkId: cell.artworkId!,
                  columnIndex: columnIndex,
                  cellIndex: cellIndex,
                  sessionId: sessionId,
                  initialLaufrichtung: cell.laufrichtung,
                  cellGapHorizontal: cell.gapHorizontal,
                ),
        );
      },
      child: SizedBox(
        width: cell.cellWidth,
        height: cell.cellHeight,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: cell.cellWidth,
              height: cell.cellHeight,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Center(
                child: FittedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.rotate(
                        angle: cell.laufrichtung.angle * (math.pi / 180),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const ElbIcon(
                              Icons.man,
                              color: Colors.red,
                              size: AppIconSize.xl,
                            ),
                            AppText(
                              cell.laufrichtung.shortReadable(l10n),
                              color: Colors.red,
                              autoSize: false,
                              fontSize: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (cell.width > 30 && cell.height > 30)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.black.withAppOpacity(0.6),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                    ),
                  ),
                  child: Text(
                    cell.shortDimensions(locale),
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            if (cell.artworkId != null && availableArtworks != null)
              _ArtworkBadge(
                availableArtworks: availableArtworks!,
                cellArtworkId: cell.artworkId!,
              ),
          ],
        ),
      ),
    );
  }
}

class _EditCellDialog extends HookConsumerWidget {
  const _EditCellDialog({
    required this.availableArtworks,
    required this.cellArtworkId,
    required this.columnIndex,
    required this.cellIndex,
    required this.sessionId,
    required this.initialLaufrichtung,
    required this.cellGapHorizontal,
  });
  final List<Artwork> availableArtworks;
  final int cellArtworkId;
  final int columnIndex;
  final int cellIndex;
  final String sessionId;
  final double cellGapHorizontal;
  final NutzenlayoutLaufrichtung initialLaufrichtung;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLaufrichtung = useState<NutzenlayoutLaufrichtung>(
      initialLaufrichtung,
    );
    final selectedArtwork = useState<Artwork>(
      availableArtworks.where((element) => element.id == cellArtworkId).first,
    );

    final gapHorizontal = useState<double>(cellGapHorizontal);

    return ElbAlertDialog(
      onSaveAndCloseShortcut: () {
        ref.read(multiNutzenLayoutStateProvider(sessionId).notifier).updateCell(
              columnIndex,
              cellIndex,
              selectedArtwork.value,
              selectedLaufrichtung.value,
              gapHorizontal.value,
            );
        Navigator.of(context).pop();
      },
      actions: [
        AppButton.primary(
          onPressed: () {
            ref
                .read(multiNutzenLayoutStateProvider(sessionId).notifier)
                .updateCell(
                  columnIndex,
                  cellIndex,
                  selectedArtwork.value,
                  selectedLaufrichtung.value,
                  gapHorizontal.value,
                );
            Navigator.of(context).pop();
          },
          label: 'Speichern'.hc,
        ),
      ],
      onCancel: () {
        Navigator.of(context).pop();
      },
      titleText: 'Zelle bearbeiten'.hc,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final (index, artwork) in availableArtworks.indexed)
            ElbListTile(
              leading: IgnorePointer(
                ignoring: true,
                child: artwork.id == selectedArtwork.value.id
                    ? const AppCheckbox(value: true, onChanged: null)
                    : const AppCheckbox(value: false, onChanged: null),
              ),
              onPressed: () {
                selectedArtwork.value = artwork;
              },
              titleText:
                  '${index + 1}: ${artwork.fullArtworkIdWithProduct(artwork.product!)}',
            ),
          const SizedBox(height: UiConstants.elementMargin),
          Row(
            children: [
              SizedBox(
                width: UiConstants.leftLabelWidth,
                child: AppText('Rotation'.hc),
              ),
              Expanded(
                child: NutzenlayoutLaufrichtungButton(
                  readOnly: false,
                  selectedLaufrichtung: selectedLaufrichtung.value,
                  onSelected: (v) {
                    selectedLaufrichtung.value = v;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: UiConstants.elementMargin),
          NextCardFormField.double(
            allowNegative: true,
            labelPosition: NextCardFormFieldLabelPosition.left,
            emptyWhenZero: false,
            readOnly: false,
            label: 'Gap H'.hc,
            validationGroup: '',
            initialDouble: cellGapHorizontal,
            onChanged: (v) {
              final asDouble = Parser.parseDouble(v);
              if (asDouble != null) {
                gapHorizontal.value = asDouble;
              }
            },
          ),
        ],
      ),
    );
  }
}

class _EditCellDialogExistingMultiNutzenlayout extends HookConsumerWidget {
  const _EditCellDialogExistingMultiNutzenlayout({
    required this.availableArtworks,
    required this.cellArtworkId,
    required this.columnIndex,
    required this.cellIndex,
    required this.sessionId,
    required this.cellGapHorizontal,
    required this.initialLaufrichtung,
    required this.cellWidth,
    required this.cellHeight,
  });
  final List<Artwork> availableArtworks;
  final int? cellArtworkId;
  final int columnIndex;
  final int cellIndex;
  final String sessionId;
  final NutzenlayoutLaufrichtung initialLaufrichtung;
  final double cellWidth;
  final double cellHeight;
  final double cellGapHorizontal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLaufrichtung = useState<NutzenlayoutLaufrichtung>(
      initialLaufrichtung,
    );
    final gapHorizontal = useState<double>(cellGapHorizontal);
    final selectableArtworks = useMemoized(
      () => availableArtworks
          .where(
            (element) =>
                element.width == cellWidth && element.height == cellHeight,
          )
          .toList(),
      [availableArtworks],
    );
    final selectedArtwork = useState<Artwork?>(
      selectableArtworks.firstWhereOrNull(
        (element) => element.id == cellArtworkId,
      ),
    );
    int getIndexFromArtworkId(int artworkId) {
      return availableArtworks.indexWhere((element) => element.id == artworkId);
    }

    return ElbAlertDialog(
      onSaveAndCloseShortcut: () {
        if (selectedArtwork.value == null) return;
        ref.read(multiNutzenLayoutStateProvider(sessionId).notifier).updateCell(
              columnIndex,
              cellIndex,
              selectedArtwork.value!,
              selectedLaufrichtung.value,
              gapHorizontal.value,
            );
        Navigator.of(context).pop();
      },
      actions: [
        AppButton.primary(
          onPressed: selectedArtwork.value == null
              ? null
              : () {
                  ref
                      .read(multiNutzenLayoutStateProvider(sessionId).notifier)
                      .updateCell(
                        columnIndex,
                        cellIndex,
                        selectedArtwork.value!,
                        selectedLaufrichtung.value,
                        gapHorizontal.value,
                      );
                  Navigator.of(context).pop();
                },
          label: 'Speichern'.hc,
        ),
      ],
      onCancel: () {
        Navigator.of(context).pop();
      },
      titleText: 'Zelle bearbeiten'.hc,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final artwork in selectableArtworks)
            ElbListTile(
              leading: IgnorePointer(
                ignoring: true,
                child: artwork.id == selectedArtwork.value?.id
                    ? const AppCheckbox(value: true, onChanged: null)
                    : const AppCheckbox(value: false, onChanged: null),
              ),
              onPressed: () {
                selectedArtwork.value = artwork;
              },
              titleText:
                  '${getIndexFromArtworkId(artwork.meta.id!) + 1}: ${artwork.fullArtworkIdWithProduct(artwork.product!)}',
            ),
          Row(
            children: [
              AppText('Rotation'.hc),
              const SizedBox(width: UiConstants.elementMargin),
              Expanded(
                child: NutzenlayoutLaufrichtungButton(
                  readOnly: true,
                  selectedLaufrichtung: selectedLaufrichtung.value,
                  onSelected: (v) {
                    selectedLaufrichtung.value = v;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ArtworkBadge extends StatelessWidget {
  const _ArtworkBadge({
    required this.availableArtworks,
    required this.cellArtworkId,
  });
  final List<Artwork> availableArtworks;
  final int cellArtworkId;

  @override
  Widget build(BuildContext context) {
    final position = availableArtworks.indexWhere(
          (element) => element.id == cellArtworkId,
        ) +
        1;
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.black.withAppOpacity(0.6),
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(4),
          ),
        ),
        child: Text(
          '$position',
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
