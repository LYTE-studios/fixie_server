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

abstract class Goal extends _i1.TableRow implements _i1.ProtocolSerialization {
  Goal._({
    int? id,
    required this.title,
    required this.userId,
    this.user,
    this.picture,
    required this.target,
    required this.targetPeriod,
    required this.category,
    required this.repetition,
    this.days,
    required this.setEnd,
    this.end,
    required this.setRemind,
    this.remindHour,
    this.remindMinutes,
    this.remindHalf,
    this.remindTimezone,
    this.journal,
    this.currentStreak,
    this.highestStreak,
    this.unit,
  }) : super(id);

  factory Goal({
    int? id,
    required String title,
    required int userId,
    _i2.User? user,
    String? picture,
    required int target,
    required _i2.TargetPeriod targetPeriod,
    required _i2.Category category,
    required _i2.Repetition repetition,
    List<_i2.Days>? days,
    required bool setEnd,
    DateTime? end,
    required bool setRemind,
    int? remindHour,
    int? remindMinutes,
    bool? remindHalf,
    String? remindTimezone,
    List<_i2.JournalLog>? journal,
    int? currentStreak,
    int? highestStreak,
    String? unit,
  }) = _GoalImpl;

  factory Goal.fromJson(Map<String, dynamic> jsonSerialization) {
    return Goal(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      picture: jsonSerialization['picture'] as String?,
      target: jsonSerialization['target'] as int,
      targetPeriod:
          _i2.TargetPeriod.fromJson((jsonSerialization['targetPeriod'] as int)),
      category: _i2.Category.fromJson(
          (jsonSerialization['category'] as Map<String, dynamic>)),
      repetition:
          _i2.Repetition.fromJson((jsonSerialization['repetition'] as String)),
      days: (jsonSerialization['days'] as List?)
          ?.map((e) => _i2.Days.fromJson((e as int)))
          .toList(),
      setEnd: jsonSerialization['setEnd'] as bool,
      end: jsonSerialization['end'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['end']),
      setRemind: jsonSerialization['setRemind'] as bool,
      remindHour: jsonSerialization['remindHour'] as int?,
      remindMinutes: jsonSerialization['remindMinutes'] as int?,
      remindHalf: jsonSerialization['remindHalf'] as bool?,
      remindTimezone: jsonSerialization['remindTimezone'] as String?,
      journal: (jsonSerialization['journal'] as List?)
          ?.map((e) => _i2.JournalLog.fromJson((e as Map<String, dynamic>)))
          .toList(),
      currentStreak: jsonSerialization['currentStreak'] as int?,
      highestStreak: jsonSerialization['highestStreak'] as int?,
      unit: jsonSerialization['unit'] as String?,
    );
  }

  static final t = GoalTable();

  static const db = GoalRepository._();

  String title;

  int userId;

  _i2.User? user;

  String? picture;

  int target;

  _i2.TargetPeriod targetPeriod;

  _i2.Category category;

  _i2.Repetition repetition;

  List<_i2.Days>? days;

  bool setEnd;

  DateTime? end;

  bool setRemind;

  int? remindHour;

  int? remindMinutes;

  bool? remindHalf;

  String? remindTimezone;

  List<_i2.JournalLog>? journal;

  int? currentStreak;

  int? highestStreak;

  String? unit;

  @override
  _i1.Table get table => t;

  Goal copyWith({
    int? id,
    String? title,
    int? userId,
    _i2.User? user,
    String? picture,
    int? target,
    _i2.TargetPeriod? targetPeriod,
    _i2.Category? category,
    _i2.Repetition? repetition,
    List<_i2.Days>? days,
    bool? setEnd,
    DateTime? end,
    bool? setRemind,
    int? remindHour,
    int? remindMinutes,
    bool? remindHalf,
    String? remindTimezone,
    List<_i2.JournalLog>? journal,
    int? currentStreak,
    int? highestStreak,
    String? unit,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      if (picture != null) 'picture': picture,
      'target': target,
      'targetPeriod': targetPeriod.toJson(),
      'category': category.toJson(),
      'repetition': repetition.toJson(),
      if (days != null) 'days': days?.toJson(valueToJson: (v) => v.toJson()),
      'setEnd': setEnd,
      if (end != null) 'end': end?.toJson(),
      'setRemind': setRemind,
      if (remindHour != null) 'remindHour': remindHour,
      if (remindMinutes != null) 'remindMinutes': remindMinutes,
      if (remindHalf != null) 'remindHalf': remindHalf,
      if (remindTimezone != null) 'remindTimezone': remindTimezone,
      if (journal != null)
        'journal': journal?.toJson(valueToJson: (v) => v.toJson()),
      if (currentStreak != null) 'currentStreak': currentStreak,
      if (highestStreak != null) 'highestStreak': highestStreak,
      if (unit != null) 'unit': unit,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      if (picture != null) 'picture': picture,
      'target': target,
      'targetPeriod': targetPeriod.toJson(),
      'category': category.toJsonForProtocol(),
      'repetition': repetition.toJson(),
      if (days != null) 'days': days?.toJson(valueToJson: (v) => v.toJson()),
      'setEnd': setEnd,
      if (end != null) 'end': end?.toJson(),
      'setRemind': setRemind,
      if (remindHour != null) 'remindHour': remindHour,
      if (remindMinutes != null) 'remindMinutes': remindMinutes,
      if (remindHalf != null) 'remindHalf': remindHalf,
      if (remindTimezone != null) 'remindTimezone': remindTimezone,
      if (journal != null)
        'journal': journal?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (currentStreak != null) 'currentStreak': currentStreak,
      if (highestStreak != null) 'highestStreak': highestStreak,
      if (unit != null) 'unit': unit,
    };
  }

  static GoalInclude include({
    _i2.UserInclude? user,
    _i2.JournalLogIncludeList? journal,
  }) {
    return GoalInclude._(
      user: user,
      journal: journal,
    );
  }

  static GoalIncludeList includeList({
    _i1.WhereExpressionBuilder<GoalTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GoalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GoalTable>? orderByList,
    GoalInclude? include,
  }) {
    return GoalIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Goal.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Goal.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GoalImpl extends Goal {
  _GoalImpl({
    int? id,
    required String title,
    required int userId,
    _i2.User? user,
    String? picture,
    required int target,
    required _i2.TargetPeriod targetPeriod,
    required _i2.Category category,
    required _i2.Repetition repetition,
    List<_i2.Days>? days,
    required bool setEnd,
    DateTime? end,
    required bool setRemind,
    int? remindHour,
    int? remindMinutes,
    bool? remindHalf,
    String? remindTimezone,
    List<_i2.JournalLog>? journal,
    int? currentStreak,
    int? highestStreak,
    String? unit,
  }) : super._(
          id: id,
          title: title,
          userId: userId,
          user: user,
          picture: picture,
          target: target,
          targetPeriod: targetPeriod,
          category: category,
          repetition: repetition,
          days: days,
          setEnd: setEnd,
          end: end,
          setRemind: setRemind,
          remindHour: remindHour,
          remindMinutes: remindMinutes,
          remindHalf: remindHalf,
          remindTimezone: remindTimezone,
          journal: journal,
          currentStreak: currentStreak,
          highestStreak: highestStreak,
          unit: unit,
        );

  @override
  Goal copyWith({
    Object? id = _Undefined,
    String? title,
    int? userId,
    Object? user = _Undefined,
    Object? picture = _Undefined,
    int? target,
    _i2.TargetPeriod? targetPeriod,
    _i2.Category? category,
    _i2.Repetition? repetition,
    Object? days = _Undefined,
    bool? setEnd,
    Object? end = _Undefined,
    bool? setRemind,
    Object? remindHour = _Undefined,
    Object? remindMinutes = _Undefined,
    Object? remindHalf = _Undefined,
    Object? remindTimezone = _Undefined,
    Object? journal = _Undefined,
    Object? currentStreak = _Undefined,
    Object? highestStreak = _Undefined,
    Object? unit = _Undefined,
  }) {
    return Goal(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      picture: picture is String? ? picture : this.picture,
      target: target ?? this.target,
      targetPeriod: targetPeriod ?? this.targetPeriod,
      category: category ?? this.category.copyWith(),
      repetition: repetition ?? this.repetition,
      days: days is List<_i2.Days>? ? days : this.days?.clone(),
      setEnd: setEnd ?? this.setEnd,
      end: end is DateTime? ? end : this.end,
      setRemind: setRemind ?? this.setRemind,
      remindHour: remindHour is int? ? remindHour : this.remindHour,
      remindMinutes: remindMinutes is int? ? remindMinutes : this.remindMinutes,
      remindHalf: remindHalf is bool? ? remindHalf : this.remindHalf,
      remindTimezone:
          remindTimezone is String? ? remindTimezone : this.remindTimezone,
      journal:
          journal is List<_i2.JournalLog>? ? journal : this.journal?.clone(),
      currentStreak: currentStreak is int? ? currentStreak : this.currentStreak,
      highestStreak: highestStreak is int? ? highestStreak : this.highestStreak,
      unit: unit is String? ? unit : this.unit,
    );
  }
}

class GoalTable extends _i1.Table {
  GoalTable({super.tableRelation}) : super(tableName: 'goal') {
    title = _i1.ColumnString(
      'title',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    picture = _i1.ColumnString(
      'picture',
      this,
    );
    target = _i1.ColumnInt(
      'target',
      this,
    );
    targetPeriod = _i1.ColumnEnum(
      'targetPeriod',
      this,
      _i1.EnumSerialization.byIndex,
    );
    category = _i1.ColumnSerializable(
      'category',
      this,
    );
    repetition = _i1.ColumnEnum(
      'repetition',
      this,
      _i1.EnumSerialization.byName,
    );
    days = _i1.ColumnSerializable(
      'days',
      this,
    );
    setEnd = _i1.ColumnBool(
      'setEnd',
      this,
    );
    end = _i1.ColumnDateTime(
      'end',
      this,
    );
    setRemind = _i1.ColumnBool(
      'setRemind',
      this,
    );
    remindHour = _i1.ColumnInt(
      'remindHour',
      this,
    );
    remindMinutes = _i1.ColumnInt(
      'remindMinutes',
      this,
    );
    remindHalf = _i1.ColumnBool(
      'remindHalf',
      this,
    );
    remindTimezone = _i1.ColumnString(
      'remindTimezone',
      this,
    );
    currentStreak = _i1.ColumnInt(
      'currentStreak',
      this,
    );
    highestStreak = _i1.ColumnInt(
      'highestStreak',
      this,
    );
    unit = _i1.ColumnString(
      'unit',
      this,
    );
  }

  late final _i1.ColumnString title;

  late final _i1.ColumnInt userId;

  _i2.UserTable? _user;

  late final _i1.ColumnString picture;

  late final _i1.ColumnInt target;

  late final _i1.ColumnEnum<_i2.TargetPeriod> targetPeriod;

  late final _i1.ColumnSerializable category;

  late final _i1.ColumnEnum<_i2.Repetition> repetition;

  late final _i1.ColumnSerializable days;

  late final _i1.ColumnBool setEnd;

  late final _i1.ColumnDateTime end;

  late final _i1.ColumnBool setRemind;

  late final _i1.ColumnInt remindHour;

  late final _i1.ColumnInt remindMinutes;

  late final _i1.ColumnBool remindHalf;

  late final _i1.ColumnString remindTimezone;

  _i2.JournalLogTable? ___journal;

  _i1.ManyRelation<_i2.JournalLogTable>? _journal;

  late final _i1.ColumnInt currentStreak;

  late final _i1.ColumnInt highestStreak;

  late final _i1.ColumnString unit;

  _i2.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: Goal.t.userId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  _i2.JournalLogTable get __journal {
    if (___journal != null) return ___journal!;
    ___journal = _i1.createRelationTable(
      relationFieldName: '__journal',
      field: Goal.t.id,
      foreignField: _i2.JournalLog.t.goalId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.JournalLogTable(tableRelation: foreignTableRelation),
    );
    return ___journal!;
  }

  _i1.ManyRelation<_i2.JournalLogTable> get journal {
    if (_journal != null) return _journal!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'journal',
      field: Goal.t.id,
      foreignField: _i2.JournalLog.t.goalId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.JournalLogTable(tableRelation: foreignTableRelation),
    );
    _journal = _i1.ManyRelation<_i2.JournalLogTable>(
      tableWithRelations: relationTable,
      table: _i2.JournalLogTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _journal!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        title,
        userId,
        picture,
        target,
        targetPeriod,
        category,
        repetition,
        days,
        setEnd,
        end,
        setRemind,
        remindHour,
        remindMinutes,
        remindHalf,
        remindTimezone,
        currentStreak,
        highestStreak,
        unit,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'journal') {
      return __journal;
    }
    return null;
  }
}

class GoalInclude extends _i1.IncludeObject {
  GoalInclude._({
    _i2.UserInclude? user,
    _i2.JournalLogIncludeList? journal,
  }) {
    _user = user;
    _journal = journal;
  }

  _i2.UserInclude? _user;

  _i2.JournalLogIncludeList? _journal;

  @override
  Map<String, _i1.Include?> get includes => {
        'user': _user,
        'journal': _journal,
      };

  @override
  _i1.Table get table => Goal.t;
}

class GoalIncludeList extends _i1.IncludeList {
  GoalIncludeList._({
    _i1.WhereExpressionBuilder<GoalTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Goal.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Goal.t;
}

class GoalRepository {
  const GoalRepository._();

  final attach = const GoalAttachRepository._();

  final attachRow = const GoalAttachRowRepository._();

  final detach = const GoalDetachRepository._();

  final detachRow = const GoalDetachRowRepository._();

  Future<List<Goal>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GoalTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GoalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GoalTable>? orderByList,
    _i1.Transaction? transaction,
    GoalInclude? include,
  }) async {
    return session.db.find<Goal>(
      where: where?.call(Goal.t),
      orderBy: orderBy?.call(Goal.t),
      orderByList: orderByList?.call(Goal.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Goal?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GoalTable>? where,
    int? offset,
    _i1.OrderByBuilder<GoalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GoalTable>? orderByList,
    _i1.Transaction? transaction,
    GoalInclude? include,
  }) async {
    return session.db.findFirstRow<Goal>(
      where: where?.call(Goal.t),
      orderBy: orderBy?.call(Goal.t),
      orderByList: orderByList?.call(Goal.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Goal?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GoalInclude? include,
  }) async {
    return session.db.findById<Goal>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Goal>> insert(
    _i1.Session session,
    List<Goal> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Goal>(
      rows,
      transaction: transaction,
    );
  }

  Future<Goal> insertRow(
    _i1.Session session,
    Goal row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Goal>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Goal>> update(
    _i1.Session session,
    List<Goal> rows, {
    _i1.ColumnSelections<GoalTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Goal>(
      rows,
      columns: columns?.call(Goal.t),
      transaction: transaction,
    );
  }

  Future<Goal> updateRow(
    _i1.Session session,
    Goal row, {
    _i1.ColumnSelections<GoalTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Goal>(
      row,
      columns: columns?.call(Goal.t),
      transaction: transaction,
    );
  }

  Future<List<Goal>> delete(
    _i1.Session session,
    List<Goal> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Goal>(
      rows,
      transaction: transaction,
    );
  }

  Future<Goal> deleteRow(
    _i1.Session session,
    Goal row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Goal>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Goal>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GoalTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Goal>(
      where: where(Goal.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GoalTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Goal>(
      where: where?.call(Goal.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GoalAttachRepository {
  const GoalAttachRepository._();

  Future<void> journal(
    _i1.Session session,
    Goal goal,
    List<_i2.JournalLog> journalLog,
  ) async {
    if (journalLog.any((e) => e.id == null)) {
      throw ArgumentError.notNull('journalLog.id');
    }
    if (goal.id == null) {
      throw ArgumentError.notNull('goal.id');
    }

    var $journalLog =
        journalLog.map((e) => e.copyWith(goalId: goal.id)).toList();
    await session.db.update<_i2.JournalLog>(
      $journalLog,
      columns: [_i2.JournalLog.t.goalId],
    );
  }
}

class GoalAttachRowRepository {
  const GoalAttachRowRepository._();

  Future<void> user(
    _i1.Session session,
    Goal goal,
    _i2.User user,
  ) async {
    if (goal.id == null) {
      throw ArgumentError.notNull('goal.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $goal = goal.copyWith(userId: user.id);
    await session.db.updateRow<Goal>(
      $goal,
      columns: [Goal.t.userId],
    );
  }

  Future<void> journal(
    _i1.Session session,
    Goal goal,
    _i2.JournalLog journalLog,
  ) async {
    if (journalLog.id == null) {
      throw ArgumentError.notNull('journalLog.id');
    }
    if (goal.id == null) {
      throw ArgumentError.notNull('goal.id');
    }

    var $journalLog = journalLog.copyWith(goalId: goal.id);
    await session.db.updateRow<_i2.JournalLog>(
      $journalLog,
      columns: [_i2.JournalLog.t.goalId],
    );
  }
}

class GoalDetachRepository {
  const GoalDetachRepository._();

  Future<void> journal(
    _i1.Session session,
    List<_i2.JournalLog> journalLog,
  ) async {
    if (journalLog.any((e) => e.id == null)) {
      throw ArgumentError.notNull('journalLog.id');
    }

    var $journalLog = journalLog.map((e) => e.copyWith(goalId: null)).toList();
    await session.db.update<_i2.JournalLog>(
      $journalLog,
      columns: [_i2.JournalLog.t.goalId],
    );
  }
}

class GoalDetachRowRepository {
  const GoalDetachRowRepository._();

  Future<void> journal(
    _i1.Session session,
    _i2.JournalLog journalLog,
  ) async {
    if (journalLog.id == null) {
      throw ArgumentError.notNull('journalLog.id');
    }

    var $journalLog = journalLog.copyWith(goalId: null);
    await session.db.updateRow<_i2.JournalLog>(
      $journalLog,
      columns: [_i2.JournalLog.t.goalId],
    );
  }
}
