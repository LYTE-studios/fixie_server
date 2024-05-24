/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class JournalLog extends _i1.TableRow {
  JournalLog._({
    int? id,
    required this.goalId,
    this.goal,
    required this.text,
    required this.date,
    this.picture,
  }) : super(id);

  factory JournalLog({
    int? id,
    required int goalId,
    _i2.Goal? goal,
    required String text,
    required DateTime date,
    String? picture,
  }) = _JournalLogImpl;

  factory JournalLog.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return JournalLog(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      goalId:
          serializationManager.deserialize<int>(jsonSerialization['goalId']),
      goal: serializationManager
          .deserialize<_i2.Goal?>(jsonSerialization['goal']),
      text: serializationManager.deserialize<String>(jsonSerialization['text']),
      date:
          serializationManager.deserialize<DateTime>(jsonSerialization['date']),
      picture: serializationManager
          .deserialize<String?>(jsonSerialization['picture']),
    );
  }

  static final t = JournalLogTable();

  static const db = JournalLogRepository._();

  int goalId;

  _i2.Goal? goal;

  String text;

  DateTime date;

  String? picture;

  @override
  _i1.Table get table => t;

  JournalLog copyWith({
    int? id,
    int? goalId,
    _i2.Goal? goal,
    String? text,
    DateTime? date,
    String? picture,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'goalId': goalId,
      if (goal != null) 'goal': goal?.toJson(),
      'text': text,
      'date': date.toJson(),
      if (picture != null) 'picture': picture,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'goalId': goalId,
      'text': text,
      'date': date,
      'picture': picture,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'goalId': goalId,
      if (goal != null) 'goal': goal?.allToJson(),
      'text': text,
      'date': date.toJson(),
      if (picture != null) 'picture': picture,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'goalId':
        goalId = value;
        return;
      case 'text':
        text = value;
        return;
      case 'date':
        date = value;
        return;
      case 'picture':
        picture = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<JournalLog>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<JournalLogTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
    JournalLogInclude? include,
  }) async {
    return session.db.find<JournalLog>(
      where: where != null ? where(JournalLog.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findRow instead.')
  static Future<JournalLog?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<JournalLogTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
    JournalLogInclude? include,
  }) async {
    return session.db.findSingleRow<JournalLog>(
      where: where != null ? where(JournalLog.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<JournalLog?> findById(
    _i1.Session session,
    int id, {
    JournalLogInclude? include,
  }) async {
    return session.db.findById<JournalLog>(
      id,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<JournalLogTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<JournalLog>(
      where: where(JournalLog.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    JournalLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.update instead.')
  static Future<bool> update(
    _i1.Session session,
    JournalLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  @Deprecated(
      'Will be removed in 2.0.0. Use: db.insert instead. Important note: In db.insert, the object you pass in is no longer modified, instead a new copy with the added row is returned which contains the inserted id.')
  static Future<void> insert(
    _i1.Session session,
    JournalLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.count instead.')
  static Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<JournalLogTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<JournalLog>(
      where: where != null ? where(JournalLog.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static JournalLogInclude include({_i2.GoalInclude? goal}) {
    return JournalLogInclude._(goal: goal);
  }

  static JournalLogIncludeList includeList({
    _i1.WhereExpressionBuilder<JournalLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<JournalLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<JournalLogTable>? orderByList,
    JournalLogInclude? include,
  }) {
    return JournalLogIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(JournalLog.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(JournalLog.t),
      include: include,
    );
  }
}

class _Undefined {}

class _JournalLogImpl extends JournalLog {
  _JournalLogImpl({
    int? id,
    required int goalId,
    _i2.Goal? goal,
    required String text,
    required DateTime date,
    String? picture,
  }) : super._(
          id: id,
          goalId: goalId,
          goal: goal,
          text: text,
          date: date,
          picture: picture,
        );

  @override
  JournalLog copyWith({
    Object? id = _Undefined,
    int? goalId,
    Object? goal = _Undefined,
    String? text,
    DateTime? date,
    Object? picture = _Undefined,
  }) {
    return JournalLog(
      id: id is int? ? id : this.id,
      goalId: goalId ?? this.goalId,
      goal: goal is _i2.Goal? ? goal : this.goal?.copyWith(),
      text: text ?? this.text,
      date: date ?? this.date,
      picture: picture is String? ? picture : this.picture,
    );
  }
}

class JournalLogTable extends _i1.Table {
  JournalLogTable({super.tableRelation}) : super(tableName: 'journal_log') {
    goalId = _i1.ColumnInt(
      'goalId',
      this,
    );
    text = _i1.ColumnString(
      'text',
      this,
    );
    date = _i1.ColumnDateTime(
      'date',
      this,
    );
    picture = _i1.ColumnString(
      'picture',
      this,
    );
  }

  late final _i1.ColumnInt goalId;

  _i2.GoalTable? _goal;

  late final _i1.ColumnString text;

  late final _i1.ColumnDateTime date;

  late final _i1.ColumnString picture;

  _i2.GoalTable get goal {
    if (_goal != null) return _goal!;
    _goal = _i1.createRelationTable(
      relationFieldName: 'goal',
      field: JournalLog.t.goalId,
      foreignField: _i2.Goal.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.GoalTable(tableRelation: foreignTableRelation),
    );
    return _goal!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        goalId,
        text,
        date,
        picture,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'goal') {
      return goal;
    }
    return null;
  }
}

@Deprecated('Use JournalLogTable.t instead.')
JournalLogTable tJournalLog = JournalLogTable();

class JournalLogInclude extends _i1.IncludeObject {
  JournalLogInclude._({_i2.GoalInclude? goal}) {
    _goal = goal;
  }

  _i2.GoalInclude? _goal;

  @override
  Map<String, _i1.Include?> get includes => {'goal': _goal};

  @override
  _i1.Table get table => JournalLog.t;
}

class JournalLogIncludeList extends _i1.IncludeList {
  JournalLogIncludeList._({
    _i1.WhereExpressionBuilder<JournalLogTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(JournalLog.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => JournalLog.t;
}

class JournalLogRepository {
  const JournalLogRepository._();

  final attachRow = const JournalLogAttachRowRepository._();

  Future<List<JournalLog>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<JournalLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<JournalLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<JournalLogTable>? orderByList,
    _i1.Transaction? transaction,
    JournalLogInclude? include,
  }) async {
    return session.dbNext.find<JournalLog>(
      where: where?.call(JournalLog.t),
      orderBy: orderBy?.call(JournalLog.t),
      orderByList: orderByList?.call(JournalLog.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<JournalLog?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<JournalLogTable>? where,
    int? offset,
    _i1.OrderByBuilder<JournalLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<JournalLogTable>? orderByList,
    _i1.Transaction? transaction,
    JournalLogInclude? include,
  }) async {
    return session.dbNext.findFirstRow<JournalLog>(
      where: where?.call(JournalLog.t),
      orderBy: orderBy?.call(JournalLog.t),
      orderByList: orderByList?.call(JournalLog.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<JournalLog?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    JournalLogInclude? include,
  }) async {
    return session.dbNext.findById<JournalLog>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<JournalLog>> insert(
    _i1.Session session,
    List<JournalLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<JournalLog>(
      rows,
      transaction: transaction,
    );
  }

  Future<JournalLog> insertRow(
    _i1.Session session,
    JournalLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<JournalLog>(
      row,
      transaction: transaction,
    );
  }

  Future<List<JournalLog>> update(
    _i1.Session session,
    List<JournalLog> rows, {
    _i1.ColumnSelections<JournalLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<JournalLog>(
      rows,
      columns: columns?.call(JournalLog.t),
      transaction: transaction,
    );
  }

  Future<JournalLog> updateRow(
    _i1.Session session,
    JournalLog row, {
    _i1.ColumnSelections<JournalLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<JournalLog>(
      row,
      columns: columns?.call(JournalLog.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<JournalLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<JournalLog>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    JournalLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<JournalLog>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<JournalLogTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<JournalLog>(
      where: where(JournalLog.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<JournalLogTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<JournalLog>(
      where: where?.call(JournalLog.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class JournalLogAttachRowRepository {
  const JournalLogAttachRowRepository._();

  Future<void> goal(
    _i1.Session session,
    JournalLog journalLog,
    _i2.Goal goal,
  ) async {
    if (journalLog.id == null) {
      throw ArgumentError.notNull('journalLog.id');
    }
    if (goal.id == null) {
      throw ArgumentError.notNull('goal.id');
    }

    var $journalLog = journalLog.copyWith(goalId: goal.id);
    await session.dbNext.updateRow<JournalLog>(
      $journalLog,
      columns: [JournalLog.t.goalId],
    );
  }
}
