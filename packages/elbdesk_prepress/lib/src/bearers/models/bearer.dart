import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bearer.freezed.dart';

/// Bearer
/// This is the app side Bearer model. It is used to store bearer information
/// for a bearer during runtime. The BearerDTO is fetched from the server and
/// converted to a Bearer object.
///
/// To parse the BearerDTO to and from a Bearer object, the fromDTO and toDTO
/// methods are used.
///
@freezed
class Bearer with _$Bearer {
  /// Bearer constructor
  const factory Bearer({
    required BearerGeneral general,
    required DataMeta meta,
  }) = _Bearer;

  /// Initial empty Bearer
  factory Bearer.initial() {
    return Bearer(
      general: const BearerGeneral(
        name: '',
        description: '',
        longText: '',
        costCenterCode: '',
        type: BearerType.none,
        type1: null,
        type2: null,
      ),
      meta: DataMeta.initial(),
    );
  }

  const Bearer._();

  /// Bearer from DTO
  factory Bearer.fromDTO(BearerDTO dto) {
    final bearerGeneral = BearerGeneral(
      name: dto.bearerName,
      description: dto.description,
      longText: dto.longText,
      costCenterCode: dto.costCenterCode,
      type: dto.type,
      type1: dto.type1 != null ? BearerType1.fromDTO(dto.type1!) : null,
      type2: dto.type2 != null ? BearerType2.fromDTO(dto.type2!) : null,
    );

    final dataMeta = DataMeta.fromDTO(dto);

    return Bearer(
      meta: dataMeta,
      general: bearerGeneral,
    );
  }

  /// Bearer to DTO
  BearerDTO toDTO() => BearerDTO(
        isDraft: meta.isDraft,
        bearerName: general.name,
        description: general.description,
        longText: general.longText,
        costCenterCode: general.costCenterCode,
        id: meta.id,
        createdAt: meta.createdAt!,
        type: general.type,
        type1: general.type1?.toDTO(),
        type2: general.type2?.toDTO(),
      );
}

/// BearerGeneral
///
/// The BearerGeneral model is used to store general information about a
/// bearer.
/// This is just a subclass to structure the bearer information
@freezed
class BearerGeneral with _$BearerGeneral {
  /// BearerGeneral constructor
  const factory BearerGeneral({
    required String name,
    required String description,
    required String longText,
    required String costCenterCode,
    required BearerType type,
    required BearerType1? type1,
    required BearerType2? type2,
  }) = _BearerGeneral;

  const BearerGeneral._();
}

/// ComparableBearer
///
/// The ComparableBearer model is used to compare two bearers. The Comparable
/// gets rid of the MetaData and enables the bearer to be compared with just
/// the bearer information
@freezed
class ComparableBearer with _$ComparableBearer {
  /// ComparableBearer constructor
  const factory ComparableBearer({
    required BearerGeneral general,
  }) = _ComparableBearer;

  const ComparableBearer._();

  /// ComparableBearer from Bearer
  factory ComparableBearer.fromBearer(Bearer bearer) {
    return ComparableBearer(
      general: bearer.general,
    );
  }
}

// Bearer Type 1 model
///
/// The BearerType1 model is used to store general information about a
/// bearer type.
@freezed
class BearerType1 with _$BearerType1 {
  /// BearerGeneral constructor
  const factory BearerType1({
    required double marginLeft,
    required double marginRight,
    int? id,
  }) = _BearerType1;

  const BearerType1._();

  /// Initial empty Bearer Type1
  factory BearerType1.initial() {
    return const BearerType1(
      marginLeft: 0,
      marginRight: 0,
      id: 0,
    );
  }

  /// fromDTO
  factory BearerType1.fromDTO(BearerType1DTO dto) {
    return BearerType1(
      marginLeft: dto.marginLeft,
      marginRight: dto.marginRight,
      id: dto.id,
    );
  }

  /// toDTO
  BearerType1DTO toDTO() => BearerType1DTO(
        marginLeft: marginLeft,
        marginRight: marginRight,
        id: id,
      );
}

/// Bearer Type 2 model
///
/// The BearerType2 model is used to store general information about a
/// bearer type.
@freezed
class BearerType2 with _$BearerType2 {
  /// BearerGeneral constructor
  const factory BearerType2({
    required double minWidth,
    required double minHeight,
    int? id,
  }) = _BearerType2;

  const BearerType2._();

  /// Initial empty Bearer Type2
  factory BearerType2.initial() {
    return const BearerType2(
      minWidth: 0,
      minHeight: 0,
      id: 0,
    );
  }

  /// fromDTO
  factory BearerType2.fromDTO(BearerType2DTO dto) {
    return BearerType2(
      minWidth: dto.minWidth,
      minHeight: dto.minHeight,
      id: dto.id,
    );
  }

  /// toDTO
  BearerType2DTO toDTO() => BearerType2DTO(
        minWidth: minWidth,
        minHeight: minHeight,
        id: id,
      );
}
