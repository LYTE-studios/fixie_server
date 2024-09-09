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
    this.repetition,
    this.repeatEvery,
    this.weekdays,
    this.end,
    this.reminders,
    this.journal,
    this.highestStreak,
    required this.active,
    required this.archived,
    this.created,
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
    _i2.Repetition? repetition,
    int? repeatEvery,
    List<int>? weekdays,
    DateTime? end,
    List<DateTime>? reminders,
    List<_i2.JournalLog>? journal,
    int? highestStreak,
    required bool active,
    required bool archived,
    DateTime? created,
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
      repetition: jsonSerialization['repetition'] == null
          ? null
          : _i2.Repetition.fromJson((jsonSerialization['repetition'] as int)),
      repeatEvery: jsonSerialization['repeatEvery'] as int?,
      weekdays: (jsonSerialization['weekdays'] as List?)
          ?.map((e) => e as int)
          .toList(),
      end: jsonSerialization['end'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['end']),
      reminders: (jsonSerialization['reminders'] as List?)
          ?.map((e) => _i1.DateTimeJsonExtension.fromJson(e))
          .toList(),
      journal: (jsonSerialization['journal'] as List?)
          ?.map((e) => _i2.JournalLog.fromJson((e as Map<String, dynamic>)))
          .toList(),
      highestStreak: jsonSerialization['highestStreak'] as int?,
      active: jsonSerialization['active'] as bool,
      archived: jsonSerialization['archived'] as bool,
      created: jsonSerialization['created'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['created']),
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

  _i2.Repetition? repetition;

  int? repeatEvery;

  List<int>? weekdays;

  DateTime? end;

  List<DateTime>? reminders;

  List<_i2.JournalLog>? journal;

  int? highestStreak;

  bool active;

  bool archived;

  DateTime? created;

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
    _i2.Repetition? repetition,
    int? repeatEvery,
    List<int>? weekdays,
    DateTime? end,
    List<DateTime>? reminders,
    List<_i2.JournalLog>? journal,
    int? highestStreak,
    bool? active,
    bool? archived,
    DateTime? created,
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
      if (repetition != null) 'repetition': repetition?.toJson(),
      if (repeatEvery != null) 'repeatEvery': repeatEvery,
      if (weekdays != null) 'weekdays': weekdays?.toJson(),
      if (end != null) 'end': end?.toJson(),
      if (reminders != null)
        'reminders': reminders?.toJson(valueToJson: (v) => v.toJson()),
      if (journal != null)
        'journal': journal?.toJson(valueToJson: (v) => v.toJson()),
      if (highestStreak != null) 'highestStreak': highestStreak,
      'active': active,
      'archived': archived,
      if (created != null) 'created': created?.toJson(),
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
      if (repetition != null) 'repetition': repetition?.toJson(),
      if (repeatEvery != null) 'repeatEvery': repeatEvery,
      if (weekdays != null) 'weekdays': weekdays?.toJson(),
      if (end != null) 'end': end?.toJson(),
      if (reminders != null)
        'reminders': reminders?.toJson(valueToJson: (v) => v.toJson()),
      if (journal != null)
        'journal': journal?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (highestStreak != null) 'highestStreak': highestStreak,
      'active': active,
      'archived': archived,
      if (created != null) 'created': created?.toJson(),
    };
  }

  static GoalInclude include({
    _i2.UserInclude? user,
    _i2.CategoryInclude? category,
    _i2.JournalLogIncludeList? journal,
  }) {
    return GoalInclude._(
      user: user,
      category: category,
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
    _i2.Repetition? repetition,
    int? repeatEvery,
    List<int>? weekdays,
    DateTime? end,
    List<DateTime>? reminders,
    List<_i2.JournalLog>? journal,
    int? highestStreak,
    required bool active,
    required bool archived,
    DateTime? created,
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
          repetition: repetition,
          repeatEvery: repeatEvery,
          weekdays: weekdays,
          end: end,
          reminders: reminders,
          journal: journal,
          highestStreak: highestStreak,
          active: active,
          archived: archived,
          created: created,
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
    Object? repetition = _Undefined,
    Object? repeatEvery = _Undefined,
    Object? weekdays = _Undefined,
    Object? end = _Undefined,
    Object? reminders = _Undefined,
    Object? journal = _Undefined,
    Object? highestStreak = _Undefined,
    bool? active,
    bool? archived,
    Object? created = _Undefined,
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
      repetition: repetition is _i2.Repetition? ? repetition : this.repetition,
      repeatEvery: repeatEvery is int? ? repeatEvery : this.repeatEvery,
      weekdays: weekdays is List<int>? ? weekdays : this.weekdays?.clone(),
      end: end is DateTime? ? end : this.end,
      reminders:
          reminders is List<DateTime>? ? reminders : this.reminders?.clone(),
      journal:
          journal is List<_i2.JournalLog>? ? journal : this.journal?.clone(),
      highestStreak: highestStreak is int? ? highestStreak : this.highestStreak,
      active: active ?? this.active,
      archived: archived ?? this.archived,
      created: created is DateTime? ? created : this.created,
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
    repetition = _i1.ColumnEnum(
      'repetition',
      this,
      _i1.EnumSerialization.byIndex,
    );
    repeatEvery = _i1.ColumnInt(
      'repeatEvery',
      this,
    );
    weekdays = _i1.ColumnSerializable(
      'weekdays',
      this,
    );
    end = _i1.ColumnDateTime(
      'end',
      this,
    );
    reminders = _i1.ColumnSerializable(
      'reminders',
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
    created = _i1.ColumnDateTime(
      'created',
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

  late final _i1.ColumnEnum<_i2.Repetition> repetition;

  late final _i1.ColumnInt repeatEvery;

  late final _i1.ColumnSerializable weekdays;

  late final _i1.ColumnDateTime end;

  late final _i1.ColumnSerializable reminders;

  _i2.JournalLogTable? ___journal;

  _i1.ManyRelation<_i2.JournalLogTable>? _journal;

  late final _i1.ColumnInt highestStreak;

  late final _i1.ColumnBool active;

  late final _i1.ColumnBool archived;

  late final _i1.ColumnDateTime created;

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
        unit,
        categoryId,
        repetition,
        repeatEvery,
        weekdays,
        end,
        reminders,
        highestStreak,
        active,
        archived,
        created,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'category') {
      return category;
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
    _i2.JournalLogIncludeList? journal,
  }) {
    _user = user;
    _category = category;
    _journal = journal;
  }

  _i2.UserInclude? _user;

  _i2.CategoryInclude? _category;

  _i2.JournalLogIncludeList? _journal;

  @override
  Map<String, _i1.Include?> get includes => {
        'user': _user,
        'category': _category,
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
