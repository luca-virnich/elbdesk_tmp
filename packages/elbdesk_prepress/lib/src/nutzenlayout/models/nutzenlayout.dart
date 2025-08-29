import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/models/nutzenlayout_column.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutzenlayout.freezed.dart';
part 'nutzenlayout.g.dart';

@freezed
class Nutzenlayout with _$Nutzenlayout, HasMetaData {
  const factory Nutzenlayout({
    required DataMeta meta,
    required String description,
    required double drucklaenge,
    required int? customerId,
    required double cellX,
    required double cellY,
    required List<NutzenlayoutColumn> columns,
    required NutzenlayoutFormType formType,
    required Set<NutzenlayoutArtworkDimensions> dimensions,
    required NutzenlayoutUnitSystem leadingUnitSystem,
    int? id,
  }) = _Nutzenlayout;

  const Nutzenlayout._();

  factory Nutzenlayout.fromJson(Map<String, dynamic> json) =>
      _$NutzenlayoutFromJson(json);

  factory Nutzenlayout.fromSingleDTO(NutzenlayoutDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);
    final dimensions = dto.dimensions.first;
    return Nutzenlayout(
      leadingUnitSystem: Parser.enumFromString(
            NutzenlayoutUnitSystem.values,
            dto.leadingUnitSystem,
          ) ??
          NutzenlayoutUnitSystem.teeth,
      meta: dataMeta,
      dimensions: dto.dimensions.toSet(),
      description: dto.description,
      drucklaenge: dto.drucklaenge,
      customerId: dto.customerId,
      cellX: dimensions.width,
      cellY: dimensions.height,
      id: dto.id,
      columns: dto.nutzenlayoutColumns.map(NutzenlayoutColumn.fromDTO).toList(),
      formType: dto.formType,
    );
  }

  factory Nutzenlayout.fromSalesOrderMultiNuzenlayout(
    NutzenlayoutDTO dto,
    List<ArtworkArtworkMaster> cellArtworkAssignments,
  ) {
    final dataMeta = DataMeta.fromDTO(dto);

    // map the cellArtworkAssignments to the columns, we want to change the
    // artworkId and artworkMasterId of the cells
    var assignmentIndex = 0;
    // Map each column DTO to a new NutzenlayoutColumn with updated cells
    final columns = dto.nutzenlayoutColumns.map((columnDTO) {
      // Create the original column structure first
      final originalColumn = NutzenlayoutColumn.fromDTO(columnDTO);

      // Map each cell within the original column to a new cell with updated IDs
      final updatedCells = originalColumn.cells.map((cell) {
        // Check if there are enough assignments left.
        // This guards against errors if the number of cells doesn't match
        // the number of assignments, which shouldn't happen with valid data.
        if (assignmentIndex >= cellArtworkAssignments.length) {
          throw StateError(
            'Mismatch between the number of cells and artwork assignments. '
            'Expected assignment for cell (original artworkId: ${cell.artworkId}), '
            'but ran out of assignments. Index: $assignmentIndex, '
            'Total assignments: ${cellArtworkAssignments.length}',
          );
        }

        // Get the assignment corresponding to the current cell's position
        final assignment = cellArtworkAssignments[assignmentIndex];
        // Move to the next assignment for the next cell
        assignmentIndex++;

        // Create a new cell instance with the updated artworkId and artworkMasterId.
        // Assumes NutzenlayoutCell has a `copyWith` method and fields
        // `artworkId` and `artworkMasterId`.
        return cell.copyWith(
          artworkId: assignment.artworkId,
          artworkMasterId: assignment.artworkMasterId,
        );
      }).toList(); // Collect the updated cells into a list

      // Create a new column instance with the list of updated cells.
      // Assumes NutzenlayoutColumn has a `copyWith` method.
      return originalColumn.copyWith(cells: updatedCells);
    }).toList(); // Collect the updated columns into a list

    return Nutzenlayout(
      leadingUnitSystem: Parser.enumFromString(
            NutzenlayoutUnitSystem.values,
            dto.leadingUnitSystem,
          ) ??
          NutzenlayoutUnitSystem.teeth,
      meta: dataMeta,
      dimensions: dto.dimensions.toSet(),
      description: dto.description,
      drucklaenge: dto.drucklaenge,
      customerId: dto.customerId,
      cellX: 0,
      cellY: 0,
      id: dto.id,
      columns: columns,
      formType: dto.formType,
    );
  }

  factory Nutzenlayout.empty() {
    return Nutzenlayout(
      dimensions: {},
      meta: DataMeta.initial(),
      description: '',
      drucklaenge: 0,
      customerId: null,
      cellX: 0,
      cellY: 0,
      columns: [],
      formType: NutzenlayoutFormType.einzelform,
      leadingUnitSystem: NutzenlayoutUnitSystem.teeth,
    );
  }

  factory Nutzenlayout.initial({
    required double drucklaenge,
    required List<NutzenlayoutColumn> columns,
    required int customerId,
    required double cellX,
    required double cellY,
    required String description,
    required NutzenlayoutFormType formType,
    required NutzenlayoutUnitSystem leadingUnitSystem,
  }) {
    return Nutzenlayout(
      dimensions: {},
      meta: DataMeta.initial(),
      description: description,
      drucklaenge: drucklaenge,
      customerId: customerId,
      cellX: cellX,
      cellY: cellY,
      columns: columns,
      formType: formType,
      leadingUnitSystem: leadingUnitSystem,
    );
  }

  NutzenlayoutDTO singleToDTO() {
    return NutzenlayoutDTO(
      createdAt: meta.createdAt!,
      leadingUnitSystem: leadingUnitSystem.name,
      isDraft: false,
      description: description,
      drucklaenge: drucklaenge,
      customerId: customerId!,
      dimensions: [
        NutzenlayoutArtworkDimensions(
          width: cellX,
          height: cellY,
        ),
      ],
      nutzenlayoutColumns:
          columns.map((column) => column.toDTO(drucklaenge)).toList(),
      id: id,
      formType: formType,
    );
  }

  String get matrix {
    final columnsCount = columns.length;
    final cellsPerColumn =
        columns.map((column) => column.cells.length).toList();
    final allSameLength =
        cellsPerColumn.every((count) => count == cellsPerColumn.first);

    if (allSameLength && columnsCount > 0) {
      return '$columnsCount / ${cellsPerColumn.first}';
    } else {
      return '$columnsCount / ${cellsPerColumn.join('-')}';
    }
  }

  String matrixReadable(ElbCoreLocalizations l10n) {
    return '$matrix | '
        '${laufrichtung.shortReadable(l10n)} | '
        '${offset(l10n.localeName)}';
  }

  String offset(String locale) {
    final offsets = columns.map((column) => column.offset).toList();
    final allSameOffset = offsets.every((offset) => offset == offsets.first);

    if (allSameOffset) {
      return '${offsets.first.formatted(locale)} mm';
    } else {
      final formattedOffsets =
          offsets.map((offset) => offset.formatted(locale)).join('-');
      return '$formattedOffsets mm';
    }
  }

  NutzenlayoutLaufrichtung get laufrichtung {
    if (columns.isEmpty) {
      return NutzenlayoutLaufrichtung.mixed;
    }

    // Get the first cell's laufrichtung as reference
    final firstLaufrichtung = columns.first.cells.isNotEmpty
        ? columns.first.cells.first.laufrichtung
        : NutzenlayoutLaufrichtung.mixed;

    // Check if all cells have the same laufrichtung
    final allSame = columns.every((column) {
      return column.cells.every((cell) {
        return cell.laufrichtung == firstLaufrichtung;
      });
    });

    return allSame ? firstLaufrichtung : NutzenlayoutLaufrichtung.mixed;
  }

  double get zaehne {
    return drucklaenge / 3.175;
  }

  String get formattedZaehne {
    return zaehne.toInt().toString();
  }

  String formattedDrucklaenge(String locale) {
    return drucklaenge.formatted(
      locale,
      fractionsWhenDoubleDouble: 3,
      fractionsWhenDoubleInt: 3,
    );
  }

  String formattedSingleDimension(String locale) {
    return '${cellX.formatted(locale)} x ${cellY.formatted(locale)} mm';
  }

  String formattedDimensions(String locale) {
    if (dimensions.length == 1) {
      final d = dimensions.first;
      return '${d.width.formatted(locale)} x ${d.height.formatted(locale)} mm';
    }
    var t = '';
    t = dimensions
        .map(
          (dimension) =>
              '${dimension.width.formatted(locale)} x ${dimension.height.formatted(locale)}',
        )
        .join(' / ');
    return '$t mm';
  }

  String formattedDrucklaengeAndZaehne(String locale) {
    return '${formattedDrucklaenge(locale)} mm ($formattedZaehne Zähne)';
  }

  // the overall width of the nutzenlayout
  // This function calculates the total width of our layout
  double get width {
    // We start with 0 and add up the width of each column
    return columns.fold<double>(0, (sum, column) {
      // If a column has no cells, we just keep the sum as is
      if (column.cells.isEmpty) return sum;

      // For each column, we find the widest cell (including its gap)
      // It's like finding the biggest toy in each box
      final maxWidthInColumn = column.cells
          .map((cell) => cell.widthWithGap)
          .reduce((max, width) => width > max ? width : max);

      // Add this column's widest cell to our total sum
      return sum + maxWidthInColumn;
    });
  }
}
