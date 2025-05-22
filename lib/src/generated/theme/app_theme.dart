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

abstract class AppTheme
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  AppTheme._({
    this.id,
    required this.validFrom,
    required this.validUntil,
    this.disabled,
    this.primaryColor,
    this.mainGradientFirstColor,
    this.mainGradientSecondColor,
    this.backgroundColor,
  });

  factory AppTheme({
    int? id,
    required DateTime validFrom,
    required DateTime validUntil,
    bool? disabled,
    String? primaryColor,
    String? mainGradientFirstColor,
    String? mainGradientSecondColor,
    String? backgroundColor,
  }) = _AppThemeImpl;

  factory AppTheme.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppTheme(
      id: jsonSerialization['id'] as int?,
      validFrom:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['validFrom']),
      validUntil:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['validUntil']),
      disabled: jsonSerialization['disabled'] as bool?,
      primaryColor: jsonSerialization['primaryColor'] as String?,
      mainGradientFirstColor:
          jsonSerialization['mainGradientFirstColor'] as String?,
      mainGradientSecondColor:
          jsonSerialization['mainGradientSecondColor'] as String?,
      backgroundColor: jsonSerialization['backgroundColor'] as String?,
    );
  }

  static final t = AppThemeTable();

  static const db = AppThemeRepository._();

  @override
  int? id;

  DateTime validFrom;

  DateTime validUntil;

  bool? disabled;

  String? primaryColor;

  String? mainGradientFirstColor;

  String? mainGradientSecondColor;

  String? backgroundColor;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [AppTheme]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AppTheme copyWith({
    int? id,
    DateTime? validFrom,
    DateTime? validUntil,
    bool? disabled,
    String? primaryColor,
    String? mainGradientFirstColor,
    String? mainGradientSecondColor,
    String? backgroundColor,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'validFrom': validFrom.toJson(),
      'validUntil': validUntil.toJson(),
      if (disabled != null) 'disabled': disabled,
      if (primaryColor != null) 'primaryColor': primaryColor,
      if (mainGradientFirstColor != null)
        'mainGradientFirstColor': mainGradientFirstColor,
      if (mainGradientSecondColor != null)
        'mainGradientSecondColor': mainGradientSecondColor,
      if (backgroundColor != null) 'backgroundColor': backgroundColor,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'validFrom': validFrom.toJson(),
      'validUntil': validUntil.toJson(),
      if (disabled != null) 'disabled': disabled,
      if (primaryColor != null) 'primaryColor': primaryColor,
      if (mainGradientFirstColor != null)
        'mainGradientFirstColor': mainGradientFirstColor,
      if (mainGradientSecondColor != null)
        'mainGradientSecondColor': mainGradientSecondColor,
      if (backgroundColor != null) 'backgroundColor': backgroundColor,
    };
  }

  static AppThemeInclude include() {
    return AppThemeInclude._();
  }

  static AppThemeIncludeList includeList({
    _i1.WhereExpressionBuilder<AppThemeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppThemeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppThemeTable>? orderByList,
    AppThemeInclude? include,
  }) {
    return AppThemeIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AppTheme.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AppTheme.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppThemeImpl extends AppTheme {
  _AppThemeImpl({
    int? id,
    required DateTime validFrom,
    required DateTime validUntil,
    bool? disabled,
    String? primaryColor,
    String? mainGradientFirstColor,
    String? mainGradientSecondColor,
    String? backgroundColor,
  }) : super._(
          id: id,
          validFrom: validFrom,
          validUntil: validUntil,
          disabled: disabled,
          primaryColor: primaryColor,
          mainGradientFirstColor: mainGradientFirstColor,
          mainGradientSecondColor: mainGradientSecondColor,
          backgroundColor: backgroundColor,
        );

  /// Returns a shallow copy of this [AppTheme]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AppTheme copyWith({
    Object? id = _Undefined,
    DateTime? validFrom,
    DateTime? validUntil,
    Object? disabled = _Undefined,
    Object? primaryColor = _Undefined,
    Object? mainGradientFirstColor = _Undefined,
    Object? mainGradientSecondColor = _Undefined,
    Object? backgroundColor = _Undefined,
  }) {
    return AppTheme(
      id: id is int? ? id : this.id,
      validFrom: validFrom ?? this.validFrom,
      validUntil: validUntil ?? this.validUntil,
      disabled: disabled is bool? ? disabled : this.disabled,
      primaryColor: primaryColor is String? ? primaryColor : this.primaryColor,
      mainGradientFirstColor: mainGradientFirstColor is String?
          ? mainGradientFirstColor
          : this.mainGradientFirstColor,
      mainGradientSecondColor: mainGradientSecondColor is String?
          ? mainGradientSecondColor
          : this.mainGradientSecondColor,
      backgroundColor:
          backgroundColor is String? ? backgroundColor : this.backgroundColor,
    );
  }
}

class AppThemeTable extends _i1.Table<int?> {
  AppThemeTable({super.tableRelation}) : super(tableName: 'app_theme') {
    validFrom = _i1.ColumnDateTime(
      'validFrom',
      this,
    );
    validUntil = _i1.ColumnDateTime(
      'validUntil',
      this,
    );
    disabled = _i1.ColumnBool(
      'disabled',
      this,
    );
    primaryColor = _i1.ColumnString(
      'primaryColor',
      this,
    );
    mainGradientFirstColor = _i1.ColumnString(
      'mainGradientFirstColor',
      this,
    );
    mainGradientSecondColor = _i1.ColumnString(
      'mainGradientSecondColor',
      this,
    );
    backgroundColor = _i1.ColumnString(
      'backgroundColor',
      this,
    );
  }

  late final _i1.ColumnDateTime validFrom;

  late final _i1.ColumnDateTime validUntil;

  late final _i1.ColumnBool disabled;

  late final _i1.ColumnString primaryColor;

  late final _i1.ColumnString mainGradientFirstColor;

  late final _i1.ColumnString mainGradientSecondColor;

  late final _i1.ColumnString backgroundColor;

  @override
  List<_i1.Column> get columns => [
        id,
        validFrom,
        validUntil,
        disabled,
        primaryColor,
        mainGradientFirstColor,
        mainGradientSecondColor,
        backgroundColor,
      ];
}

class AppThemeInclude extends _i1.IncludeObject {
  AppThemeInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => AppTheme.t;
}

class AppThemeIncludeList extends _i1.IncludeList {
  AppThemeIncludeList._({
    _i1.WhereExpressionBuilder<AppThemeTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AppTheme.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => AppTheme.t;
}

class AppThemeRepository {
  const AppThemeRepository._();

  /// Returns a list of [AppTheme]s matching the given query parameters.
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
  Future<List<AppTheme>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppThemeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppThemeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppThemeTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<AppTheme>(
      where: where?.call(AppTheme.t),
      orderBy: orderBy?.call(AppTheme.t),
      orderByList: orderByList?.call(AppTheme.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [AppTheme] matching the given query parameters.
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
  Future<AppTheme?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppThemeTable>? where,
    int? offset,
    _i1.OrderByBuilder<AppThemeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppThemeTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<AppTheme>(
      where: where?.call(AppTheme.t),
      orderBy: orderBy?.call(AppTheme.t),
      orderByList: orderByList?.call(AppTheme.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [AppTheme] by its [id] or null if no such row exists.
  Future<AppTheme?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<AppTheme>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [AppTheme]s in the list and returns the inserted rows.
  ///
  /// The returned [AppTheme]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<AppTheme>> insert(
    _i1.Session session,
    List<AppTheme> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<AppTheme>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [AppTheme] and returns the inserted row.
  ///
  /// The returned [AppTheme] will have its `id` field set.
  Future<AppTheme> insertRow(
    _i1.Session session,
    AppTheme row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AppTheme>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [AppTheme]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<AppTheme>> update(
    _i1.Session session,
    List<AppTheme> rows, {
    _i1.ColumnSelections<AppThemeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AppTheme>(
      rows,
      columns: columns?.call(AppTheme.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AppTheme]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AppTheme> updateRow(
    _i1.Session session,
    AppTheme row, {
    _i1.ColumnSelections<AppThemeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AppTheme>(
      row,
      columns: columns?.call(AppTheme.t),
      transaction: transaction,
    );
  }

  /// Deletes all [AppTheme]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<AppTheme>> delete(
    _i1.Session session,
    List<AppTheme> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AppTheme>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [AppTheme].
  Future<AppTheme> deleteRow(
    _i1.Session session,
    AppTheme row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AppTheme>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<AppTheme>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AppThemeTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AppTheme>(
      where: where(AppTheme.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppThemeTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AppTheme>(
      where: where?.call(AppTheme.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
