/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class RepeatableDays extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  RepeatableDays._({
    int? id,
    required this.day,
    this.extraInfo,
  }) : super(id);

  factory RepeatableDays({
    int? id,
    required int day,
    String? extraInfo,
  }) = _RepeatableDaysImpl;

  factory RepeatableDays.fromJson(Map<String, dynamic> jsonSerialization) {
    return RepeatableDays(
      id: jsonSerialization['id'] as int?,
      day: jsonSerialization['day'] as int,
      extraInfo: jsonSerialization['extraInfo'] as String?,
    );
  }

  static final t = RepeatableDaysTable();

  static const db = RepeatableDaysRepository._();

  int day;

  String? extraInfo;

  int? _goalDaysGoalId;

  @override
  _i1.Table get table => t;

  RepeatableDays copyWith({
    int? id,
    int? day,
    String? extraInfo,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'day': day,
      if (extraInfo != null) 'extraInfo': extraInfo,
      if (_goalDaysGoalId != null) '_goalDaysGoalId': _goalDaysGoalId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'day': day,
      if (extraInfo != null) 'extraInfo': extraInfo,
    };
  }

  static RepeatableDaysInclude include() {
    return RepeatableDaysInclude._();
  }

  static RepeatableDaysIncludeList includeList({
    _i1.WhereExpressionBuilder<RepeatableDaysTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RepeatableDaysTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RepeatableDaysTable>? orderByList,
    RepeatableDaysInclude? include,
  }) {
    return RepeatableDaysIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RepeatableDays.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RepeatableDays.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RepeatableDaysImpl extends RepeatableDays {
  _RepeatableDaysImpl({
    int? id,
    required int day,
    String? extraInfo,
  }) : super._(
          id: id,
          day: day,
          extraInfo: extraInfo,
        );

  @override
  RepeatableDays copyWith({
    Object? id = _Undefined,
    int? day,
    Object? extraInfo = _Undefined,
  }) {
    return RepeatableDays(
      id: id is int? ? id : this.id,
      day: day ?? this.day,
      extraInfo: extraInfo is String? ? extraInfo : this.extraInfo,
    );
  }
}

class RepeatableDaysImplicit extends _RepeatableDaysImpl {
  RepeatableDaysImplicit._({
    int? id,
    required int day,
    String? extraInfo,
    this.$_goalDaysGoalId,
  }) : super(
          id: id,
          day: day,
          extraInfo: extraInfo,
        );

  factory RepeatableDaysImplicit(
    RepeatableDays repeatableDays, {
    int? $_goalDaysGoalId,
  }) {
    return RepeatableDaysImplicit._(
      id: repeatableDays.id,
      day: repeatableDays.day,
      extraInfo: repeatableDays.extraInfo,
      $_goalDaysGoalId: $_goalDaysGoalId,
    );
  }

  int? $_goalDaysGoalId;

  @override
  Map<String, dynamic> toJson() {
    var jsonMap = super.toJson();
    jsonMap.addAll({'_goalDaysGoalId': $_goalDaysGoalId});
    return jsonMap;
  }
}

class RepeatableDaysTable extends _i1.Table {
  RepeatableDaysTable({super.tableRelation})
      : super(tableName: 'repeatable_days') {
    day = _i1.ColumnInt(
      'day',
      this,
    );
    extraInfo = _i1.ColumnString(
      'extraInfo',
      this,
    );
    $_goalDaysGoalId = _i1.ColumnInt(
      '_goalDaysGoalId',
      this,
    );
  }

  late final _i1.ColumnInt day;

  late final _i1.ColumnString extraInfo;

  late final _i1.ColumnInt $_goalDaysGoalId;

  @override
  List<_i1.Column> get columns => [
        id,
        day,
        extraInfo,
        $_goalDaysGoalId,
      ];
}

class RepeatableDaysInclude extends _i1.IncludeObject {
  RepeatableDaysInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => RepeatableDays.t;
}

class RepeatableDaysIncludeList extends _i1.IncludeList {
  RepeatableDaysIncludeList._({
    _i1.WhereExpressionBuilder<RepeatableDaysTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RepeatableDays.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => RepeatableDays.t;
}

class RepeatableDaysRepository {
  const RepeatableDaysRepository._();

  Future<List<RepeatableDays>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RepeatableDaysTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RepeatableDaysTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RepeatableDaysTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<RepeatableDays>(
      where: where?.call(RepeatableDays.t),
      orderBy: orderBy?.call(RepeatableDays.t),
      orderByList: orderByList?.call(RepeatableDays.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<RepeatableDays?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RepeatableDaysTable>? where,
    int? offset,
    _i1.OrderByBuilder<RepeatableDaysTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RepeatableDaysTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<RepeatableDays>(
      where: where?.call(RepeatableDays.t),
      orderBy: orderBy?.call(RepeatableDays.t),
      orderByList: orderByList?.call(RepeatableDays.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<RepeatableDays?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<RepeatableDays>(
      id,
      transaction: transaction,
    );
  }

  Future<List<RepeatableDays>> insert(
    _i1.Session session,
    List<RepeatableDays> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<RepeatableDays>(
      rows,
      transaction: transaction,
    );
  }

  Future<RepeatableDays> insertRow(
    _i1.Session session,
    RepeatableDays row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RepeatableDays>(
      row,
      transaction: transaction,
    );
  }

  Future<List<RepeatableDays>> update(
    _i1.Session session,
    List<RepeatableDays> rows, {
    _i1.ColumnSelections<RepeatableDaysTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<RepeatableDays>(
      rows,
      columns: columns?.call(RepeatableDays.t),
      transaction: transaction,
    );
  }

  Future<RepeatableDays> updateRow(
    _i1.Session session,
    RepeatableDays row, {
    _i1.ColumnSelections<RepeatableDaysTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RepeatableDays>(
      row,
      columns: columns?.call(RepeatableDays.t),
      transaction: transaction,
    );
  }

  Future<List<RepeatableDays>> delete(
    _i1.Session session,
    List<RepeatableDays> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RepeatableDays>(
      rows,
      transaction: transaction,
    );
  }

  Future<RepeatableDays> deleteRow(
    _i1.Session session,
    RepeatableDays row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RepeatableDays>(
      row,
      transaction: transaction,
    );
  }

  Future<List<RepeatableDays>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RepeatableDaysTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RepeatableDays>(
      where: where(RepeatableDays.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RepeatableDaysTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RepeatableDays>(
      where: where?.call(RepeatableDays.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
