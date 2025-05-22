/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../goals/goal.dart' as _i2;
import '../journals/registration_log.dart' as _i3;

abstract class JournalLog
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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
    List<_i3.RegistrationLog>? registrationLog,
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
              (e) => _i3.RegistrationLog.fromJson((e as Map<String, dynamic>)))
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

  List<_i3.RegistrationLog>? registrationLog;

  DateTime createdAt;

  DateTime modifiedAt;

  DateTime date;

  bool? streak;

  int? currentStreak;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [JournalLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  JournalLog copyWith({
    int? id,
    int? goalId,
    _i2.Goal? goal,
    List<String>? picture,
    String? note,
    double? loggedValue,
    List<_i3.RegistrationLog>? registrationLog,
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
    List<_i3.RegistrationLog>? registrationLog,
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

  /// Returns a shallow copy of this [JournalLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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
      registrationLog: registrationLog is List<_i3.RegistrationLog>?
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

class JournalLogTable extends _i1.Table<int?> {
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
  _i1.Table<int?> get table => JournalLog.t;
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
  _i1.Table<int?> get table => JournalLog.t;
}

class JournalLogRepository {
  const JournalLogRepository._();

  final attachRow = const JournalLogAttachRowRepository._();

  /// Returns a list of [JournalLog]s matching the given query parameters.
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

  /// Returns the first matching [JournalLog] matching the given query parameters.
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

  /// Finds a single [JournalLog] by its [id] or null if no such row exists.
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

  /// Inserts all [JournalLog]s in the list and returns the inserted rows.
  ///
  /// The returned [JournalLog]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
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

  /// Inserts a single [JournalLog] and returns the inserted row.
  ///
  /// The returned [JournalLog] will have its `id` field set.
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

  /// Updates all [JournalLog]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
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

  /// Updates a single [JournalLog]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
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

  /// Deletes all [JournalLog]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
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

  /// Deletes a single [JournalLog].
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

  /// Deletes all rows matching the [where] expression.
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

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
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

  /// Creates a relation between the given [JournalLog] and [Goal]
  /// by setting the [JournalLog]'s foreign key `goalId` to refer to the [Goal].
  Future<void> goal(
    _i1.Session session,
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
    await session.db.updateRow<JournalLog>(
      $journalLog,
      columns: [JournalLog.t.goalId],
      transaction: transaction,
    );
  }
}
