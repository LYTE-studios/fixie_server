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
  }) = _GoalImpl;

  factory Goal.fromJson(Map<String, dynamic> jsonSerialization) {
    return Goal(
<<<<<<< Updated upstream
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      user: serializationManager
          .deserialize<_i2.User?>(jsonSerialization['user']),
      picture: serializationManager
          .deserialize<String?>(jsonSerialization['picture']),
      target:
          serializationManager.deserialize<int>(jsonSerialization['target']),
      targetPeriod: serializationManager
          .deserialize<_i2.TargetPeriod>(jsonSerialization['targetPeriod']),
      category: serializationManager
          .deserialize<_i2.Category>(jsonSerialization['category']),
      repetition: serializationManager
          .deserialize<_i2.Repetition>(jsonSerialization['repetition']),
      days: serializationManager
          .deserialize<List<_i2.Days>?>(jsonSerialization['days']),
=======
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
>>>>>>> Stashed changes
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
    };
  }

  @override
<<<<<<< Updated upstream
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'title': title,
      'userId': userId,
      'picture': picture,
      'target': target,
      'targetPeriod': targetPeriod,
      'category': category,
      'repetition': repetition,
      'days': days,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
=======
  Map<String, dynamic> toJsonForProtocol() {
>>>>>>> Stashed changes
    return {
      if (id != null) 'id': id,
      'title': title,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      if (picture != null) 'picture': picture,
      'target': target,
      'targetPeriod': targetPeriod.toJson(),
<<<<<<< Updated upstream
      'category': category.toJson(),
      'repetition': repetition.toJson(),
      if (days != null) 'days': days?.toJson(valueToJson: (v) => v.toJson()),
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
      case 'title':
        title = value;
        return;
      case 'userId':
        userId = value;
        return;
      case 'picture':
        picture = value;
        return;
      case 'target':
        target = value;
        return;
      case 'targetPeriod':
        targetPeriod = value;
        return;
      case 'category':
        category = value;
        return;
      case 'repetition':
        repetition = value;
        return;
      case 'days':
        days = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<Goal>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GoalTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
    GoalInclude? include,
  }) async {
    return session.db.find<Goal>(
      where: where != null ? where(Goal.t) : null,
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
  static Future<Goal?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GoalTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
    GoalInclude? include,
  }) async {
    return session.db.findSingleRow<Goal>(
      where: where != null ? where(Goal.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<Goal?> findById(
    _i1.Session session,
    int id, {
    GoalInclude? include,
  }) async {
    return session.db.findById<Goal>(
      id,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GoalTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Goal>(
      where: where(Goal.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    Goal row, {
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
    Goal row, {
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
    Goal row, {
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
    _i1.WhereExpressionBuilder<GoalTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Goal>(
      where: where != null ? where(Goal.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static GoalInclude include({_i2.UserInclude? user}) {
    return GoalInclude._(user: user);
=======
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
>>>>>>> Stashed changes
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
  }) {
    return Goal(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      picture: picture is String? ? picture : this.picture,
      target: target ?? this.target,
      targetPeriod: targetPeriod ?? this.targetPeriod,
      category: category ?? this.category,
      repetition: repetition ?? this.repetition,
      days: days is List<_i2.Days>? ? days : this.days?.clone(),
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
    category = _i1.ColumnEnum(
      'category',
      this,
      _i1.EnumSerialization.byName,
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
  }

  late final _i1.ColumnString title;

  late final _i1.ColumnInt userId;

  _i2.UserTable? _user;

  late final _i1.ColumnString picture;

  late final _i1.ColumnInt target;

  late final _i1.ColumnEnum<_i2.TargetPeriod> targetPeriod;

  late final _i1.ColumnEnum<_i2.Category> category;

  late final _i1.ColumnEnum<_i2.Repetition> repetition;

  late final _i1.ColumnSerializable days;

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
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class GoalInclude extends _i1.IncludeObject {
  GoalInclude._({_i2.UserInclude? user}) {
    _user = user;
  }

  _i2.UserInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {'user': _user};

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

  final attachRow = const GoalAttachRowRepository._();

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

<<<<<<< Updated upstream
=======
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

>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
=======

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
>>>>>>> Stashed changes
}
