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

abstract class AppTheme implements _i1.TableRow, _i1.ProtocolSerialization {
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
  _i1.Table get table => t;

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

class AppThemeTable extends _i1.Table {
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
  _i1.Table get table => AppTheme.t;
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
  _i1.Table get table => AppTheme.t;
}

class AppThemeRepository {
  const AppThemeRepository._();

  Future<List<AppTheme>> find(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<AppThemeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppThemeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppThemeTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.find<AppTheme>(
      where: where?.call(AppTheme.t),
      orderBy: orderBy?.call(AppTheme.t),
      orderByList: orderByList?.call(AppTheme.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<AppTheme?> findFirstRow(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<AppThemeTable>? where,
    int? offset,
    _i1.OrderByBuilder<AppThemeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppThemeTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.findFirstRow<AppTheme>(
      where: where?.call(AppTheme.t),
      orderBy: orderBy?.call(AppTheme.t),
      orderByList: orderByList?.call(AppTheme.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<AppTheme?> findById(
    _i1.DatabaseAccessor databaseAccessor,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.findById<AppTheme>(
      id,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<AppTheme>> insert(
    _i1.DatabaseAccessor databaseAccessor,
    List<AppTheme> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insert<AppTheme>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<AppTheme> insertRow(
    _i1.DatabaseAccessor databaseAccessor,
    AppTheme row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insertRow<AppTheme>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<AppTheme>> update(
    _i1.DatabaseAccessor databaseAccessor,
    List<AppTheme> rows, {
    _i1.ColumnSelections<AppThemeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.update<AppTheme>(
      rows,
      columns: columns?.call(AppTheme.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<AppTheme> updateRow(
    _i1.DatabaseAccessor databaseAccessor,
    AppTheme row, {
    _i1.ColumnSelections<AppThemeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.updateRow<AppTheme>(
      row,
      columns: columns?.call(AppTheme.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<AppTheme>> delete(
    _i1.DatabaseAccessor databaseAccessor,
    List<AppTheme> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.delete<AppTheme>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<AppTheme> deleteRow(
    _i1.DatabaseAccessor databaseAccessor,
    AppTheme row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteRow<AppTheme>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<AppTheme>> deleteWhere(
    _i1.DatabaseAccessor databaseAccessor, {
    required _i1.WhereExpressionBuilder<AppThemeTable> where,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteWhere<AppTheme>(
      where: where(AppTheme.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<int> count(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<AppThemeTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.count<AppTheme>(
      where: where?.call(AppTheme.t),
      limit: limit,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}
