// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_department.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CompanyDepartment _$CompanyDepartmentFromJson(Map<String, dynamic> json) {
  return _CompanyDepartment.fromJson(json);
}

/// @nodoc
mixin _$CompanyDepartment {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<CompanyEmployee> get companyEmployees =>
      throw _privateConstructorUsedError;
  Contact? get company => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;
  int get companyId => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this CompanyDepartment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CompanyDepartment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompanyDepartmentCopyWith<CompanyDepartment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyDepartmentCopyWith<$Res> {
  factory $CompanyDepartmentCopyWith(
          CompanyDepartment value, $Res Function(CompanyDepartment) then) =
      _$CompanyDepartmentCopyWithImpl<$Res, CompanyDepartment>;
  @useResult
  $Res call(
      {String name,
      String description,
      List<CompanyEmployee> companyEmployees,
      Contact? company,
      DataMeta meta,
      int companyId,
      int? id});

  $ContactCopyWith<$Res>? get company;
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$CompanyDepartmentCopyWithImpl<$Res, $Val extends CompanyDepartment>
    implements $CompanyDepartmentCopyWith<$Res> {
  _$CompanyDepartmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompanyDepartment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? companyEmployees = null,
    Object? company = freezed,
    Object? meta = null,
    Object? companyId = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      companyEmployees: null == companyEmployees
          ? _value.companyEmployees
          : companyEmployees // ignore: cast_nullable_to_non_nullable
              as List<CompanyEmployee>,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Contact?,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of CompanyDepartment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactCopyWith<$Res>? get company {
    if (_value.company == null) {
      return null;
    }

    return $ContactCopyWith<$Res>(_value.company!, (value) {
      return _then(_value.copyWith(company: value) as $Val);
    });
  }

  /// Create a copy of CompanyDepartment
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
abstract class _$$CompanyDepartmentImplCopyWith<$Res>
    implements $CompanyDepartmentCopyWith<$Res> {
  factory _$$CompanyDepartmentImplCopyWith(_$CompanyDepartmentImpl value,
          $Res Function(_$CompanyDepartmentImpl) then) =
      __$$CompanyDepartmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      List<CompanyEmployee> companyEmployees,
      Contact? company,
      DataMeta meta,
      int companyId,
      int? id});

  @override
  $ContactCopyWith<$Res>? get company;
  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$CompanyDepartmentImplCopyWithImpl<$Res>
    extends _$CompanyDepartmentCopyWithImpl<$Res, _$CompanyDepartmentImpl>
    implements _$$CompanyDepartmentImplCopyWith<$Res> {
  __$$CompanyDepartmentImplCopyWithImpl(_$CompanyDepartmentImpl _value,
      $Res Function(_$CompanyDepartmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompanyDepartment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? companyEmployees = null,
    Object? company = freezed,
    Object? meta = null,
    Object? companyId = null,
    Object? id = freezed,
  }) {
    return _then(_$CompanyDepartmentImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      companyEmployees: null == companyEmployees
          ? _value._companyEmployees
          : companyEmployees // ignore: cast_nullable_to_non_nullable
              as List<CompanyEmployee>,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Contact?,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyDepartmentImpl extends _CompanyDepartment {
  const _$CompanyDepartmentImpl(
      {required this.name,
      required this.description,
      required final List<CompanyEmployee> companyEmployees,
      required this.company,
      required this.meta,
      required this.companyId,
      this.id})
      : _companyEmployees = companyEmployees,
        super._();

  factory _$CompanyDepartmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyDepartmentImplFromJson(json);

  @override
  final String name;
  @override
  final String description;
  final List<CompanyEmployee> _companyEmployees;
  @override
  List<CompanyEmployee> get companyEmployees {
    if (_companyEmployees is EqualUnmodifiableListView)
      return _companyEmployees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_companyEmployees);
  }

  @override
  final Contact? company;
  @override
  final DataMeta meta;
  @override
  final int companyId;
  @override
  final int? id;

  @override
  String toString() {
    return 'CompanyDepartment(name: $name, description: $description, companyEmployees: $companyEmployees, company: $company, meta: $meta, companyId: $companyId, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyDepartmentImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._companyEmployees, _companyEmployees) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      const DeepCollectionEquality().hash(_companyEmployees),
      company,
      meta,
      companyId,
      id);

  /// Create a copy of CompanyDepartment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyDepartmentImplCopyWith<_$CompanyDepartmentImpl> get copyWith =>
      __$$CompanyDepartmentImplCopyWithImpl<_$CompanyDepartmentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyDepartmentImplToJson(
      this,
    );
  }
}

abstract class _CompanyDepartment extends CompanyDepartment {
  const factory _CompanyDepartment(
      {required final String name,
      required final String description,
      required final List<CompanyEmployee> companyEmployees,
      required final Contact? company,
      required final DataMeta meta,
      required final int companyId,
      final int? id}) = _$CompanyDepartmentImpl;
  const _CompanyDepartment._() : super._();

  factory _CompanyDepartment.fromJson(Map<String, dynamic> json) =
      _$CompanyDepartmentImpl.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  List<CompanyEmployee> get companyEmployees;
  @override
  Contact? get company;
  @override
  DataMeta get meta;
  @override
  int get companyId;
  @override
  int? get id;

  /// Create a copy of CompanyDepartment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompanyDepartmentImplCopyWith<_$CompanyDepartmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
