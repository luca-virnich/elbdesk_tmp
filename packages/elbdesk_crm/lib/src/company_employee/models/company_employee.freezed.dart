// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CompanyEmployee _$CompanyEmployeeFromJson(Map<String, dynamic> json) {
  return _CompanyEmployee.fromJson(json);
}

/// @nodoc
mixin _$CompanyEmployee {
  Contact get company => throw _privateConstructorUsedError;
  Contact get employee => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  List<CompanyDepartment>? get departments =>
      throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this CompanyEmployee to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CompanyEmployee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompanyEmployeeCopyWith<CompanyEmployee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyEmployeeCopyWith<$Res> {
  factory $CompanyEmployeeCopyWith(
          CompanyEmployee value, $Res Function(CompanyEmployee) then) =
      _$CompanyEmployeeCopyWithImpl<$Res, CompanyEmployee>;
  @useResult
  $Res call(
      {Contact company,
      Contact employee,
      String position,
      List<CompanyDepartment>? departments,
      bool active,
      String note,
      DataMeta meta,
      int? id});

  $ContactCopyWith<$Res> get company;
  $ContactCopyWith<$Res> get employee;
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$CompanyEmployeeCopyWithImpl<$Res, $Val extends CompanyEmployee>
    implements $CompanyEmployeeCopyWith<$Res> {
  _$CompanyEmployeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompanyEmployee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? company = null,
    Object? employee = null,
    Object? position = null,
    Object? departments = freezed,
    Object? active = null,
    Object? note = null,
    Object? meta = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Contact,
      employee: null == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as Contact,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      departments: freezed == departments
          ? _value.departments
          : departments // ignore: cast_nullable_to_non_nullable
              as List<CompanyDepartment>?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of CompanyEmployee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactCopyWith<$Res> get company {
    return $ContactCopyWith<$Res>(_value.company, (value) {
      return _then(_value.copyWith(company: value) as $Val);
    });
  }

  /// Create a copy of CompanyEmployee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactCopyWith<$Res> get employee {
    return $ContactCopyWith<$Res>(_value.employee, (value) {
      return _then(_value.copyWith(employee: value) as $Val);
    });
  }

  /// Create a copy of CompanyEmployee
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
abstract class _$$CompanyEmployeeImplCopyWith<$Res>
    implements $CompanyEmployeeCopyWith<$Res> {
  factory _$$CompanyEmployeeImplCopyWith(_$CompanyEmployeeImpl value,
          $Res Function(_$CompanyEmployeeImpl) then) =
      __$$CompanyEmployeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Contact company,
      Contact employee,
      String position,
      List<CompanyDepartment>? departments,
      bool active,
      String note,
      DataMeta meta,
      int? id});

  @override
  $ContactCopyWith<$Res> get company;
  @override
  $ContactCopyWith<$Res> get employee;
  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$CompanyEmployeeImplCopyWithImpl<$Res>
    extends _$CompanyEmployeeCopyWithImpl<$Res, _$CompanyEmployeeImpl>
    implements _$$CompanyEmployeeImplCopyWith<$Res> {
  __$$CompanyEmployeeImplCopyWithImpl(
      _$CompanyEmployeeImpl _value, $Res Function(_$CompanyEmployeeImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompanyEmployee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? company = null,
    Object? employee = null,
    Object? position = null,
    Object? departments = freezed,
    Object? active = null,
    Object? note = null,
    Object? meta = null,
    Object? id = freezed,
  }) {
    return _then(_$CompanyEmployeeImpl(
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Contact,
      employee: null == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as Contact,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      departments: freezed == departments
          ? _value._departments
          : departments // ignore: cast_nullable_to_non_nullable
              as List<CompanyDepartment>?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyEmployeeImpl extends _CompanyEmployee {
  const _$CompanyEmployeeImpl(
      {required this.company,
      required this.employee,
      required this.position,
      required final List<CompanyDepartment>? departments,
      required this.active,
      required this.note,
      required this.meta,
      this.id})
      : _departments = departments,
        super._();

  factory _$CompanyEmployeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyEmployeeImplFromJson(json);

  @override
  final Contact company;
  @override
  final Contact employee;
  @override
  final String position;
  final List<CompanyDepartment>? _departments;
  @override
  List<CompanyDepartment>? get departments {
    final value = _departments;
    if (value == null) return null;
    if (_departments is EqualUnmodifiableListView) return _departments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool active;
  @override
  final String note;
  @override
  final DataMeta meta;
  @override
  final int? id;

  @override
  String toString() {
    return 'CompanyEmployee(company: $company, employee: $employee, position: $position, departments: $departments, active: $active, note: $note, meta: $meta, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyEmployeeImpl &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.employee, employee) ||
                other.employee == employee) &&
            (identical(other.position, position) ||
                other.position == position) &&
            const DeepCollectionEquality()
                .equals(other._departments, _departments) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      company,
      employee,
      position,
      const DeepCollectionEquality().hash(_departments),
      active,
      note,
      meta,
      id);

  /// Create a copy of CompanyEmployee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyEmployeeImplCopyWith<_$CompanyEmployeeImpl> get copyWith =>
      __$$CompanyEmployeeImplCopyWithImpl<_$CompanyEmployeeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyEmployeeImplToJson(
      this,
    );
  }
}

abstract class _CompanyEmployee extends CompanyEmployee {
  const factory _CompanyEmployee(
      {required final Contact company,
      required final Contact employee,
      required final String position,
      required final List<CompanyDepartment>? departments,
      required final bool active,
      required final String note,
      required final DataMeta meta,
      final int? id}) = _$CompanyEmployeeImpl;
  const _CompanyEmployee._() : super._();

  factory _CompanyEmployee.fromJson(Map<String, dynamic> json) =
      _$CompanyEmployeeImpl.fromJson;

  @override
  Contact get company;
  @override
  Contact get employee;
  @override
  String get position;
  @override
  List<CompanyDepartment>? get departments;
  @override
  bool get active;
  @override
  String get note;
  @override
  DataMeta get meta;
  @override
  int? get id;

  /// Create a copy of CompanyEmployee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompanyEmployeeImplCopyWith<_$CompanyEmployeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
