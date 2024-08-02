/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;
import '../protocol.dart' as _i3;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class User extends _i1.TableRow implements _i1.ProtocolSerialization {
  User._({
    int? id,
    required this.userInfoId,
    this.userInfo,
    this.birthday,
    this.goals,
    this.highestStreak,
  }) : super(id);

  factory User({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    DateTime? birthday,
    List<_i3.Goal>? goals,
    int? highestStreak,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      birthday: jsonSerialization['birthday'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['birthday']),
      goals: (jsonSerialization['goals'] as List?)
          ?.map((e) => _i3.Goal.fromJson((e as Map<String, dynamic>)))
          .toList(),
      highestStreak: jsonSerialization['highestStreak'] as int?,
    );
  }

  static final t = UserTable();

  static const db = UserRepository._();

  int userInfoId;

  _i2.UserInfo? userInfo;

  DateTime? birthday;

  List<_i3.Goal>? goals;

  int? highestStreak;

  @override
  _i1.Table get table => t;

  User copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    DateTime? birthday,
    List<_i3.Goal>? goals,
    int? highestStreak,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      if (birthday != null) 'birthday': birthday?.toJson(),
      if (goals != null) 'goals': goals?.toJson(valueToJson: (v) => v.toJson()),
      if (highestStreak != null) 'highestStreak': highestStreak,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
      if (birthday != null) 'birthday': birthday?.toJson(),
      if (goals != null)
        'goals': goals?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (highestStreak != null) 'highestStreak': highestStreak,
    };
  }

  static UserInclude include({
    _i2.UserInfoInclude? userInfo,
    _i3.GoalIncludeList? goals,
  }) {
    return UserInclude._(
      userInfo: userInfo,
      goals: goals,
    );
  }

  static UserIncludeList includeList({
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    UserInclude? include,
  }) {
    return UserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(User.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(User.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    DateTime? birthday,
    List<_i3.Goal>? goals,
    int? highestStreak,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          userInfo: userInfo,
          birthday: birthday,
          goals: goals,
          highestStreak: highestStreak,
        );

  @override
  User copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    Object? birthday = _Undefined,
    Object? goals = _Undefined,
    Object? highestStreak = _Undefined,
  }) {
    return User(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      birthday: birthday is DateTime? ? birthday : this.birthday,
      goals: goals is List<_i3.Goal>? ? goals : this.goals?.clone(),
      highestStreak: highestStreak is int? ? highestStreak : this.highestStreak,
    );
  }
}

class UserTable extends _i1.Table {
  UserTable({super.tableRelation}) : super(tableName: 'fixie_user') {
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    birthday = _i1.ColumnDateTime(
      'birthday',
      this,
    );
    highestStreak = _i1.ColumnInt(
      'highestStreak',
      this,
    );
  }

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  late final _i1.ColumnDateTime birthday;

  _i3.GoalTable? ___goals;

  _i1.ManyRelation<_i3.GoalTable>? _goals;

  late final _i1.ColumnInt highestStreak;

  _i2.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: User.t.userInfoId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
  }

  _i3.GoalTable get __goals {
    if (___goals != null) return ___goals!;
    ___goals = _i1.createRelationTable(
      relationFieldName: '__goals',
      field: User.t.id,
      foreignField: _i3.Goal.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.GoalTable(tableRelation: foreignTableRelation),
    );
    return ___goals!;
  }

  _i1.ManyRelation<_i3.GoalTable> get goals {
    if (_goals != null) return _goals!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'goals',
      field: User.t.id,
      foreignField: _i3.Goal.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.GoalTable(tableRelation: foreignTableRelation),
    );
    _goals = _i1.ManyRelation<_i3.GoalTable>(
      tableWithRelations: relationTable,
      table: _i3.GoalTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _goals!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userInfoId,
        birthday,
        highestStreak,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userInfo') {
      return userInfo;
    }
    if (relationField == 'goals') {
      return __goals;
    }
    return null;
  }
}

class UserInclude extends _i1.IncludeObject {
  UserInclude._({
    _i2.UserInfoInclude? userInfo,
    _i3.GoalIncludeList? goals,
  }) {
    _userInfo = userInfo;
    _goals = goals;
  }

  _i2.UserInfoInclude? _userInfo;

  _i3.GoalIncludeList? _goals;

  @override
  Map<String, _i1.Include?> get includes => {
        'userInfo': _userInfo,
        'goals': _goals,
      };

  @override
  _i1.Table get table => User.t;
}

class UserIncludeList extends _i1.IncludeList {
  UserIncludeList._({
    _i1.WhereExpressionBuilder<UserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(User.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => User.t;
}

class UserRepository {
  const UserRepository._();

  final attach = const UserAttachRepository._();

  final attachRow = const UserAttachRowRepository._();

  Future<List<User>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.find<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<User?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findFirstRow<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<User?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findById<User>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<User>> insert(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<User>(
      rows,
      transaction: transaction,
    );
  }

  Future<User> insertRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<User>(
      row,
      transaction: transaction,
    );
  }

  Future<List<User>> update(
    _i1.Session session,
    List<User> rows, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<User>(
      rows,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  Future<User> updateRow(
    _i1.Session session,
    User row, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<User>(
      row,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  Future<List<User>> delete(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<User>(
      rows,
      transaction: transaction,
    );
  }

  Future<User> deleteRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<User>(
      row,
      transaction: transaction,
    );
  }

  Future<List<User>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<User>(
      where: where(User.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<User>(
      where: where?.call(User.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class UserAttachRepository {
  const UserAttachRepository._();

  Future<void> goals(
    _i1.Session session,
    User user,
    List<_i3.Goal> goal,
  ) async {
    if (goal.any((e) => e.id == null)) {
      throw ArgumentError.notNull('goal.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $goal = goal.map((e) => e.copyWith(userId: user.id)).toList();
    await session.db.update<_i3.Goal>(
      $goal,
      columns: [_i3.Goal.t.userId],
    );
  }
}

class UserAttachRowRepository {
  const UserAttachRowRepository._();

  Future<void> userInfo(
    _i1.Session session,
    User user,
    _i2.UserInfo userInfo,
  ) async {
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $user = user.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<User>(
      $user,
      columns: [User.t.userInfoId],
    );
  }

  Future<void> goals(
    _i1.Session session,
    User user,
    _i3.Goal goal,
  ) async {
    if (goal.id == null) {
      throw ArgumentError.notNull('goal.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $goal = goal.copyWith(userId: user.id);
    await session.db.updateRow<_i3.Goal>(
      $goal,
      columns: [_i3.Goal.t.userId],
    );
  }
}
