// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artwork.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Artwork _$ArtworkFromJson(Map<String, dynamic> json) {
  return _Artwork.fromJson(json);
}

/// @nodoc
mixin _$Artwork {
  String get description => throw _privateConstructorUsedError;
  Customer? get customer => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;
  Trapping get trapping => throw _privateConstructorUsedError;
  double get cornerRadius => throw _privateConstructorUsedError;

  /// En: Bleed
  double get anschnitt => throw _privateConstructorUsedError;
  int get productId => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  List<ArtworkColor> get colors => throw _privateConstructorUsedError;
  List<ArtworkLayer> get layers => throw _privateConstructorUsedError;
  int? get artworkMasterId => throw _privateConstructorUsedError;
  SalesOrder? get salesOrder => throw _privateConstructorUsedError;
  int? get salesOrderId => throw _privateConstructorUsedError;
  ArtworkType? get artworkType => throw _privateConstructorUsedError;
  Product? get product => throw _privateConstructorUsedError;
  int get layerId => throw _privateConstructorUsedError;
  ArtworkPrintProcessType? get printProcessType =>
      throw _privateConstructorUsedError;
  int? get artworkQuarantineId => throw _privateConstructorUsedError;
  List<ArtworkCode> get codes => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  bool get isLocked => throw _privateConstructorUsedError;
  int get abzug => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;
  ArtworkDieCutterType? get dieCutterType => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this Artwork to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Artwork
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArtworkCopyWith<Artwork> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtworkCopyWith<$Res> {
  factory $ArtworkCopyWith(Artwork value, $Res Function(Artwork) then) =
      _$ArtworkCopyWithImpl<$Res, Artwork>;
  @useResult
  $Res call(
      {String description,
      Customer? customer,
      DataMeta meta,
      Trapping trapping,
      double cornerRadius,
      double anschnitt,
      int productId,
      double width,
      double height,
      List<ArtworkColor> colors,
      List<ArtworkLayer> layers,
      int? artworkMasterId,
      SalesOrder? salesOrder,
      int? salesOrderId,
      ArtworkType? artworkType,
      Product? product,
      int layerId,
      ArtworkPrintProcessType? printProcessType,
      int? artworkQuarantineId,
      List<ArtworkCode> codes,
      int version,
      bool isLocked,
      int abzug,
      String reference,
      ArtworkDieCutterType? dieCutterType,
      int? id});

  $CustomerCopyWith<$Res>? get customer;
  $DataMetaCopyWith<$Res> get meta;
  $TrappingCopyWith<$Res> get trapping;
  $SalesOrderCopyWith<$Res>? get salesOrder;
  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class _$ArtworkCopyWithImpl<$Res, $Val extends Artwork>
    implements $ArtworkCopyWith<$Res> {
  _$ArtworkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Artwork
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? customer = freezed,
    Object? meta = null,
    Object? trapping = null,
    Object? cornerRadius = null,
    Object? anschnitt = null,
    Object? productId = null,
    Object? width = null,
    Object? height = null,
    Object? colors = null,
    Object? layers = null,
    Object? artworkMasterId = freezed,
    Object? salesOrder = freezed,
    Object? salesOrderId = freezed,
    Object? artworkType = freezed,
    Object? product = freezed,
    Object? layerId = null,
    Object? printProcessType = freezed,
    Object? artworkQuarantineId = freezed,
    Object? codes = null,
    Object? version = null,
    Object? isLocked = null,
    Object? abzug = null,
    Object? reference = null,
    Object? dieCutterType = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      trapping: null == trapping
          ? _value.trapping
          : trapping // ignore: cast_nullable_to_non_nullable
              as Trapping,
      cornerRadius: null == cornerRadius
          ? _value.cornerRadius
          : cornerRadius // ignore: cast_nullable_to_non_nullable
              as double,
      anschnitt: null == anschnitt
          ? _value.anschnitt
          : anschnitt // ignore: cast_nullable_to_non_nullable
              as double,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<ArtworkColor>,
      layers: null == layers
          ? _value.layers
          : layers // ignore: cast_nullable_to_non_nullable
              as List<ArtworkLayer>,
      artworkMasterId: freezed == artworkMasterId
          ? _value.artworkMasterId
          : artworkMasterId // ignore: cast_nullable_to_non_nullable
              as int?,
      salesOrder: freezed == salesOrder
          ? _value.salesOrder
          : salesOrder // ignore: cast_nullable_to_non_nullable
              as SalesOrder?,
      salesOrderId: freezed == salesOrderId
          ? _value.salesOrderId
          : salesOrderId // ignore: cast_nullable_to_non_nullable
              as int?,
      artworkType: freezed == artworkType
          ? _value.artworkType
          : artworkType // ignore: cast_nullable_to_non_nullable
              as ArtworkType?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      layerId: null == layerId
          ? _value.layerId
          : layerId // ignore: cast_nullable_to_non_nullable
              as int,
      printProcessType: freezed == printProcessType
          ? _value.printProcessType
          : printProcessType // ignore: cast_nullable_to_non_nullable
              as ArtworkPrintProcessType?,
      artworkQuarantineId: freezed == artworkQuarantineId
          ? _value.artworkQuarantineId
          : artworkQuarantineId // ignore: cast_nullable_to_non_nullable
              as int?,
      codes: null == codes
          ? _value.codes
          : codes // ignore: cast_nullable_to_non_nullable
              as List<ArtworkCode>,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      abzug: null == abzug
          ? _value.abzug
          : abzug // ignore: cast_nullable_to_non_nullable
              as int,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      dieCutterType: freezed == dieCutterType
          ? _value.dieCutterType
          : dieCutterType // ignore: cast_nullable_to_non_nullable
              as ArtworkDieCutterType?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of Artwork
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

  /// Create a copy of Artwork
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataMetaCopyWith<$Res> get meta {
    return $DataMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  /// Create a copy of Artwork
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TrappingCopyWith<$Res> get trapping {
    return $TrappingCopyWith<$Res>(_value.trapping, (value) {
      return _then(_value.copyWith(trapping: value) as $Val);
    });
  }

  /// Create a copy of Artwork
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalesOrderCopyWith<$Res>? get salesOrder {
    if (_value.salesOrder == null) {
      return null;
    }

    return $SalesOrderCopyWith<$Res>(_value.salesOrder!, (value) {
      return _then(_value.copyWith(salesOrder: value) as $Val);
    });
  }

  /// Create a copy of Artwork
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArtworkImplCopyWith<$Res> implements $ArtworkCopyWith<$Res> {
  factory _$$ArtworkImplCopyWith(
          _$ArtworkImpl value, $Res Function(_$ArtworkImpl) then) =
      __$$ArtworkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String description,
      Customer? customer,
      DataMeta meta,
      Trapping trapping,
      double cornerRadius,
      double anschnitt,
      int productId,
      double width,
      double height,
      List<ArtworkColor> colors,
      List<ArtworkLayer> layers,
      int? artworkMasterId,
      SalesOrder? salesOrder,
      int? salesOrderId,
      ArtworkType? artworkType,
      Product? product,
      int layerId,
      ArtworkPrintProcessType? printProcessType,
      int? artworkQuarantineId,
      List<ArtworkCode> codes,
      int version,
      bool isLocked,
      int abzug,
      String reference,
      ArtworkDieCutterType? dieCutterType,
      int? id});

  @override
  $CustomerCopyWith<$Res>? get customer;
  @override
  $DataMetaCopyWith<$Res> get meta;
  @override
  $TrappingCopyWith<$Res> get trapping;
  @override
  $SalesOrderCopyWith<$Res>? get salesOrder;
  @override
  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class __$$ArtworkImplCopyWithImpl<$Res>
    extends _$ArtworkCopyWithImpl<$Res, _$ArtworkImpl>
    implements _$$ArtworkImplCopyWith<$Res> {
  __$$ArtworkImplCopyWithImpl(
      _$ArtworkImpl _value, $Res Function(_$ArtworkImpl) _then)
      : super(_value, _then);

  /// Create a copy of Artwork
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? customer = freezed,
    Object? meta = null,
    Object? trapping = null,
    Object? cornerRadius = null,
    Object? anschnitt = null,
    Object? productId = null,
    Object? width = null,
    Object? height = null,
    Object? colors = null,
    Object? layers = null,
    Object? artworkMasterId = freezed,
    Object? salesOrder = freezed,
    Object? salesOrderId = freezed,
    Object? artworkType = freezed,
    Object? product = freezed,
    Object? layerId = null,
    Object? printProcessType = freezed,
    Object? artworkQuarantineId = freezed,
    Object? codes = null,
    Object? version = null,
    Object? isLocked = null,
    Object? abzug = null,
    Object? reference = null,
    Object? dieCutterType = freezed,
    Object? id = freezed,
  }) {
    return _then(_$ArtworkImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      trapping: null == trapping
          ? _value.trapping
          : trapping // ignore: cast_nullable_to_non_nullable
              as Trapping,
      cornerRadius: null == cornerRadius
          ? _value.cornerRadius
          : cornerRadius // ignore: cast_nullable_to_non_nullable
              as double,
      anschnitt: null == anschnitt
          ? _value.anschnitt
          : anschnitt // ignore: cast_nullable_to_non_nullable
              as double,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      colors: null == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<ArtworkColor>,
      layers: null == layers
          ? _value._layers
          : layers // ignore: cast_nullable_to_non_nullable
              as List<ArtworkLayer>,
      artworkMasterId: freezed == artworkMasterId
          ? _value.artworkMasterId
          : artworkMasterId // ignore: cast_nullable_to_non_nullable
              as int?,
      salesOrder: freezed == salesOrder
          ? _value.salesOrder
          : salesOrder // ignore: cast_nullable_to_non_nullable
              as SalesOrder?,
      salesOrderId: freezed == salesOrderId
          ? _value.salesOrderId
          : salesOrderId // ignore: cast_nullable_to_non_nullable
              as int?,
      artworkType: freezed == artworkType
          ? _value.artworkType
          : artworkType // ignore: cast_nullable_to_non_nullable
              as ArtworkType?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      layerId: null == layerId
          ? _value.layerId
          : layerId // ignore: cast_nullable_to_non_nullable
              as int,
      printProcessType: freezed == printProcessType
          ? _value.printProcessType
          : printProcessType // ignore: cast_nullable_to_non_nullable
              as ArtworkPrintProcessType?,
      artworkQuarantineId: freezed == artworkQuarantineId
          ? _value.artworkQuarantineId
          : artworkQuarantineId // ignore: cast_nullable_to_non_nullable
              as int?,
      codes: null == codes
          ? _value._codes
          : codes // ignore: cast_nullable_to_non_nullable
              as List<ArtworkCode>,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      abzug: null == abzug
          ? _value.abzug
          : abzug // ignore: cast_nullable_to_non_nullable
              as int,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      dieCutterType: freezed == dieCutterType
          ? _value.dieCutterType
          : dieCutterType // ignore: cast_nullable_to_non_nullable
              as ArtworkDieCutterType?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtworkImpl extends _Artwork {
  const _$ArtworkImpl(
      {required this.description,
      required this.customer,
      required this.meta,
      required this.trapping,
      required this.cornerRadius,
      required this.anschnitt,
      required this.productId,
      required this.width,
      required this.height,
      required final List<ArtworkColor> colors,
      required final List<ArtworkLayer> layers,
      required this.artworkMasterId,
      required this.salesOrder,
      required this.salesOrderId,
      required this.artworkType,
      required this.product,
      required this.layerId,
      required this.printProcessType,
      required this.artworkQuarantineId,
      required final List<ArtworkCode> codes,
      required this.version,
      required this.isLocked,
      required this.abzug,
      required this.reference,
      required this.dieCutterType,
      this.id})
      : _colors = colors,
        _layers = layers,
        _codes = codes,
        super._();

  factory _$ArtworkImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtworkImplFromJson(json);

  @override
  final String description;
  @override
  final Customer? customer;
  @override
  final DataMeta meta;
  @override
  final Trapping trapping;
  @override
  final double cornerRadius;

  /// En: Bleed
  @override
  final double anschnitt;
  @override
  final int productId;
  @override
  final double width;
  @override
  final double height;
  final List<ArtworkColor> _colors;
  @override
  List<ArtworkColor> get colors {
    if (_colors is EqualUnmodifiableListView) return _colors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  final List<ArtworkLayer> _layers;
  @override
  List<ArtworkLayer> get layers {
    if (_layers is EqualUnmodifiableListView) return _layers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_layers);
  }

  @override
  final int? artworkMasterId;
  @override
  final SalesOrder? salesOrder;
  @override
  final int? salesOrderId;
  @override
  final ArtworkType? artworkType;
  @override
  final Product? product;
  @override
  final int layerId;
  @override
  final ArtworkPrintProcessType? printProcessType;
  @override
  final int? artworkQuarantineId;
  final List<ArtworkCode> _codes;
  @override
  List<ArtworkCode> get codes {
    if (_codes is EqualUnmodifiableListView) return _codes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_codes);
  }

  @override
  final int version;
  @override
  final bool isLocked;
  @override
  final int abzug;
  @override
  final String reference;
  @override
  final ArtworkDieCutterType? dieCutterType;
  @override
  final int? id;

  @override
  String toString() {
    return 'Artwork(description: $description, customer: $customer, meta: $meta, trapping: $trapping, cornerRadius: $cornerRadius, anschnitt: $anschnitt, productId: $productId, width: $width, height: $height, colors: $colors, layers: $layers, artworkMasterId: $artworkMasterId, salesOrder: $salesOrder, salesOrderId: $salesOrderId, artworkType: $artworkType, product: $product, layerId: $layerId, printProcessType: $printProcessType, artworkQuarantineId: $artworkQuarantineId, codes: $codes, version: $version, isLocked: $isLocked, abzug: $abzug, reference: $reference, dieCutterType: $dieCutterType, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtworkImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.trapping, trapping) ||
                other.trapping == trapping) &&
            (identical(other.cornerRadius, cornerRadius) ||
                other.cornerRadius == cornerRadius) &&
            (identical(other.anschnitt, anschnitt) ||
                other.anschnitt == anschnitt) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            const DeepCollectionEquality().equals(other._colors, _colors) &&
            const DeepCollectionEquality().equals(other._layers, _layers) &&
            (identical(other.artworkMasterId, artworkMasterId) ||
                other.artworkMasterId == artworkMasterId) &&
            (identical(other.salesOrder, salesOrder) ||
                other.salesOrder == salesOrder) &&
            (identical(other.salesOrderId, salesOrderId) ||
                other.salesOrderId == salesOrderId) &&
            (identical(other.artworkType, artworkType) ||
                other.artworkType == artworkType) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.layerId, layerId) || other.layerId == layerId) &&
            (identical(other.printProcessType, printProcessType) ||
                other.printProcessType == printProcessType) &&
            (identical(other.artworkQuarantineId, artworkQuarantineId) ||
                other.artworkQuarantineId == artworkQuarantineId) &&
            const DeepCollectionEquality().equals(other._codes, _codes) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.isLocked, isLocked) ||
                other.isLocked == isLocked) &&
            (identical(other.abzug, abzug) || other.abzug == abzug) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.dieCutterType, dieCutterType) ||
                other.dieCutterType == dieCutterType) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        description,
        customer,
        meta,
        trapping,
        cornerRadius,
        anschnitt,
        productId,
        width,
        height,
        const DeepCollectionEquality().hash(_colors),
        const DeepCollectionEquality().hash(_layers),
        artworkMasterId,
        salesOrder,
        salesOrderId,
        artworkType,
        product,
        layerId,
        printProcessType,
        artworkQuarantineId,
        const DeepCollectionEquality().hash(_codes),
        version,
        isLocked,
        abzug,
        reference,
        dieCutterType,
        id
      ]);

  /// Create a copy of Artwork
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtworkImplCopyWith<_$ArtworkImpl> get copyWith =>
      __$$ArtworkImplCopyWithImpl<_$ArtworkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtworkImplToJson(
      this,
    );
  }
}

abstract class _Artwork extends Artwork {
  const factory _Artwork(
      {required final String description,
      required final Customer? customer,
      required final DataMeta meta,
      required final Trapping trapping,
      required final double cornerRadius,
      required final double anschnitt,
      required final int productId,
      required final double width,
      required final double height,
      required final List<ArtworkColor> colors,
      required final List<ArtworkLayer> layers,
      required final int? artworkMasterId,
      required final SalesOrder? salesOrder,
      required final int? salesOrderId,
      required final ArtworkType? artworkType,
      required final Product? product,
      required final int layerId,
      required final ArtworkPrintProcessType? printProcessType,
      required final int? artworkQuarantineId,
      required final List<ArtworkCode> codes,
      required final int version,
      required final bool isLocked,
      required final int abzug,
      required final String reference,
      required final ArtworkDieCutterType? dieCutterType,
      final int? id}) = _$ArtworkImpl;
  const _Artwork._() : super._();

  factory _Artwork.fromJson(Map<String, dynamic> json) = _$ArtworkImpl.fromJson;

  @override
  String get description;
  @override
  Customer? get customer;
  @override
  DataMeta get meta;
  @override
  Trapping get trapping;
  @override
  double get cornerRadius;

  /// En: Bleed
  @override
  double get anschnitt;
  @override
  int get productId;
  @override
  double get width;
  @override
  double get height;
  @override
  List<ArtworkColor> get colors;
  @override
  List<ArtworkLayer> get layers;
  @override
  int? get artworkMasterId;
  @override
  SalesOrder? get salesOrder;
  @override
  int? get salesOrderId;
  @override
  ArtworkType? get artworkType;
  @override
  Product? get product;
  @override
  int get layerId;
  @override
  ArtworkPrintProcessType? get printProcessType;
  @override
  int? get artworkQuarantineId;
  @override
  List<ArtworkCode> get codes;
  @override
  int get version;
  @override
  bool get isLocked;
  @override
  int get abzug;
  @override
  String get reference;
  @override
  ArtworkDieCutterType? get dieCutterType;
  @override
  int? get id;

  /// Create a copy of Artwork
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArtworkImplCopyWith<_$ArtworkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
