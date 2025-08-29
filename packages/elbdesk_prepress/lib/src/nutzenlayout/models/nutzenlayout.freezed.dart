// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutzenlayout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Nutzenlayout _$NutzenlayoutFromJson(Map<String, dynamic> json) {
  return _Nutzenlayout.fromJson(json);
}

/// @nodoc
mixin _$Nutzenlayout {
  DataMeta get meta => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get drucklaenge => throw _privateConstructorUsedError;
  int? get customerId => throw _privateConstructorUsedError;
  double get cellX => throw _privateConstructorUsedError;
  double get cellY => throw _privateConstructorUsedError;
  List<NutzenlayoutColumn> get columns => throw _privateConstructorUsedError;
  NutzenlayoutFormType get formType => throw _privateConstructorUsedError;
  Set<NutzenlayoutArtworkDimensions> get dimensions =>
      throw _privateConstructorUsedError;
  NutzenlayoutUnitSystem get leadingUnitSystem =>
      throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this Nutzenlayout to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Nutzenlayout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutzenlayoutCopyWith<Nutzenlayout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutzenlayoutCopyWith<$Res> {
  factory $NutzenlayoutCopyWith(
          Nutzenlayout value, $Res Function(Nutzenlayout) then) =
      _$NutzenlayoutCopyWithImpl<$Res, Nutzenlayout>;
  @useResult
  $Res call(
      {DataMeta meta,
      String description,
      double drucklaenge,
      int? customerId,
      double cellX,
      double cellY,
      List<NutzenlayoutColumn> columns,
      NutzenlayoutFormType formType,
      Set<NutzenlayoutArtworkDimensions> dimensions,
      NutzenlayoutUnitSystem leadingUnitSystem,
      int? id});

  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$NutzenlayoutCopyWithImpl<$Res, $Val extends Nutzenlayout>
    implements $NutzenlayoutCopyWith<$Res> {
  _$NutzenlayoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Nutzenlayout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? description = null,
    Object? drucklaenge = null,
    Object? customerId = freezed,
    Object? cellX = null,
    Object? cellY = null,
    Object? columns = null,
    Object? formType = null,
    Object? dimensions = null,
    Object? leadingUnitSystem = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      drucklaenge: null == drucklaenge
          ? _value.drucklaenge
          : drucklaenge // ignore: cast_nullable_to_non_nullable
              as double,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      cellX: null == cellX
          ? _value.cellX
          : cellX // ignore: cast_nullable_to_non_nullable
              as double,
      cellY: null == cellY
          ? _value.cellY
          : cellY // ignore: cast_nullable_to_non_nullable
              as double,
      columns: null == columns
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as List<NutzenlayoutColumn>,
      formType: null == formType
          ? _value.formType
          : formType // ignore: cast_nullable_to_non_nullable
              as NutzenlayoutFormType,
      dimensions: null == dimensions
          ? _value.dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as Set<NutzenlayoutArtworkDimensions>,
      leadingUnitSystem: null == leadingUnitSystem
          ? _value.leadingUnitSystem
          : leadingUnitSystem // ignore: cast_nullable_to_non_nullable
              as NutzenlayoutUnitSystem,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of Nutzenlayout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataMetaCopyWith<$Res> get meta {
    return $DataMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NutzenlayoutImplCopyWith<$Res>
    implements $NutzenlayoutCopyWith<$Res> {
  factory _$$NutzenlayoutImplCopyWith(
          _$NutzenlayoutImpl value, $Res Function(_$NutzenlayoutImpl) then) =
      __$$NutzenlayoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataMeta meta,
      String description,
      double drucklaenge,
      int? customerId,
      double cellX,
      double cellY,
      List<NutzenlayoutColumn> columns,
      NutzenlayoutFormType formType,
      Set<NutzenlayoutArtworkDimensions> dimensions,
      NutzenlayoutUnitSystem leadingUnitSystem,
      int? id});

  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$NutzenlayoutImplCopyWithImpl<$Res>
    extends _$NutzenlayoutCopyWithImpl<$Res, _$NutzenlayoutImpl>
    implements _$$NutzenlayoutImplCopyWith<$Res> {
  __$$NutzenlayoutImplCopyWithImpl(
      _$NutzenlayoutImpl _value, $Res Function(_$NutzenlayoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of Nutzenlayout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? description = null,
    Object? drucklaenge = null,
    Object? customerId = freezed,
    Object? cellX = null,
    Object? cellY = null,
    Object? columns = null,
    Object? formType = null,
    Object? dimensions = null,
    Object? leadingUnitSystem = null,
    Object? id = freezed,
  }) {
    return _then(_$NutzenlayoutImpl(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      drucklaenge: null == drucklaenge
          ? _value.drucklaenge
          : drucklaenge // ignore: cast_nullable_to_non_nullable
              as double,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      cellX: null == cellX
          ? _value.cellX
          : cellX // ignore: cast_nullable_to_non_nullable
              as double,
      cellY: null == cellY
          ? _value.cellY
          : cellY // ignore: cast_nullable_to_non_nullable
              as double,
      columns: null == columns
          ? _value._columns
          : columns // ignore: cast_nullable_to_non_nullable
              as List<NutzenlayoutColumn>,
      formType: null == formType
          ? _value.formType
          : formType // ignore: cast_nullable_to_non_nullable
              as NutzenlayoutFormType,
      dimensions: null == dimensions
          ? _value._dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as Set<NutzenlayoutArtworkDimensions>,
      leadingUnitSystem: null == leadingUnitSystem
          ? _value.leadingUnitSystem
          : leadingUnitSystem // ignore: cast_nullable_to_non_nullable
              as NutzenlayoutUnitSystem,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NutzenlayoutImpl extends _Nutzenlayout {
  const _$NutzenlayoutImpl(
      {required this.meta,
      required this.description,
      required this.drucklaenge,
      required this.customerId,
      required this.cellX,
      required this.cellY,
      required final List<NutzenlayoutColumn> columns,
      required this.formType,
      required final Set<NutzenlayoutArtworkDimensions> dimensions,
      required this.leadingUnitSystem,
      this.id})
      : _columns = columns,
        _dimensions = dimensions,
        super._();

  factory _$NutzenlayoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$NutzenlayoutImplFromJson(json);

  @override
  final DataMeta meta;
  @override
  final String description;
  @override
  final double drucklaenge;
  @override
  final int? customerId;
  @override
  final double cellX;
  @override
  final double cellY;
  final List<NutzenlayoutColumn> _columns;
  @override
  List<NutzenlayoutColumn> get columns {
    if (_columns is EqualUnmodifiableListView) return _columns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_columns);
  }

  @override
  final NutzenlayoutFormType formType;
  final Set<NutzenlayoutArtworkDimensions> _dimensions;
  @override
  Set<NutzenlayoutArtworkDimensions> get dimensions {
    if (_dimensions is EqualUnmodifiableSetView) return _dimensions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_dimensions);
  }

  @override
  final NutzenlayoutUnitSystem leadingUnitSystem;
  @override
  final int? id;

  @override
  String toString() {
    return 'Nutzenlayout(meta: $meta, description: $description, drucklaenge: $drucklaenge, customerId: $customerId, cellX: $cellX, cellY: $cellY, columns: $columns, formType: $formType, dimensions: $dimensions, leadingUnitSystem: $leadingUnitSystem, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutzenlayoutImpl &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.drucklaenge, drucklaenge) ||
                other.drucklaenge == drucklaenge) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.cellX, cellX) || other.cellX == cellX) &&
            (identical(other.cellY, cellY) || other.cellY == cellY) &&
            const DeepCollectionEquality().equals(other._columns, _columns) &&
            (identical(other.formType, formType) ||
                other.formType == formType) &&
            const DeepCollectionEquality()
                .equals(other._dimensions, _dimensions) &&
            (identical(other.leadingUnitSystem, leadingUnitSystem) ||
                other.leadingUnitSystem == leadingUnitSystem) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      meta,
      description,
      drucklaenge,
      customerId,
      cellX,
      cellY,
      const DeepCollectionEquality().hash(_columns),
      formType,
      const DeepCollectionEquality().hash(_dimensions),
      leadingUnitSystem,
      id);

  /// Create a copy of Nutzenlayout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutzenlayoutImplCopyWith<_$NutzenlayoutImpl> get copyWith =>
      __$$NutzenlayoutImplCopyWithImpl<_$NutzenlayoutImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutzenlayoutImplToJson(
      this,
    );
  }
}

abstract class _Nutzenlayout extends Nutzenlayout {
  const factory _Nutzenlayout(
      {required final DataMeta meta,
      required final String description,
      required final double drucklaenge,
      required final int? customerId,
      required final double cellX,
      required final double cellY,
      required final List<NutzenlayoutColumn> columns,
      required final NutzenlayoutFormType formType,
      required final Set<NutzenlayoutArtworkDimensions> dimensions,
      required final NutzenlayoutUnitSystem leadingUnitSystem,
      final int? id}) = _$NutzenlayoutImpl;
  const _Nutzenlayout._() : super._();

  factory _Nutzenlayout.fromJson(Map<String, dynamic> json) =
      _$NutzenlayoutImpl.fromJson;

  @override
  DataMeta get meta;
  @override
  String get description;
  @override
  double get drucklaenge;
  @override
  int? get customerId;
  @override
  double get cellX;
  @override
  double get cellY;
  @override
  List<NutzenlayoutColumn> get columns;
  @override
  NutzenlayoutFormType get formType;
  @override
  Set<NutzenlayoutArtworkDimensions> get dimensions;
  @override
  NutzenlayoutUnitSystem get leadingUnitSystem;
  @override
  int? get id;

  /// Create a copy of Nutzenlayout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutzenlayoutImplCopyWith<_$NutzenlayoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
