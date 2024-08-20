/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class JournalLog extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  JournalLog._({
    int? id,
    required this.goalId,
    this.goal,
    required this.text,
    this.picture,
    this.loggedValue,
    required this.createdAt,
    required this.modifiedAt,
    required this.date,
    this.streak,
  }) : super(id);

  factory JournalLog({
    int? id,
    required int goalId,
    _i2.Goal? goal,
    required String text,
    String? picture,
    double? loggedValue,
    required DateTime createdAt,
    required DateTime modifiedAt,
    required DateTime date,
    bool? streak,
  }) = _JournalLogImpl;

  factory JournalLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return JournalLog(
      id: jsonSerialization['id'] as int?,
      goalId: jsonSerialization['goalId'] as int,
      goal: jsonSerialization['goal'] == null
          ? null
          : _i2.Goal.fromJson(
              (jsonSerialization['goal'] as Map<String, dynamic>)),
      text: jsonSerialization['text'] as String,
      picture: jsonSerialization['picture'] as String?,
      loggedValue: (jsonSerialization['loggedValue'] as num?)?.toDouble(),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      modifiedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['modifiedAt']),
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      streak: jsonSerialization['streak'] as bool?,
    );
  }

  static final t = JournalLogTable();

  static const db = JournalLogRepository._();

  int goalId;

  _i2.Goal? goal;

  String text;

  String? picture;

  double? loggedValue;

  DateTime createdAt;

  DateTime modifiedAt;

  DateTime date;

  bool? streak;

  @override
  _i1.Table get table => t;

  JournalLog copyWith({
    int? id,
    int? goalId,
    _i2.Goal? goal,
    String? text,
    String? picture,
    double? loggedValue,
    DateTime? createdAt,
    DateTime? modifiedAt,
    DateTime? date,
    bool? streak,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'goalId': goalId,
      if (goal != null) 'goal': goal?.toJson(),
      'text': text,
      if (picture != null) 'picture': picture,
      if (loggedValue != null) 'loggedValue': loggedValue,
      'createdAt': createdAt.toJson(),
      'modifiedAt': modifiedAt.toJson(),
      'date': date.toJson(),
      if (streak != null) 'streak': streak,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'goalId': goalId,
      if (goal != null) 'goal': goal?.toJsonForProtocol(),
      'text': text,
      if (picture != null) 'picture': picture,
      if (loggedValue != null) 'loggedValue': loggedValue,
      'createdAt': createdAt.toJson(),
      'modifiedAt': modifiedAt.toJson(),
      'date': date.toJson(),
      if (streak != null) 'streak': streak,
    };
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

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _JournalLogImpl extends JournalLog {
  _JournalLogImpl({
    int? id,
    required int goalId,
    _i2.Goal? goal,
    required String text,
    String? picture,
    double? loggedValue,
    required DateTime createdAt,
    required DateTime modifiedAt,
    required DateTime date,
    bool? streak,
  }) : super._(
          id: id,
          goalId: goalId,
          goal: goal,
          text: text,
          picture: picture,
          loggedValue: loggedValue,
          createdAt: createdAt,
          modifiedAt: modifiedAt,
          date: date,
          streak: streak,
        );

  @override
  JournalLog copyWith({
    Object? id = _Undefined,
    int? goalId,
    Object? goal = _Undefined,
    String? text,
    Object? picture = _Undefined,
    Object? loggedValue = _Undefined,
    DateTime? createdAt,
    DateTime? modifiedAt,
    DateTime? date,
    Object? streak = _Undefined,
  }) {
    return JournalLog(
      id: id is int? ? id : this.id,
      goalId: goalId ?? this.goalId,
      goal: goal is _i2.Goal? ? goal : this.goal?.copyWith(),
      text: text ?? this.text,
      picture: picture is String? ? picture : this.picture,
      loggedValue: loggedValue is double? ? loggedValue : this.loggedValue,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      date: date ?? this.date,
      streak: streak is bool? ? streak : this.streak,
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
    picture = _i1.ColumnString(
      'picture',
      this,
    );
    loggedValue = _i1.ColumnDouble(
      'loggedValue',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    modifiedAt = _i1.ColumnDateTime(
      'modifiedAt',
      this,
    );
    date = _i1.ColumnDateTime(
      'date',
      this,
    );
    streak = _i1.ColumnBool(
      'streak',
      this,
    );
  }

  late final _i1.ColumnInt goalId;

  _i2.GoalTable? _goal;

  late final _i1.ColumnString text;

  late final _i1.ColumnString picture;

  late final _i1.ColumnDouble loggedValue;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime modifiedAt;

  late final _i1.ColumnDateTime date;

  late final _i1.ColumnBool streak;

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
        picture,
        loggedValue,
        createdAt,
        modifiedAt,
        date,
        streak,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'goal') {
      return goal;
    }
    return null;
  }
}

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
    return session.db.find<JournalLog>(
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
    return session.db.findFirstRow<JournalLog>(
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
    return session.db.findById<JournalLog>(
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
    return session.db.insert<JournalLog>(
      rows,
      transaction: transaction,
    );
  }

  Future<JournalLog> insertRow(
    _i1.Session session,
    JournalLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<JournalLog>(
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
    return session.db.update<JournalLog>(
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
    return session.db.updateRow<JournalLog>(
      row,
      columns: columns?.call(JournalLog.t),
      transaction: transaction,
    );
  }

  Future<List<JournalLog>> delete(
    _i1.Session session,
    List<JournalLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<JournalLog>(
      rows,
      transaction: transaction,
    );
  }

  Future<JournalLog> deleteRow(
    _i1.Session session,
    JournalLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<JournalLog>(
      row,
      transaction: transaction,
    );
  }

  Future<List<JournalLog>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<JournalLogTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<JournalLog>(
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
    return session.db.count<JournalLog>(
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
    await session.db.updateRow<JournalLog>(
      $journalLog,
      columns: [JournalLog.t.goalId],
    );
  }
}
