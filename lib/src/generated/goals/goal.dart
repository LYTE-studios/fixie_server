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

abstract class Goal extends _i1.TableRow implements _i1.ProtocolSerialization {
  Goal._({
    int? id,
    required this.title,
    required this.userId,
    this.user,
    this.picture,
    required this.target,
    this.unit,
    required this.categoryId,
    this.category,
    this.days,
    this.end,
    required this.setRemind,
    this.remindHour,
    this.remindMinutes,
    this.remindHalf,
    this.remindTimezone,
    this.journal,
    this.currentStreak,
    this.highestStreak,
    required this.active,
    required this.archived,
  }) : super(id);

  factory Goal({
    int? id,
    required String title,
    required int userId,
    _i2.User? user,
    String? picture,
    required int target,
    String? unit,
    required int categoryId,
    _i2.Category? category,
    List<_i2.RepeatableDays>? days,
    DateTime? end,
    required bool setRemind,
    int? remindHour,
    int? remindMinutes,
    bool? remindHalf,
    String? remindTimezone,
    List<_i2.JournalLog>? journal,
    int? currentStreak,
    int? highestStreak,
    required bool active,
    required bool archived,
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
      unit: jsonSerialization['unit'] as String?,
      categoryId: jsonSerialization['categoryId'] as int,
      category: jsonSerialization['category'] == null
          ? null
          : _i2.Category.fromJson(
              (jsonSerialization['category'] as Map<String, dynamic>)),
      days: (jsonSerialization['days'] as List?)
          ?.map((e) => _i2.RepeatableDays.fromJson((e as Map<String, dynamic>)))
          .toList(),
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
      active: jsonSerialization['active'] as bool,
      archived: jsonSerialization['archived'] as bool,
    );
  }

  static final t = GoalTable();

  static const db = GoalRepository._();

  String title;

  int userId;

  _i2.User? user;

  String? picture;

  int target;

  String? unit;

  int categoryId;

  _i2.Category? category;

  List<_i2.RepeatableDays>? days;

  DateTime? end;

  bool setRemind;

  int? remindHour;

  int? remindMinutes;

  bool? remindHalf;

  String? remindTimezone;

  List<_i2.JournalLog>? journal;

  int? currentStreak;

  int? highestStreak;

  bool active;

  bool archived;

  @override
  _i1.Table get table => t;

  Goal copyWith({
    int? id,
    String? title,
    int? userId,
    _i2.User? user,
    String? picture,
    int? target,
    String? unit,
    int? categoryId,
    _i2.Category? category,
    List<_i2.RepeatableDays>? days,
    DateTime? end,
    bool? setRemind,
    int? remindHour,
    int? remindMinutes,
    bool? remindHalf,
    String? remindTimezone,
    List<_i2.JournalLog>? journal,
    int? currentStreak,
    int? highestStreak,
    bool? active,
    bool? archived,
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
      if (unit != null) 'unit': unit,
      'categoryId': categoryId,
      if (category != null) 'category': category?.toJson(),
      if (days != null) 'days': days?.toJson(valueToJson: (v) => v.toJson()),
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
      'active': active,
      'archived': archived,
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
      if (unit != null) 'unit': unit,
      'categoryId': categoryId,
      if (category != null) 'category': category?.toJsonForProtocol(),
      if (days != null)
        'days': days?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
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
      'active': active,
      'archived': archived,
    };
  }

  static GoalInclude include({
    _i2.UserInclude? user,
    _i2.CategoryInclude? category,
    _i2.RepeatableDaysIncludeList? days,
    _i2.JournalLogIncludeList? journal,
  }) {
    return GoalInclude._(
      user: user,
      category: category,
      days: days,
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
    String? unit,
    required int categoryId,
    _i2.Category? category,
    List<_i2.RepeatableDays>? days,
    DateTime? end,
    required bool setRemind,
    int? remindHour,
    int? remindMinutes,
    bool? remindHalf,
    String? remindTimezone,
    List<_i2.JournalLog>? journal,
    int? currentStreak,
    int? highestStreak,
    required bool active,
    required bool archived,
  }) : super._(
          id: id,
          title: title,
          userId: userId,
          user: user,
          picture: picture,
          target: target,
          unit: unit,
          categoryId: categoryId,
          category: category,
          days: days,
          end: end,
          setRemind: setRemind,
          remindHour: remindHour,
          remindMinutes: remindMinutes,
          remindHalf: remindHalf,
          remindTimezone: remindTimezone,
          journal: journal,
          currentStreak: currentStreak,
          highestStreak: highestStreak,
          active: active,
          archived: archived,
        );

  @override
  Goal copyWith({
    Object? id = _Undefined,
    String? title,
    int? userId,
    Object? user = _Undefined,
    Object? picture = _Undefined,
    int? target,
    Object? unit = _Undefined,
    int? categoryId,
    Object? category = _Undefined,
    Object? days = _Undefined,
    Object? end = _Undefined,
    bool? setRemind,
    Object? remindHour = _Undefined,
    Object? remindMinutes = _Undefined,
    Object? remindHalf = _Undefined,
    Object? remindTimezone = _Undefined,
    Object? journal = _Undefined,
    Object? currentStreak = _Undefined,
    Object? highestStreak = _Undefined,
    bool? active,
    bool? archived,
  }) {
    return Goal(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      picture: picture is String? ? picture : this.picture,
      target: target ?? this.target,
      unit: unit is String? ? unit : this.unit,
      categoryId: categoryId ?? this.categoryId,
      category:
          category is _i2.Category? ? category : this.category?.copyWith(),
      days: days is List<_i2.RepeatableDays>? ? days : this.days?.clone(),
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
      active: active ?? this.active,
      archived: archived ?? this.archived,
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
    unit = _i1.ColumnString(
      'unit',
      this,
    );
    categoryId = _i1.ColumnInt(
      'categoryId',
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
    active = _i1.ColumnBool(
      'active',
      this,
    );
    archived = _i1.ColumnBool(
      'archived',
      this,
    );
  }

  late final _i1.ColumnString title;

  late final _i1.ColumnInt userId;

  _i2.UserTable? _user;

  late final _i1.ColumnString picture;

  late final _i1.ColumnInt target;

  late final _i1.ColumnString unit;

  late final _i1.ColumnInt categoryId;

  _i2.CategoryTable? _category;

  _i2.RepeatableDaysTable? ___days;

  _i1.ManyRelation<_i2.RepeatableDaysTable>? _days;

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

  late final _i1.ColumnBool active;

  late final _i1.ColumnBool archived;

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

  _i2.CategoryTable get category {
    if (_category != null) return _category!;
    _category = _i1.createRelationTable(
      relationFieldName: 'category',
      field: Goal.t.categoryId,
      foreignField: _i2.Category.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CategoryTable(tableRelation: foreignTableRelation),
    );
    return _category!;
  }

  _i2.RepeatableDaysTable get __days {
    if (___days != null) return ___days!;
    ___days = _i1.createRelationTable(
      relationFieldName: '__days',
      field: Goal.t.id,
      foreignField: _i2.RepeatableDays.t.$_goalDaysGoalId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.RepeatableDaysTable(tableRelation: foreignTableRelation),
    );
    return ___days!;
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

  _i1.ManyRelation<_i2.RepeatableDaysTable> get days {
    if (_days != null) return _days!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'days',
      field: Goal.t.id,
      foreignField: _i2.RepeatableDays.t.$_goalDaysGoalId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.RepeatableDaysTable(tableRelation: foreignTableRelation),
    );
    _days = _i1.ManyRelation<_i2.RepeatableDaysTable>(
      tableWithRelations: relationTable,
      table: _i2.RepeatableDaysTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _days!;
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
        unit,
        categoryId,
        end,
        setRemind,
        remindHour,
        remindMinutes,
        remindHalf,
        remindTimezone,
        currentStreak,
        highestStreak,
        active,
        archived,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'category') {
      return category;
    }
    if (relationField == 'days') {
      return __days;
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
    _i2.CategoryInclude? category,
    _i2.RepeatableDaysIncludeList? days,
    _i2.JournalLogIncludeList? journal,
  }) {
    _user = user;
    _category = category;
    _days = days;
    _journal = journal;
  }

  _i2.UserInclude? _user;

  _i2.CategoryInclude? _category;

  _i2.RepeatableDaysIncludeList? _days;

  _i2.JournalLogIncludeList? _journal;

  @override
  Map<String, _i1.Include?> get includes => {
        'user': _user,
        'category': _category,
        'days': _days,
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

  Future<void> days(
    _i1.Session session,
    Goal goal,
    List<_i2.RepeatableDays> repeatableDays,
  ) async {
    if (repeatableDays.any((e) => e.id == null)) {
      throw ArgumentError.notNull('repeatableDays.id');
    }
    if (goal.id == null) {
      throw ArgumentError.notNull('goal.id');
    }

    var $repeatableDays = repeatableDays
        .map((e) => _i2.RepeatableDaysImplicit(
              e,
              $_goalDaysGoalId: goal.id,
            ))
        .toList();
    await session.db.update<_i2.RepeatableDays>(
      $repeatableDays,
      columns: [_i2.RepeatableDays.t.$_goalDaysGoalId],
    );
  }

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

  Future<void> category(
    _i1.Session session,
    Goal goal,
    _i2.Category category,
  ) async {
    if (goal.id == null) {
      throw ArgumentError.notNull('goal.id');
    }
    if (category.id == null) {
      throw ArgumentError.notNull('category.id');
    }

    var $goal = goal.copyWith(categoryId: category.id);
    await session.db.updateRow<Goal>(
      $goal,
      columns: [Goal.t.categoryId],
    );
  }

  Future<void> days(
    _i1.Session session,
    Goal goal,
    _i2.RepeatableDays repeatableDays,
  ) async {
    if (repeatableDays.id == null) {
      throw ArgumentError.notNull('repeatableDays.id');
    }
    if (goal.id == null) {
      throw ArgumentError.notNull('goal.id');
    }

    var $repeatableDays = _i2.RepeatableDaysImplicit(
      repeatableDays,
      $_goalDaysGoalId: goal.id,
    );
    await session.db.updateRow<_i2.RepeatableDays>(
      $repeatableDays,
      columns: [_i2.RepeatableDays.t.$_goalDaysGoalId],
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

  Future<void> days(
    _i1.Session session,
    List<_i2.RepeatableDays> repeatableDays,
  ) async {
    if (repeatableDays.any((e) => e.id == null)) {
      throw ArgumentError.notNull('repeatableDays.id');
    }

    var $repeatableDays = repeatableDays
        .map((e) => _i2.RepeatableDaysImplicit(
              e,
              $_goalDaysGoalId: null,
            ))
        .toList();
    await session.db.update<_i2.RepeatableDays>(
      $repeatableDays,
      columns: [_i2.RepeatableDays.t.$_goalDaysGoalId],
    );
  }

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

  Future<void> days(
    _i1.Session session,
    _i2.RepeatableDays repeatableDays,
  ) async {
    if (repeatableDays.id == null) {
      throw ArgumentError.notNull('repeatableDays.id');
    }

    var $repeatableDays = _i2.RepeatableDaysImplicit(
      repeatableDays,
      $_goalDaysGoalId: null,
    );
    await session.db.updateRow<_i2.RepeatableDays>(
      $repeatableDays,
      columns: [_i2.RepeatableDays.t.$_goalDaysGoalId],
    );
  }

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
