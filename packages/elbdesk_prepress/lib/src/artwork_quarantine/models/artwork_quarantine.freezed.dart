// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artwork_quarantine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArtworkQuarantine _$ArtworkQuarantineFromJson(Map<String, dynamic> json) {
  return _ArtworkQuarantine.fromJson(json);
}

/// @nodoc
mixin _$ArtworkQuarantine {
  ArtworkQuarantineGeneral get general => throw _privateConstructorUsedError;
  ArtworkQuarantineAnalysisData? get analysisData =>
      throw _privateConstructorUsedError;
  ArtworkQuarantineArtworkData get artworkData =>
      throw _privateConstructorUsedError;
  int? get customerId => throw _privateConstructorUsedError;
  Customer? get customer => throw _privateConstructorUsedError;
  int? get groupId => throw _privateConstructorUsedError;
  ArtworkQuarantineGroup? get group => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;

  /// Serializes this ArtworkQuarantine to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArtworkQuarantine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArtworkQuarantineCopyWith<ArtworkQuarantine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtworkQuarantineCopyWith<$Res> {
  factory $ArtworkQuarantineCopyWith(
          ArtworkQuarantine value, $Res Function(ArtworkQuarantine) then) =
      _$ArtworkQuarantineCopyWithImpl<$Res, ArtworkQuarantine>;
  @useResult
  $Res call(
      {ArtworkQuarantineGeneral general,
      ArtworkQuarantineAnalysisData? analysisData,
      ArtworkQuarantineArtworkData artworkData,
      int? customerId,
      Customer? customer,
      int? groupId,
      ArtworkQuarantineGroup? group,
      DataMeta meta});

  $ArtworkQuarantineGeneralCopyWith<$Res> get general;
  $ArtworkQuarantineAnalysisDataCopyWith<$Res>? get analysisData;
  $ArtworkQuarantineArtworkDataCopyWith<$Res> get artworkData;
  $CustomerCopyWith<$Res>? get customer;
  $ArtworkQuarantineGroupCopyWith<$Res>? get group;
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$ArtworkQuarantineCopyWithImpl<$Res, $Val extends ArtworkQuarantine>
    implements $ArtworkQuarantineCopyWith<$Res> {
  _$ArtworkQuarantineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArtworkQuarantine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? general = null,
    Object? analysisData = freezed,
    Object? artworkData = null,
    Object? customerId = freezed,
    Object? customer = freezed,
    Object? groupId = freezed,
    Object? group = freezed,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      general: null == general
          ? _value.general
          : general // ignore: cast_nullable_to_non_nullable
              as ArtworkQuarantineGeneral,
      analysisData: freezed == analysisData
          ? _value.analysisData
          : analysisData // ignore: cast_nullable_to_non_nullable
              as ArtworkQuarantineAnalysisData?,
      artworkData: null == artworkData
          ? _value.artworkData
          : artworkData // ignore: cast_nullable_to_non_nullable
              as ArtworkQuarantineArtworkData,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as ArtworkQuarantineGroup?,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
    ) as $Val);
  }

  /// Create a copy of ArtworkQuarantine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ArtworkQuarantineGeneralCopyWith<$Res> get general {
    return $ArtworkQuarantineGeneralCopyWith<$Res>(_value.general, (value) {
      return _then(_value.copyWith(general: value) as $Val);
    });
  }

  /// Create a copy of ArtworkQuarantine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ArtworkQuarantineAnalysisDataCopyWith<$Res>? get analysisData {
    if (_value.analysisData == null) {
      return null;
    }

    return $ArtworkQuarantineAnalysisDataCopyWith<$Res>(_value.analysisData!,
        (value) {
      return _then(_value.copyWith(analysisData: value) as $Val);
    });
  }

  /// Create a copy of ArtworkQuarantine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ArtworkQuarantineArtworkDataCopyWith<$Res> get artworkData {
    return $ArtworkQuarantineArtworkDataCopyWith<$Res>(_value.artworkData,
        (value) {
      return _then(_value.copyWith(artworkData: value) as $Val);
    });
  }

  /// Create a copy of ArtworkQuarantine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  /// Create a copy of ArtworkQuarantine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ArtworkQuarantineGroupCopyWith<$Res>? get group {
    if (_value.group == null) {
      return null;
    }

    return $ArtworkQuarantineGroupCopyWith<$Res>(_value.group!, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }

  /// Create a copy of ArtworkQuarantine
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
abstract class _$$ArtworkQuarantineImplCopyWith<$Res>
    implements $ArtworkQuarantineCopyWith<$Res> {
  factory _$$ArtworkQuarantineImplCopyWith(_$ArtworkQuarantineImpl value,
          $Res Function(_$ArtworkQuarantineImpl) then) =
      __$$ArtworkQuarantineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ArtworkQuarantineGeneral general,
      ArtworkQuarantineAnalysisData? analysisData,
      ArtworkQuarantineArtworkData artworkData,
      int? customerId,
      Customer? customer,
      int? groupId,
      ArtworkQuarantineGroup? group,
      DataMeta meta});

  @override
  $ArtworkQuarantineGeneralCopyWith<$Res> get general;
  @override
  $ArtworkQuarantineAnalysisDataCopyWith<$Res>? get analysisData;
  @override
  $ArtworkQuarantineArtworkDataCopyWith<$Res> get artworkData;
  @override
  $CustomerCopyWith<$Res>? get customer;
  @override
  $ArtworkQuarantineGroupCopyWith<$Res>? get group;
  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$ArtworkQuarantineImplCopyWithImpl<$Res>
    extends _$ArtworkQuarantineCopyWithImpl<$Res, _$ArtworkQuarantineImpl>
    implements _$$ArtworkQuarantineImplCopyWith<$Res> {
  __$$ArtworkQuarantineImplCopyWithImpl(_$ArtworkQuarantineImpl _value,
      $Res Function(_$ArtworkQuarantineImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArtworkQuarantine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? general = null,
    Object? analysisData = freezed,
    Object? artworkData = null,
    Object? customerId = freezed,
    Object? customer = freezed,
    Object? groupId = freezed,
    Object? group = freezed,
    Object? meta = null,
  }) {
    return _then(_$ArtworkQuarantineImpl(
      general: null == general
          ? _value.general
          : general // ignore: cast_nullable_to_non_nullable
              as ArtworkQuarantineGeneral,
      analysisData: freezed == analysisData
          ? _value.analysisData
          : analysisData // ignore: cast_nullable_to_non_nullable
              as ArtworkQuarantineAnalysisData?,
      artworkData: null == artworkData
          ? _value.artworkData
          : artworkData // ignore: cast_nullable_to_non_nullable
              as ArtworkQuarantineArtworkData,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as ArtworkQuarantineGroup?,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtworkQuarantineImpl extends _ArtworkQuarantine
    with DiagnosticableTreeMixin {
  const _$ArtworkQuarantineImpl(
      {required this.general,
      required this.analysisData,
      required this.artworkData,
      required this.customerId,
      required this.customer,
      required this.groupId,
      required this.group,
      required this.meta})
      : super._();

  factory _$ArtworkQuarantineImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtworkQuarantineImplFromJson(json);

  @override
  final ArtworkQuarantineGeneral general;
  @override
  final ArtworkQuarantineAnalysisData? analysisData;
  @override
  final ArtworkQuarantineArtworkData artworkData;
  @override
  final int? customerId;
  @override
  final Customer? customer;
  @override
  final int? groupId;
  @override
  final ArtworkQuarantineGroup? group;
  @override
  final DataMeta meta;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ArtworkQuarantine(general: $general, analysisData: $analysisData, artworkData: $artworkData, customerId: $customerId, customer: $customer, groupId: $groupId, group: $group, meta: $meta)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ArtworkQuarantine'))
      ..add(DiagnosticsProperty('general', general))
      ..add(DiagnosticsProperty('analysisData', analysisData))
      ..add(DiagnosticsProperty('artworkData', artworkData))
      ..add(DiagnosticsProperty('customerId', customerId))
      ..add(DiagnosticsProperty('customer', customer))
      ..add(DiagnosticsProperty('groupId', groupId))
      ..add(DiagnosticsProperty('group', group))
      ..add(DiagnosticsProperty('meta', meta));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtworkQuarantineImpl &&
            (identical(other.general, general) || other.general == general) &&
            (identical(other.analysisData, analysisData) ||
                other.analysisData == analysisData) &&
            (identical(other.artworkData, artworkData) ||
                other.artworkData == artworkData) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, general, analysisData,
      artworkData, customerId, customer, groupId, group, meta);

  /// Create a copy of ArtworkQuarantine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtworkQuarantineImplCopyWith<_$ArtworkQuarantineImpl> get copyWith =>
      __$$ArtworkQuarantineImplCopyWithImpl<_$ArtworkQuarantineImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtworkQuarantineImplToJson(
      this,
    );
  }
}

abstract class _ArtworkQuarantine extends ArtworkQuarantine {
  const factory _ArtworkQuarantine(
      {required final ArtworkQuarantineGeneral general,
      required final ArtworkQuarantineAnalysisData? analysisData,
      required final ArtworkQuarantineArtworkData artworkData,
      required final int? customerId,
      required final Customer? customer,
      required final int? groupId,
      required final ArtworkQuarantineGroup? group,
      required final DataMeta meta}) = _$ArtworkQuarantineImpl;
  const _ArtworkQuarantine._() : super._();

  factory _ArtworkQuarantine.fromJson(Map<String, dynamic> json) =
      _$ArtworkQuarantineImpl.fromJson;

  @override
  ArtworkQuarantineGeneral get general;
  @override
  ArtworkQuarantineAnalysisData? get analysisData;
  @override
  ArtworkQuarantineArtworkData get artworkData;
  @override
  int? get customerId;
  @override
  Customer? get customer;
  @override
  int? get groupId;
  @override
  ArtworkQuarantineGroup? get group;
  @override
  DataMeta get meta;

  /// Create a copy of ArtworkQuarantine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArtworkQuarantineImplCopyWith<_$ArtworkQuarantineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArtworkQuarantineGeneral _$ArtworkQuarantineGeneralFromJson(
    Map<String, dynamic> json) {
  return _ArtworkQuarantineGeneral.fromJson(json);
}

/// @nodoc
mixin _$ArtworkQuarantineGeneral {
  String get description => throw _privateConstructorUsedError;
  String get quarantineUuid => throw _privateConstructorUsedError;
  String? get keywords => throw _privateConstructorUsedError;
  int? get artworkId => throw _privateConstructorUsedError;
  ArtworkType? get type => throw _privateConstructorUsedError;
  ArtworkQuarantineGroupStatus get status => throw _privateConstructorUsedError;
  ProductType? get productType => throw _privateConstructorUsedError;
  ArtworkPrintProcessType? get printProcessType =>
      throw _privateConstructorUsedError;

  /// Serializes this ArtworkQuarantineGeneral to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArtworkQuarantineGeneral
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArtworkQuarantineGeneralCopyWith<ArtworkQuarantineGeneral> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtworkQuarantineGeneralCopyWith<$Res> {
  factory $ArtworkQuarantineGeneralCopyWith(ArtworkQuarantineGeneral value,
          $Res Function(ArtworkQuarantineGeneral) then) =
      _$ArtworkQuarantineGeneralCopyWithImpl<$Res, ArtworkQuarantineGeneral>;
  @useResult
  $Res call(
      {String description,
      String quarantineUuid,
      String? keywords,
      int? artworkId,
      ArtworkType? type,
      ArtworkQuarantineGroupStatus status,
      ProductType? productType,
      ArtworkPrintProcessType? printProcessType});
}

/// @nodoc
class _$ArtworkQuarantineGeneralCopyWithImpl<$Res,
        $Val extends ArtworkQuarantineGeneral>
    implements $ArtworkQuarantineGeneralCopyWith<$Res> {
  _$ArtworkQuarantineGeneralCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArtworkQuarantineGeneral
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? quarantineUuid = null,
    Object? keywords = freezed,
    Object? artworkId = freezed,
    Object? type = freezed,
    Object? status = null,
    Object? productType = freezed,
    Object? printProcessType = freezed,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      quarantineUuid: null == quarantineUuid
          ? _value.quarantineUuid
          : quarantineUuid // ignore: cast_nullable_to_non_nullable
              as String,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      artworkId: freezed == artworkId
          ? _value.artworkId
          : artworkId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ArtworkType?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ArtworkQuarantineGroupStatus,
      productType: freezed == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as ProductType?,
      printProcessType: freezed == printProcessType
          ? _value.printProcessType
          : printProcessType // ignore: cast_nullable_to_non_nullable
              as ArtworkPrintProcessType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtworkQuarantineGeneralImplCopyWith<$Res>
    implements $ArtworkQuarantineGeneralCopyWith<$Res> {
  factory _$$ArtworkQuarantineGeneralImplCopyWith(
          _$ArtworkQuarantineGeneralImpl value,
          $Res Function(_$ArtworkQuarantineGeneralImpl) then) =
      __$$ArtworkQuarantineGeneralImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String description,
      String quarantineUuid,
      String? keywords,
      int? artworkId,
      ArtworkType? type,
      ArtworkQuarantineGroupStatus status,
      ProductType? productType,
      ArtworkPrintProcessType? printProcessType});
}

/// @nodoc
class __$$ArtworkQuarantineGeneralImplCopyWithImpl<$Res>
    extends _$ArtworkQuarantineGeneralCopyWithImpl<$Res,
        _$ArtworkQuarantineGeneralImpl>
    implements _$$ArtworkQuarantineGeneralImplCopyWith<$Res> {
  __$$ArtworkQuarantineGeneralImplCopyWithImpl(
      _$ArtworkQuarantineGeneralImpl _value,
      $Res Function(_$ArtworkQuarantineGeneralImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArtworkQuarantineGeneral
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? quarantineUuid = null,
    Object? keywords = freezed,
    Object? artworkId = freezed,
    Object? type = freezed,
    Object? status = null,
    Object? productType = freezed,
    Object? printProcessType = freezed,
  }) {
    return _then(_$ArtworkQuarantineGeneralImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      quarantineUuid: null == quarantineUuid
          ? _value.quarantineUuid
          : quarantineUuid // ignore: cast_nullable_to_non_nullable
              as String,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      artworkId: freezed == artworkId
          ? _value.artworkId
          : artworkId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ArtworkType?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ArtworkQuarantineGroupStatus,
      productType: freezed == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as ProductType?,
      printProcessType: freezed == printProcessType
          ? _value.printProcessType
          : printProcessType // ignore: cast_nullable_to_non_nullable
              as ArtworkPrintProcessType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtworkQuarantineGeneralImpl extends _ArtworkQuarantineGeneral
    with DiagnosticableTreeMixin {
  const _$ArtworkQuarantineGeneralImpl(
      {required this.description,
      required this.quarantineUuid,
      required this.keywords,
      required this.artworkId,
      required this.type,
      required this.status,
      required this.productType,
      required this.printProcessType})
      : super._();

  factory _$ArtworkQuarantineGeneralImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtworkQuarantineGeneralImplFromJson(json);

  @override
  final String description;
  @override
  final String quarantineUuid;
  @override
  final String? keywords;
  @override
  final int? artworkId;
  @override
  final ArtworkType? type;
  @override
  final ArtworkQuarantineGroupStatus status;
  @override
  final ProductType? productType;
  @override
  final ArtworkPrintProcessType? printProcessType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ArtworkQuarantineGeneral(description: $description, quarantineUuid: $quarantineUuid, keywords: $keywords, artworkId: $artworkId, type: $type, status: $status, productType: $productType, printProcessType: $printProcessType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ArtworkQuarantineGeneral'))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('quarantineUuid', quarantineUuid))
      ..add(DiagnosticsProperty('keywords', keywords))
      ..add(DiagnosticsProperty('artworkId', artworkId))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('productType', productType))
      ..add(DiagnosticsProperty('printProcessType', printProcessType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtworkQuarantineGeneralImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.quarantineUuid, quarantineUuid) ||
                other.quarantineUuid == quarantineUuid) &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords) &&
            (identical(other.artworkId, artworkId) ||
                other.artworkId == artworkId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.printProcessType, printProcessType) ||
                other.printProcessType == printProcessType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, description, quarantineUuid,
      keywords, artworkId, type, status, productType, printProcessType);

  /// Create a copy of ArtworkQuarantineGeneral
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtworkQuarantineGeneralImplCopyWith<_$ArtworkQuarantineGeneralImpl>
      get copyWith => __$$ArtworkQuarantineGeneralImplCopyWithImpl<
          _$ArtworkQuarantineGeneralImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtworkQuarantineGeneralImplToJson(
      this,
    );
  }
}

abstract class _ArtworkQuarantineGeneral extends ArtworkQuarantineGeneral {
  const factory _ArtworkQuarantineGeneral(
          {required final String description,
          required final String quarantineUuid,
          required final String? keywords,
          required final int? artworkId,
          required final ArtworkType? type,
          required final ArtworkQuarantineGroupStatus status,
          required final ProductType? productType,
          required final ArtworkPrintProcessType? printProcessType}) =
      _$ArtworkQuarantineGeneralImpl;
  const _ArtworkQuarantineGeneral._() : super._();

  factory _ArtworkQuarantineGeneral.fromJson(Map<String, dynamic> json) =
      _$ArtworkQuarantineGeneralImpl.fromJson;

  @override
  String get description;
  @override
  String get quarantineUuid;
  @override
  String? get keywords;
  @override
  int? get artworkId;
  @override
  ArtworkType? get type;
  @override
  ArtworkQuarantineGroupStatus get status;
  @override
  ProductType? get productType;
  @override
  ArtworkPrintProcessType? get printProcessType;

  /// Create a copy of ArtworkQuarantineGeneral
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArtworkQuarantineGeneralImplCopyWith<_$ArtworkQuarantineGeneralImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ArtworkQuarantineAnalysisData _$ArtworkQuarantineAnalysisDataFromJson(
    Map<String, dynamic> json) {
  return _ArtworkQuarantineAnalysisData.fromJson(json);
}

/// @nodoc
mixin _$ArtworkQuarantineAnalysisData {
  String? get fileName => throw _privateConstructorUsedError;
  DateTime? get analysisDate => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  List<ArtworkColorSpecification>? get colorSpecifications =>
      throw _privateConstructorUsedError;

  /// Serializes this ArtworkQuarantineAnalysisData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArtworkQuarantineAnalysisData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArtworkQuarantineAnalysisDataCopyWith<ArtworkQuarantineAnalysisData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtworkQuarantineAnalysisDataCopyWith<$Res> {
  factory $ArtworkQuarantineAnalysisDataCopyWith(
          ArtworkQuarantineAnalysisData value,
          $Res Function(ArtworkQuarantineAnalysisData) then) =
      _$ArtworkQuarantineAnalysisDataCopyWithImpl<$Res,
          ArtworkQuarantineAnalysisData>;
  @useResult
  $Res call(
      {String? fileName,
      DateTime? analysisDate,
      String note,
      List<ArtworkColorSpecification>? colorSpecifications});
}

/// @nodoc
class _$ArtworkQuarantineAnalysisDataCopyWithImpl<$Res,
        $Val extends ArtworkQuarantineAnalysisData>
    implements $ArtworkQuarantineAnalysisDataCopyWith<$Res> {
  _$ArtworkQuarantineAnalysisDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArtworkQuarantineAnalysisData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = freezed,
    Object? analysisDate = freezed,
    Object? note = null,
    Object? colorSpecifications = freezed,
  }) {
    return _then(_value.copyWith(
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      analysisDate: freezed == analysisDate
          ? _value.analysisDate
          : analysisDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      colorSpecifications: freezed == colorSpecifications
          ? _value.colorSpecifications
          : colorSpecifications // ignore: cast_nullable_to_non_nullable
              as List<ArtworkColorSpecification>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtworkQuarantineAnalysisDataImplCopyWith<$Res>
    implements $ArtworkQuarantineAnalysisDataCopyWith<$Res> {
  factory _$$ArtworkQuarantineAnalysisDataImplCopyWith(
          _$ArtworkQuarantineAnalysisDataImpl value,
          $Res Function(_$ArtworkQuarantineAnalysisDataImpl) then) =
      __$$ArtworkQuarantineAnalysisDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? fileName,
      DateTime? analysisDate,
      String note,
      List<ArtworkColorSpecification>? colorSpecifications});
}

/// @nodoc
class __$$ArtworkQuarantineAnalysisDataImplCopyWithImpl<$Res>
    extends _$ArtworkQuarantineAnalysisDataCopyWithImpl<$Res,
        _$ArtworkQuarantineAnalysisDataImpl>
    implements _$$ArtworkQuarantineAnalysisDataImplCopyWith<$Res> {
  __$$ArtworkQuarantineAnalysisDataImplCopyWithImpl(
      _$ArtworkQuarantineAnalysisDataImpl _value,
      $Res Function(_$ArtworkQuarantineAnalysisDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArtworkQuarantineAnalysisData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = freezed,
    Object? analysisDate = freezed,
    Object? note = null,
    Object? colorSpecifications = freezed,
  }) {
    return _then(_$ArtworkQuarantineAnalysisDataImpl(
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      analysisDate: freezed == analysisDate
          ? _value.analysisDate
          : analysisDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      colorSpecifications: freezed == colorSpecifications
          ? _value._colorSpecifications
          : colorSpecifications // ignore: cast_nullable_to_non_nullable
              as List<ArtworkColorSpecification>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtworkQuarantineAnalysisDataImpl extends _ArtworkQuarantineAnalysisData
    with DiagnosticableTreeMixin {
  const _$ArtworkQuarantineAnalysisDataImpl(
      {required this.fileName,
      required this.analysisDate,
      required this.note,
      required final List<ArtworkColorSpecification>? colorSpecifications})
      : _colorSpecifications = colorSpecifications,
        super._();

  factory _$ArtworkQuarantineAnalysisDataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ArtworkQuarantineAnalysisDataImplFromJson(json);

  @override
  final String? fileName;
  @override
  final DateTime? analysisDate;
  @override
  final String note;
  final List<ArtworkColorSpecification>? _colorSpecifications;
  @override
  List<ArtworkColorSpecification>? get colorSpecifications {
    final value = _colorSpecifications;
    if (value == null) return null;
    if (_colorSpecifications is EqualUnmodifiableListView)
      return _colorSpecifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ArtworkQuarantineAnalysisData(fileName: $fileName, analysisDate: $analysisDate, note: $note, colorSpecifications: $colorSpecifications)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ArtworkQuarantineAnalysisData'))
      ..add(DiagnosticsProperty('fileName', fileName))
      ..add(DiagnosticsProperty('analysisDate', analysisDate))
      ..add(DiagnosticsProperty('note', note))
      ..add(DiagnosticsProperty('colorSpecifications', colorSpecifications));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtworkQuarantineAnalysisDataImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.analysisDate, analysisDate) ||
                other.analysisDate == analysisDate) &&
            (identical(other.note, note) || other.note == note) &&
            const DeepCollectionEquality()
                .equals(other._colorSpecifications, _colorSpecifications));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fileName, analysisDate, note,
      const DeepCollectionEquality().hash(_colorSpecifications));

  /// Create a copy of ArtworkQuarantineAnalysisData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtworkQuarantineAnalysisDataImplCopyWith<
          _$ArtworkQuarantineAnalysisDataImpl>
      get copyWith => __$$ArtworkQuarantineAnalysisDataImplCopyWithImpl<
          _$ArtworkQuarantineAnalysisDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtworkQuarantineAnalysisDataImplToJson(
      this,
    );
  }
}

abstract class _ArtworkQuarantineAnalysisData
    extends ArtworkQuarantineAnalysisData {
  const factory _ArtworkQuarantineAnalysisData(
      {required final String? fileName,
      required final DateTime? analysisDate,
      required final String note,
      required final List<ArtworkColorSpecification>?
          colorSpecifications}) = _$ArtworkQuarantineAnalysisDataImpl;
  const _ArtworkQuarantineAnalysisData._() : super._();

  factory _ArtworkQuarantineAnalysisData.fromJson(Map<String, dynamic> json) =
      _$ArtworkQuarantineAnalysisDataImpl.fromJson;

  @override
  String? get fileName;
  @override
  DateTime? get analysisDate;
  @override
  String get note;
  @override
  List<ArtworkColorSpecification>? get colorSpecifications;

  /// Create a copy of ArtworkQuarantineAnalysisData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArtworkQuarantineAnalysisDataImplCopyWith<
          _$ArtworkQuarantineAnalysisDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ArtworkQuarantineArtworkData _$ArtworkQuarantineArtworkDataFromJson(
    Map<String, dynamic> json) {
  return _ArtworkQuarantineArtworkData.fromJson(json);
}

/// @nodoc
mixin _$ArtworkQuarantineArtworkData {
  double? get width => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  double? get cornerRadius => throw _privateConstructorUsedError;
  String? get originalFilePath => throw _privateConstructorUsedError;
  List<ArtworkColor> get colors => throw _privateConstructorUsedError;

  /// Serializes this ArtworkQuarantineArtworkData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArtworkQuarantineArtworkData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArtworkQuarantineArtworkDataCopyWith<ArtworkQuarantineArtworkData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtworkQuarantineArtworkDataCopyWith<$Res> {
  factory $ArtworkQuarantineArtworkDataCopyWith(
          ArtworkQuarantineArtworkData value,
          $Res Function(ArtworkQuarantineArtworkData) then) =
      _$ArtworkQuarantineArtworkDataCopyWithImpl<$Res,
          ArtworkQuarantineArtworkData>;
  @useResult
  $Res call(
      {double? width,
      double? height,
      double? cornerRadius,
      String? originalFilePath,
      List<ArtworkColor> colors});
}

/// @nodoc
class _$ArtworkQuarantineArtworkDataCopyWithImpl<$Res,
        $Val extends ArtworkQuarantineArtworkData>
    implements $ArtworkQuarantineArtworkDataCopyWith<$Res> {
  _$ArtworkQuarantineArtworkDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArtworkQuarantineArtworkData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? cornerRadius = freezed,
    Object? originalFilePath = freezed,
    Object? colors = null,
  }) {
    return _then(_value.copyWith(
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      cornerRadius: freezed == cornerRadius
          ? _value.cornerRadius
          : cornerRadius // ignore: cast_nullable_to_non_nullable
              as double?,
      originalFilePath: freezed == originalFilePath
          ? _value.originalFilePath
          : originalFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<ArtworkColor>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtworkQuarantineArtworkDataImplCopyWith<$Res>
    implements $ArtworkQuarantineArtworkDataCopyWith<$Res> {
  factory _$$ArtworkQuarantineArtworkDataImplCopyWith(
          _$ArtworkQuarantineArtworkDataImpl value,
          $Res Function(_$ArtworkQuarantineArtworkDataImpl) then) =
      __$$ArtworkQuarantineArtworkDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? width,
      double? height,
      double? cornerRadius,
      String? originalFilePath,
      List<ArtworkColor> colors});
}

/// @nodoc
class __$$ArtworkQuarantineArtworkDataImplCopyWithImpl<$Res>
    extends _$ArtworkQuarantineArtworkDataCopyWithImpl<$Res,
        _$ArtworkQuarantineArtworkDataImpl>
    implements _$$ArtworkQuarantineArtworkDataImplCopyWith<$Res> {
  __$$ArtworkQuarantineArtworkDataImplCopyWithImpl(
      _$ArtworkQuarantineArtworkDataImpl _value,
      $Res Function(_$ArtworkQuarantineArtworkDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArtworkQuarantineArtworkData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? cornerRadius = freezed,
    Object? originalFilePath = freezed,
    Object? colors = null,
  }) {
    return _then(_$ArtworkQuarantineArtworkDataImpl(
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      cornerRadius: freezed == cornerRadius
          ? _value.cornerRadius
          : cornerRadius // ignore: cast_nullable_to_non_nullable
              as double?,
      originalFilePath: freezed == originalFilePath
          ? _value.originalFilePath
          : originalFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      colors: null == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<ArtworkColor>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtworkQuarantineArtworkDataImpl extends _ArtworkQuarantineArtworkData
    with DiagnosticableTreeMixin {
  const _$ArtworkQuarantineArtworkDataImpl(
      {required this.width,
      required this.height,
      required this.cornerRadius,
      required this.originalFilePath,
      required final List<ArtworkColor> colors})
      : _colors = colors,
        super._();

  factory _$ArtworkQuarantineArtworkDataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ArtworkQuarantineArtworkDataImplFromJson(json);

  @override
  final double? width;
  @override
  final double? height;
  @override
  final double? cornerRadius;
  @override
  final String? originalFilePath;
  final List<ArtworkColor> _colors;
  @override
  List<ArtworkColor> get colors {
    if (_colors is EqualUnmodifiableListView) return _colors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ArtworkQuarantineArtworkData(width: $width, height: $height, cornerRadius: $cornerRadius, originalFilePath: $originalFilePath, colors: $colors)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ArtworkQuarantineArtworkData'))
      ..add(DiagnosticsProperty('width', width))
      ..add(DiagnosticsProperty('height', height))
      ..add(DiagnosticsProperty('cornerRadius', cornerRadius))
      ..add(DiagnosticsProperty('originalFilePath', originalFilePath))
      ..add(DiagnosticsProperty('colors', colors));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtworkQuarantineArtworkDataImpl &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.cornerRadius, cornerRadius) ||
                other.cornerRadius == cornerRadius) &&
            (identical(other.originalFilePath, originalFilePath) ||
                other.originalFilePath == originalFilePath) &&
            const DeepCollectionEquality().equals(other._colors, _colors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, width, height, cornerRadius,
      originalFilePath, const DeepCollectionEquality().hash(_colors));

  /// Create a copy of ArtworkQuarantineArtworkData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtworkQuarantineArtworkDataImplCopyWith<
          _$ArtworkQuarantineArtworkDataImpl>
      get copyWith => __$$ArtworkQuarantineArtworkDataImplCopyWithImpl<
          _$ArtworkQuarantineArtworkDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtworkQuarantineArtworkDataImplToJson(
      this,
    );
  }
}

abstract class _ArtworkQuarantineArtworkData
    extends ArtworkQuarantineArtworkData {
  const factory _ArtworkQuarantineArtworkData(
          {required final double? width,
          required final double? height,
          required final double? cornerRadius,
          required final String? originalFilePath,
          required final List<ArtworkColor> colors}) =
      _$ArtworkQuarantineArtworkDataImpl;
  const _ArtworkQuarantineArtworkData._() : super._();

  factory _ArtworkQuarantineArtworkData.fromJson(Map<String, dynamic> json) =
      _$ArtworkQuarantineArtworkDataImpl.fromJson;

  @override
  double? get width;
  @override
  double? get height;
  @override
  double? get cornerRadius;
  @override
  String? get originalFilePath;
  @override
  List<ArtworkColor> get colors;

  /// Create a copy of ArtworkQuarantineArtworkData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArtworkQuarantineArtworkDataImplCopyWith<
          _$ArtworkQuarantineArtworkDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
