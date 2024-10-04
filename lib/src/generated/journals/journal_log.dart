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
import '../protocol.dart' as _i2;

abstract class JournalLog implements _i1.TableRow, _i1.ProtocolSerialization {
  JournalLog._({
    this.id,
    required this.goalId,
    this.goal,
    this.picture,
    required this.note,
    this.loggedValue,
    this.registrationLog,
    required this.createdAt,
    required this.modifiedAt,
    required this.date,
    this.streak,
    this.currentStreak,
  });

  factory JournalLog({
    int? id,
    required int goalId,
    _i2.Goal? goal,
    List<String>? picture,
    required String note,
    double? loggedValue,
    List<_i2.RegistrationLog>? registrationLog,
    required DateTime createdAt,
    required DateTime modifiedAt,
    required DateTime date,
    bool? streak,
    int? currentStreak,
  }) = _JournalLogImpl;

  factory JournalLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return JournalLog(
      id: jsonSerialization['id'] as int?,
      goalId: jsonSerialization['goalId'] as int,
      goal: jsonSerialization['goal'] == null
          ? null
          : _i2.Goal.fromJson(
              (jsonSerialization['goal'] as Map<String, dynamic>)),
      picture: (jsonSerialization['picture'] as List?)
          ?.map((e) => e as String)
          .toList(),
      note: jsonSerialization['note'] as String,
      loggedValue: (jsonSerialization['loggedValue'] as num?)?.toDouble(),
      registrationLog: (jsonSerialization['registrationLog'] as List?)
          ?.map(
              (e) => _i2.RegistrationLog.fromJson((e as Map<String, dynamic>)))
          .toList(),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      modifiedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['modifiedAt']),
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      streak: jsonSerialization['streak'] as bool?,
      currentStreak: jsonSerialization['currentStreak'] as int?,
    );
  }

  static final t = JournalLogTable();

  static const db = JournalLogRepository._();

  @override
  int? id;

  int goalId;

  _i2.Goal? goal;

  List<String>? picture;

  String note;

  double? loggedValue;

  List<_i2.RegistrationLog>? registrationLog;

  DateTime createdAt;

  DateTime modifiedAt;

  DateTime date;

  bool? streak;

  int? currentStreak;

  @override
  _i1.Table get table => t;

  JournalLog copyWith({
    int? id,
    int? goalId,
    _i2.Goal? goal,
    List<String>? picture,
    String? note,
    double? loggedValue,
    List<_i2.RegistrationLog>? registrationLog,
    DateTime? createdAt,
    DateTime? modifiedAt,
    DateTime? date,
    bool? streak,
    int? currentStreak,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'goalId': goalId,
      if (goal != null) 'goal': goal?.toJson(),
      if (picture != null) 'picture': picture?.toJson(),
      'note': note,
      if (loggedValue != null) 'loggedValue': loggedValue,
      if (registrationLog != null)
        'registrationLog':
            registrationLog?.toJson(valueToJson: (v) => v.toJson()),
      'createdAt': createdAt.toJson(),
      'modifiedAt': modifiedAt.toJson(),
      'date': date.toJson(),
      if (streak != null) 'streak': streak,
      if (currentStreak != null) 'currentStreak': currentStreak,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'goalId': goalId,
      if (goal != null) 'goal': goal?.toJsonForProtocol(),
      if (picture != null) 'picture': picture?.toJson(),
      'note': note,
      if (loggedValue != null) 'loggedValue': loggedValue,
      if (registrationLog != null)
        'registrationLog':
            registrationLog?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'createdAt': createdAt.toJson(),
      'modifiedAt': modifiedAt.toJson(),
      'date': date.toJson(),
      if (streak != null) 'streak': streak,
      if (currentStreak != null) 'currentStreak': currentStreak,
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
    List<String>? picture,
    required String note,
    double? loggedValue,
    List<_i2.RegistrationLog>? registrationLog,
    required DateTime createdAt,
    required DateTime modifiedAt,
    required DateTime date,
    bool? streak,
    int? currentStreak,
  }) : super._(
          id: id,
          goalId: goalId,
          goal: goal,
          picture: picture,
          note: note,
          loggedValue: loggedValue,
          registrationLog: registrationLog,
          createdAt: createdAt,
          modifiedAt: modifiedAt,
          date: date,
          streak: streak,
          currentStreak: currentStreak,
        );

  @override
  JournalLog copyWith({
    Object? id = _Undefined,
    int? goalId,
    Object? goal = _Undefined,
    Object? picture = _Undefined,
    String? note,
    Object? loggedValue = _Undefined,
    Object? registrationLog = _Undefined,
    DateTime? createdAt,
    DateTime? modifiedAt,
    DateTime? date,
    Object? streak = _Undefined,
    Object? currentStreak = _Undefined,
  }) {
    return JournalLog(
      id: id is int? ? id : this.id,
      goalId: goalId ?? this.goalId,
      goal: goal is _i2.Goal? ? goal : this.goal?.copyWith(),
      picture: picture is List<String>?
          ? picture
          : this.picture?.map((e0) => e0).toList(),
      note: note ?? this.note,
      loggedValue: loggedValue is double? ? loggedValue : this.loggedValue,
      registrationLog: registrationLog is List<_i2.RegistrationLog>?
          ? registrationLog
          : this.registrationLog?.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      date: date ?? this.date,
      streak: streak is bool? ? streak : this.streak,
      currentStreak: currentStreak is int? ? currentStreak : this.currentStreak,
    );
  }
}

class JournalLogTable extends _i1.Table {
  JournalLogTable({super.tableRelation}) : super(tableName: 'journal_log') {
    goalId = _i1.ColumnInt(
      'goalId',
      this,
    );
    picture = _i1.ColumnSerializable(
      'picture',
      this,
    );
    note = _i1.ColumnString(
      'note',
      this,
    );
    loggedValue = _i1.ColumnDouble(
      'loggedValue',
      this,
    );
    registrationLog = _i1.ColumnSerializable(
      'registrationLog',
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
    currentStreak = _i1.ColumnInt(
      'currentStreak',
      this,
    );
  }

  late final _i1.ColumnInt goalId;

  _i2.GoalTable? _goal;

  late final _i1.ColumnSerializable picture;

  late final _i1.ColumnString note;

  late final _i1.ColumnDouble loggedValue;

  late final _i1.ColumnSerializable registrationLog;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime modifiedAt;

  late final _i1.ColumnDateTime date;

  late final _i1.ColumnBool streak;

  late final _i1.ColumnInt currentStreak;

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
        picture,
        note,
        loggedValue,
        registrationLog,
        createdAt,
        modifiedAt,
        date,
        streak,
        currentStreak,
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
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<JournalLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<JournalLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<JournalLogTable>? orderByList,
    _i1.Transaction? transaction,
    JournalLogInclude? include,
  }) async {
    return databaseAccessor.db.find<JournalLog>(
      where: where?.call(JournalLog.t),
      orderBy: orderBy?.call(JournalLog.t),
      orderByList: orderByList?.call(JournalLog.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<JournalLog?> findFirstRow(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<JournalLogTable>? where,
    int? offset,
    _i1.OrderByBuilder<JournalLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<JournalLogTable>? orderByList,
    _i1.Transaction? transaction,
    JournalLogInclude? include,
  }) async {
    return databaseAccessor.db.findFirstRow<JournalLog>(
      where: where?.call(JournalLog.t),
      orderBy: orderBy?.call(JournalLog.t),
      orderByList: orderByList?.call(JournalLog.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<JournalLog?> findById(
    _i1.DatabaseAccessor databaseAccessor,
    int id, {
    _i1.Transaction? transaction,
    JournalLogInclude? include,
  }) async {
    return databaseAccessor.db.findById<JournalLog>(
      id,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<List<JournalLog>> insert(
    _i1.DatabaseAccessor databaseAccessor,
    List<JournalLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insert<JournalLog>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<JournalLog> insertRow(
    _i1.DatabaseAccessor databaseAccessor,
    JournalLog row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insertRow<JournalLog>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<JournalLog>> update(
    _i1.DatabaseAccessor databaseAccessor,
    List<JournalLog> rows, {
    _i1.ColumnSelections<JournalLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.update<JournalLog>(
      rows,
      columns: columns?.call(JournalLog.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<JournalLog> updateRow(
    _i1.DatabaseAccessor databaseAccessor,
    JournalLog row, {
    _i1.ColumnSelections<JournalLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.updateRow<JournalLog>(
      row,
      columns: columns?.call(JournalLog.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<JournalLog>> delete(
    _i1.DatabaseAccessor databaseAccessor,
    List<JournalLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.delete<JournalLog>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<JournalLog> deleteRow(
    _i1.DatabaseAccessor databaseAccessor,
    JournalLog row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteRow<JournalLog>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<JournalLog>> deleteWhere(
    _i1.DatabaseAccessor databaseAccessor, {
    required _i1.WhereExpressionBuilder<JournalLogTable> where,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteWhere<JournalLog>(
      where: where(JournalLog.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<int> count(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<JournalLogTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.count<JournalLog>(
      where: where?.call(JournalLog.t),
      limit: limit,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class JournalLogAttachRowRepository {
  const JournalLogAttachRowRepository._();

  Future<void> goal(
    _i1.DatabaseAccessor databaseAccessor,
    JournalLog journalLog,
    _i2.Goal goal, {
    _i1.Transaction? transaction,
  }) async {
    if (journalLog.id == null) {
      throw ArgumentError.notNull('journalLog.id');
    }
    if (goal.id == null) {
      throw ArgumentError.notNull('goal.id');
    }

    var $journalLog = journalLog.copyWith(goalId: goal.id);
    await databaseAccessor.db.updateRow<JournalLog>(
      $journalLog,
      columns: [JournalLog.t.goalId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}
