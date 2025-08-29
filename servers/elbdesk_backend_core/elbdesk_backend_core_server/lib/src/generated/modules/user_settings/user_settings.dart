/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../modules/user_settings/app_theme.dart' as _i2;
import '../../modules/user_settings/app_locale.dart' as _i3;
import '../../modules/user_settings/user_ribbon_config.dart' as _i4;

abstract class UserSettingsDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  UserSettingsDTO._({
    this.id,
    this.userId,
    required this.appTheme,
    required this.appLocale,
    String? inactiveFloatingOverlayColor,
    required this.inactiveFloatingOverlaySavedColors,
    bool? showTooltips,
    bool? enableTablePrefix,
    bool? reduceMotion,
    bool? dragWindowOutOfMainWindow,
    bool? defaultCollapseCardSections,
    this.collapseCardSection,
    this.recentWindowFilterValues,
    this.ribbonConfigs,
  })  : inactiveFloatingOverlayColor =
            inactiveFloatingOverlayColor ?? '28000000',
        showTooltips = showTooltips ?? true,
        enableTablePrefix = enableTablePrefix ?? true,
        reduceMotion = reduceMotion ?? false,
        dragWindowOutOfMainWindow = dragWindowOutOfMainWindow ?? true,
        defaultCollapseCardSections = defaultCollapseCardSections ?? false;

  factory UserSettingsDTO({
    int? id,
    int? userId,
    required _i2.AppTheme appTheme,
    required _i3.AppLocale appLocale,
    String? inactiveFloatingOverlayColor,
    required List<String> inactiveFloatingOverlaySavedColors,
    bool? showTooltips,
    bool? enableTablePrefix,
    bool? reduceMotion,
    bool? dragWindowOutOfMainWindow,
    bool? defaultCollapseCardSections,
    Map<String, bool>? collapseCardSection,
    Map<String, bool>? recentWindowFilterValues,
    Map<String, _i4.UserRibbonConfigDTO>? ribbonConfigs,
  }) = _UserSettingsDTOImpl;

  factory UserSettingsDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserSettingsDTO(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int?,
      appTheme:
          _i2.AppTheme.fromJson((jsonSerialization['appTheme'] as String)),
      appLocale:
          _i3.AppLocale.fromJson((jsonSerialization['appLocale'] as String)),
      inactiveFloatingOverlayColor:
          jsonSerialization['inactiveFloatingOverlayColor'] as String,
      inactiveFloatingOverlaySavedColors:
          (jsonSerialization['inactiveFloatingOverlaySavedColors'] as List)
              .map((e) => e as String)
              .toList(),
      showTooltips: jsonSerialization['showTooltips'] as bool,
      enableTablePrefix: jsonSerialization['enableTablePrefix'] as bool,
      reduceMotion: jsonSerialization['reduceMotion'] as bool,
      dragWindowOutOfMainWindow:
          jsonSerialization['dragWindowOutOfMainWindow'] as bool,
      defaultCollapseCardSections:
          jsonSerialization['defaultCollapseCardSections'] as bool?,
      collapseCardSection: (jsonSerialization['collapseCardSection'] as Map?)
          ?.map((k, v) => MapEntry(
                k as String,
                v as bool,
              )),
      recentWindowFilterValues:
          (jsonSerialization['recentWindowFilterValues'] as Map?)
              ?.map((k, v) => MapEntry(
                    k as String,
                    v as bool,
                  )),
      ribbonConfigs:
          (jsonSerialization['ribbonConfigs'] as Map?)?.map((k, v) => MapEntry(
                k as String,
                _i4.UserRibbonConfigDTO.fromJson((v as Map<String, dynamic>)),
              )),
    );
  }

  static final t = UserSettingsDTOTable();

  static const db = UserSettingsDTORepository._();

  @override
  int? id;

  int? userId;

  _i2.AppTheme appTheme;

  _i3.AppLocale appLocale;

  String inactiveFloatingOverlayColor;

  List<String> inactiveFloatingOverlaySavedColors;

  bool showTooltips;

  bool enableTablePrefix;

  bool reduceMotion;

  bool dragWindowOutOfMainWindow;

  bool? defaultCollapseCardSections;

  Map<String, bool>? collapseCardSection;

  Map<String, bool>? recentWindowFilterValues;

  Map<String, _i4.UserRibbonConfigDTO>? ribbonConfigs;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [UserSettingsDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserSettingsDTO copyWith({
    int? id,
    int? userId,
    _i2.AppTheme? appTheme,
    _i3.AppLocale? appLocale,
    String? inactiveFloatingOverlayColor,
    List<String>? inactiveFloatingOverlaySavedColors,
    bool? showTooltips,
    bool? enableTablePrefix,
    bool? reduceMotion,
    bool? dragWindowOutOfMainWindow,
    bool? defaultCollapseCardSections,
    Map<String, bool>? collapseCardSection,
    Map<String, bool>? recentWindowFilterValues,
    Map<String, _i4.UserRibbonConfigDTO>? ribbonConfigs,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (userId != null) 'userId': userId,
      'appTheme': appTheme.toJson(),
      'appLocale': appLocale.toJson(),
      'inactiveFloatingOverlayColor': inactiveFloatingOverlayColor,
      'inactiveFloatingOverlaySavedColors':
          inactiveFloatingOverlaySavedColors.toJson(),
      'showTooltips': showTooltips,
      'enableTablePrefix': enableTablePrefix,
      'reduceMotion': reduceMotion,
      'dragWindowOutOfMainWindow': dragWindowOutOfMainWindow,
      if (defaultCollapseCardSections != null)
        'defaultCollapseCardSections': defaultCollapseCardSections,
      if (collapseCardSection != null)
        'collapseCardSection': collapseCardSection?.toJson(),
      if (recentWindowFilterValues != null)
        'recentWindowFilterValues': recentWindowFilterValues?.toJson(),
      if (ribbonConfigs != null)
        'ribbonConfigs': ribbonConfigs?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'appTheme': appTheme.toJson(),
      'appLocale': appLocale.toJson(),
      'inactiveFloatingOverlayColor': inactiveFloatingOverlayColor,
      'inactiveFloatingOverlaySavedColors':
          inactiveFloatingOverlaySavedColors.toJson(),
      'showTooltips': showTooltips,
      'enableTablePrefix': enableTablePrefix,
      'reduceMotion': reduceMotion,
      'dragWindowOutOfMainWindow': dragWindowOutOfMainWindow,
      if (defaultCollapseCardSections != null)
        'defaultCollapseCardSections': defaultCollapseCardSections,
      if (collapseCardSection != null)
        'collapseCardSection': collapseCardSection?.toJson(),
      if (recentWindowFilterValues != null)
        'recentWindowFilterValues': recentWindowFilterValues?.toJson(),
      if (ribbonConfigs != null)
        'ribbonConfigs':
            ribbonConfigs?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static UserSettingsDTOInclude include() {
    return UserSettingsDTOInclude._();
  }

  static UserSettingsDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<UserSettingsDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserSettingsDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserSettingsDTOTable>? orderByList,
    UserSettingsDTOInclude? include,
  }) {
    return UserSettingsDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserSettingsDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserSettingsDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserSettingsDTOImpl extends UserSettingsDTO {
  _UserSettingsDTOImpl({
    int? id,
    int? userId,
    required _i2.AppTheme appTheme,
    required _i3.AppLocale appLocale,
    String? inactiveFloatingOverlayColor,
    required List<String> inactiveFloatingOverlaySavedColors,
    bool? showTooltips,
    bool? enableTablePrefix,
    bool? reduceMotion,
    bool? dragWindowOutOfMainWindow,
    bool? defaultCollapseCardSections,
    Map<String, bool>? collapseCardSection,
    Map<String, bool>? recentWindowFilterValues,
    Map<String, _i4.UserRibbonConfigDTO>? ribbonConfigs,
  }) : super._(
          id: id,
          userId: userId,
          appTheme: appTheme,
          appLocale: appLocale,
          inactiveFloatingOverlayColor: inactiveFloatingOverlayColor,
          inactiveFloatingOverlaySavedColors:
              inactiveFloatingOverlaySavedColors,
          showTooltips: showTooltips,
          enableTablePrefix: enableTablePrefix,
          reduceMotion: reduceMotion,
          dragWindowOutOfMainWindow: dragWindowOutOfMainWindow,
          defaultCollapseCardSections: defaultCollapseCardSections,
          collapseCardSection: collapseCardSection,
          recentWindowFilterValues: recentWindowFilterValues,
          ribbonConfigs: ribbonConfigs,
        );

  /// Returns a shallow copy of this [UserSettingsDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserSettingsDTO copyWith({
    Object? id = _Undefined,
    Object? userId = _Undefined,
    _i2.AppTheme? appTheme,
    _i3.AppLocale? appLocale,
    String? inactiveFloatingOverlayColor,
    List<String>? inactiveFloatingOverlaySavedColors,
    bool? showTooltips,
    bool? enableTablePrefix,
    bool? reduceMotion,
    bool? dragWindowOutOfMainWindow,
    Object? defaultCollapseCardSections = _Undefined,
    Object? collapseCardSection = _Undefined,
    Object? recentWindowFilterValues = _Undefined,
    Object? ribbonConfigs = _Undefined,
  }) {
    return UserSettingsDTO(
      id: id is int? ? id : this.id,
      userId: userId is int? ? userId : this.userId,
      appTheme: appTheme ?? this.appTheme,
      appLocale: appLocale ?? this.appLocale,
      inactiveFloatingOverlayColor:
          inactiveFloatingOverlayColor ?? this.inactiveFloatingOverlayColor,
      inactiveFloatingOverlaySavedColors: inactiveFloatingOverlaySavedColors ??
          this.inactiveFloatingOverlaySavedColors.map((e0) => e0).toList(),
      showTooltips: showTooltips ?? this.showTooltips,
      enableTablePrefix: enableTablePrefix ?? this.enableTablePrefix,
      reduceMotion: reduceMotion ?? this.reduceMotion,
      dragWindowOutOfMainWindow:
          dragWindowOutOfMainWindow ?? this.dragWindowOutOfMainWindow,
      defaultCollapseCardSections: defaultCollapseCardSections is bool?
          ? defaultCollapseCardSections
          : this.defaultCollapseCardSections,
      collapseCardSection: collapseCardSection is Map<String, bool>?
          ? collapseCardSection
          : this.collapseCardSection?.map((
                key0,
                value0,
              ) =>
                  MapEntry(
                    key0,
                    value0,
                  )),
      recentWindowFilterValues: recentWindowFilterValues is Map<String, bool>?
          ? recentWindowFilterValues
          : this.recentWindowFilterValues?.map((
                key0,
                value0,
              ) =>
                  MapEntry(
                    key0,
                    value0,
                  )),
      ribbonConfigs: ribbonConfigs is Map<String, _i4.UserRibbonConfigDTO>?
          ? ribbonConfigs
          : this.ribbonConfigs?.map((
                key0,
                value0,
              ) =>
                  MapEntry(
                    key0,
                    value0.copyWith(),
                  )),
    );
  }
}

class UserSettingsDTOTable extends _i1.Table<int?> {
  UserSettingsDTOTable({super.tableRelation})
      : super(tableName: 'ed_core_user_settings') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    appTheme = _i1.ColumnEnum(
      'appTheme',
      this,
      _i1.EnumSerialization.byName,
    );
    appLocale = _i1.ColumnEnum(
      'appLocale',
      this,
      _i1.EnumSerialization.byName,
    );
    inactiveFloatingOverlayColor = _i1.ColumnString(
      'inactiveFloatingOverlayColor',
      this,
      hasDefault: true,
    );
    inactiveFloatingOverlaySavedColors = _i1.ColumnSerializable(
      'inactiveFloatingOverlaySavedColors',
      this,
    );
    showTooltips = _i1.ColumnBool(
      'showTooltips',
      this,
      hasDefault: true,
    );
    enableTablePrefix = _i1.ColumnBool(
      'enableTablePrefix',
      this,
      hasDefault: true,
    );
    reduceMotion = _i1.ColumnBool(
      'reduceMotion',
      this,
      hasDefault: true,
    );
    dragWindowOutOfMainWindow = _i1.ColumnBool(
      'dragWindowOutOfMainWindow',
      this,
      hasDefault: true,
    );
    defaultCollapseCardSections = _i1.ColumnBool(
      'defaultCollapseCardSections',
      this,
      hasDefault: true,
    );
    collapseCardSection = _i1.ColumnSerializable(
      'collapseCardSection',
      this,
    );
    recentWindowFilterValues = _i1.ColumnSerializable(
      'recentWindowFilterValues',
      this,
    );
    ribbonConfigs = _i1.ColumnSerializable(
      'ribbonConfigs',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnEnum<_i2.AppTheme> appTheme;

  late final _i1.ColumnEnum<_i3.AppLocale> appLocale;

  late final _i1.ColumnString inactiveFloatingOverlayColor;

  late final _i1.ColumnSerializable inactiveFloatingOverlaySavedColors;

  late final _i1.ColumnBool showTooltips;

  late final _i1.ColumnBool enableTablePrefix;

  late final _i1.ColumnBool reduceMotion;

  late final _i1.ColumnBool dragWindowOutOfMainWindow;

  late final _i1.ColumnBool defaultCollapseCardSections;

  late final _i1.ColumnSerializable collapseCardSection;

  late final _i1.ColumnSerializable recentWindowFilterValues;

  late final _i1.ColumnSerializable ribbonConfigs;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        appTheme,
        appLocale,
        inactiveFloatingOverlayColor,
        inactiveFloatingOverlaySavedColors,
        showTooltips,
        enableTablePrefix,
        reduceMotion,
        dragWindowOutOfMainWindow,
        defaultCollapseCardSections,
        collapseCardSection,
        recentWindowFilterValues,
        ribbonConfigs,
      ];
}

class UserSettingsDTOInclude extends _i1.IncludeObject {
  UserSettingsDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => UserSettingsDTO.t;
}

class UserSettingsDTOIncludeList extends _i1.IncludeList {
  UserSettingsDTOIncludeList._({
    _i1.WhereExpressionBuilder<UserSettingsDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserSettingsDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => UserSettingsDTO.t;
}

class UserSettingsDTORepository {
  const UserSettingsDTORepository._();

  /// Returns a list of [UserSettingsDTO]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<UserSettingsDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserSettingsDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserSettingsDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserSettingsDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<UserSettingsDTO>(
      where: where?.call(UserSettingsDTO.t),
      orderBy: orderBy?.call(UserSettingsDTO.t),
      orderByList: orderByList?.call(UserSettingsDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [UserSettingsDTO] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<UserSettingsDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserSettingsDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserSettingsDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserSettingsDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<UserSettingsDTO>(
      where: where?.call(UserSettingsDTO.t),
      orderBy: orderBy?.call(UserSettingsDTO.t),
      orderByList: orderByList?.call(UserSettingsDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [UserSettingsDTO] by its [id] or null if no such row exists.
  Future<UserSettingsDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<UserSettingsDTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [UserSettingsDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [UserSettingsDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<UserSettingsDTO>> insert(
    _i1.Session session,
    List<UserSettingsDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserSettingsDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [UserSettingsDTO] and returns the inserted row.
  ///
  /// The returned [UserSettingsDTO] will have its `id` field set.
  Future<UserSettingsDTO> insertRow(
    _i1.Session session,
    UserSettingsDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserSettingsDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [UserSettingsDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UserSettingsDTO>> update(
    _i1.Session session,
    List<UserSettingsDTO> rows, {
    _i1.ColumnSelections<UserSettingsDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserSettingsDTO>(
      rows,
      columns: columns?.call(UserSettingsDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserSettingsDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserSettingsDTO> updateRow(
    _i1.Session session,
    UserSettingsDTO row, {
    _i1.ColumnSelections<UserSettingsDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserSettingsDTO>(
      row,
      columns: columns?.call(UserSettingsDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [UserSettingsDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UserSettingsDTO>> delete(
    _i1.Session session,
    List<UserSettingsDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserSettingsDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [UserSettingsDTO].
  Future<UserSettingsDTO> deleteRow(
    _i1.Session session,
    UserSettingsDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserSettingsDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<UserSettingsDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserSettingsDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserSettingsDTO>(
      where: where(UserSettingsDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserSettingsDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserSettingsDTO>(
      where: where?.call(UserSettingsDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
