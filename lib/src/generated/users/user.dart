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
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;
import '../goals/goal.dart' as _i3;
import '../payment/purchase_item.dart' as _i4;
import '../users/archetype.dart' as _i5;

abstract class User implements _i1.TableRow, _i1.ProtocolSerialization {
  User._({
    this.id,
    required this.userInfoId,
    this.userInfo,
    this.birthday,
    this.goals,
    this.purchases,
    this.highestStreak,
    this.picture,
    this.hasPassedOnboarding,
    this.fcmToken,
    this.hasPassedGoalTutorial,
    this.informationCollectionSetting,
    this.automaticRemindersSetting,
    this.archetype,
    this.limitedOfferEndTime,
  });

  factory User({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    DateTime? birthday,
    List<_i3.Goal>? goals,
    List<_i4.PurchaseItem>? purchases,
    int? highestStreak,
    String? picture,
    bool? hasPassedOnboarding,
    String? fcmToken,
    bool? hasPassedGoalTutorial,
    bool? informationCollectionSetting,
    bool? automaticRemindersSetting,
    _i5.Archetype? archetype,
    DateTime? limitedOfferEndTime,
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
      purchases: (jsonSerialization['purchases'] as List?)
          ?.map((e) => _i4.PurchaseItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      highestStreak: jsonSerialization['highestStreak'] as int?,
      picture: jsonSerialization['picture'] as String?,
      hasPassedOnboarding: jsonSerialization['hasPassedOnboarding'] as bool?,
      fcmToken: jsonSerialization['fcmToken'] as String?,
      hasPassedGoalTutorial:
          jsonSerialization['hasPassedGoalTutorial'] as bool?,
      informationCollectionSetting:
          jsonSerialization['informationCollectionSetting'] as bool?,
      automaticRemindersSetting:
          jsonSerialization['automaticRemindersSetting'] as bool?,
      archetype: jsonSerialization['archetype'] == null
          ? null
          : _i5.Archetype.fromJson((jsonSerialization['archetype'] as int)),
      limitedOfferEndTime: jsonSerialization['limitedOfferEndTime'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['limitedOfferEndTime']),
    );
  }

  static final t = UserTable();

  static const db = UserRepository._();

  @override
  int? id;

  int userInfoId;

  _i2.UserInfo? userInfo;

  DateTime? birthday;

  List<_i3.Goal>? goals;

  List<_i4.PurchaseItem>? purchases;

  int? highestStreak;

  String? picture;

  bool? hasPassedOnboarding;

  String? fcmToken;

  bool? hasPassedGoalTutorial;

  bool? informationCollectionSetting;

  bool? automaticRemindersSetting;

  _i5.Archetype? archetype;

  DateTime? limitedOfferEndTime;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  User copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    DateTime? birthday,
    List<_i3.Goal>? goals,
    List<_i4.PurchaseItem>? purchases,
    int? highestStreak,
    String? picture,
    bool? hasPassedOnboarding,
    String? fcmToken,
    bool? hasPassedGoalTutorial,
    bool? informationCollectionSetting,
    bool? automaticRemindersSetting,
    _i5.Archetype? archetype,
    DateTime? limitedOfferEndTime,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      if (birthday != null) 'birthday': birthday?.toJson(),
      if (goals != null) 'goals': goals?.toJson(valueToJson: (v) => v.toJson()),
      if (purchases != null)
        'purchases': purchases?.toJson(valueToJson: (v) => v.toJson()),
      if (highestStreak != null) 'highestStreak': highestStreak,
      if (picture != null) 'picture': picture,
      if (hasPassedOnboarding != null)
        'hasPassedOnboarding': hasPassedOnboarding,
      if (fcmToken != null) 'fcmToken': fcmToken,
      if (hasPassedGoalTutorial != null)
        'hasPassedGoalTutorial': hasPassedGoalTutorial,
      if (informationCollectionSetting != null)
        'informationCollectionSetting': informationCollectionSetting,
      if (automaticRemindersSetting != null)
        'automaticRemindersSetting': automaticRemindersSetting,
      if (archetype != null) 'archetype': archetype?.toJson(),
      if (limitedOfferEndTime != null)
        'limitedOfferEndTime': limitedOfferEndTime?.toJson(),
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
      if (purchases != null)
        'purchases':
            purchases?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (highestStreak != null) 'highestStreak': highestStreak,
      if (picture != null) 'picture': picture,
      if (hasPassedOnboarding != null)
        'hasPassedOnboarding': hasPassedOnboarding,
      if (fcmToken != null) 'fcmToken': fcmToken,
      if (hasPassedGoalTutorial != null)
        'hasPassedGoalTutorial': hasPassedGoalTutorial,
      if (informationCollectionSetting != null)
        'informationCollectionSetting': informationCollectionSetting,
      if (automaticRemindersSetting != null)
        'automaticRemindersSetting': automaticRemindersSetting,
      if (archetype != null) 'archetype': archetype?.toJson(),
      if (limitedOfferEndTime != null)
        'limitedOfferEndTime': limitedOfferEndTime?.toJson(),
    };
  }

  static UserInclude include({
    _i2.UserInfoInclude? userInfo,
    _i3.GoalIncludeList? goals,
    _i4.PurchaseItemIncludeList? purchases,
  }) {
    return UserInclude._(
      userInfo: userInfo,
      goals: goals,
      purchases: purchases,
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
    List<_i4.PurchaseItem>? purchases,
    int? highestStreak,
    String? picture,
    bool? hasPassedOnboarding,
    String? fcmToken,
    bool? hasPassedGoalTutorial,
    bool? informationCollectionSetting,
    bool? automaticRemindersSetting,
    _i5.Archetype? archetype,
    DateTime? limitedOfferEndTime,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          userInfo: userInfo,
          birthday: birthday,
          goals: goals,
          purchases: purchases,
          highestStreak: highestStreak,
          picture: picture,
          hasPassedOnboarding: hasPassedOnboarding,
          fcmToken: fcmToken,
          hasPassedGoalTutorial: hasPassedGoalTutorial,
          informationCollectionSetting: informationCollectionSetting,
          automaticRemindersSetting: automaticRemindersSetting,
          archetype: archetype,
          limitedOfferEndTime: limitedOfferEndTime,
        );

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  User copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    Object? birthday = _Undefined,
    Object? goals = _Undefined,
    Object? purchases = _Undefined,
    Object? highestStreak = _Undefined,
    Object? picture = _Undefined,
    Object? hasPassedOnboarding = _Undefined,
    Object? fcmToken = _Undefined,
    Object? hasPassedGoalTutorial = _Undefined,
    Object? informationCollectionSetting = _Undefined,
    Object? automaticRemindersSetting = _Undefined,
    Object? archetype = _Undefined,
    Object? limitedOfferEndTime = _Undefined,
  }) {
    return User(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      birthday: birthday is DateTime? ? birthday : this.birthday,
      goals: goals is List<_i3.Goal>?
          ? goals
          : this.goals?.map((e0) => e0.copyWith()).toList(),
      purchases: purchases is List<_i4.PurchaseItem>?
          ? purchases
          : this.purchases?.map((e0) => e0.copyWith()).toList(),
      highestStreak: highestStreak is int? ? highestStreak : this.highestStreak,
      picture: picture is String? ? picture : this.picture,
      hasPassedOnboarding: hasPassedOnboarding is bool?
          ? hasPassedOnboarding
          : this.hasPassedOnboarding,
      fcmToken: fcmToken is String? ? fcmToken : this.fcmToken,
      hasPassedGoalTutorial: hasPassedGoalTutorial is bool?
          ? hasPassedGoalTutorial
          : this.hasPassedGoalTutorial,
      informationCollectionSetting: informationCollectionSetting is bool?
          ? informationCollectionSetting
          : this.informationCollectionSetting,
      automaticRemindersSetting: automaticRemindersSetting is bool?
          ? automaticRemindersSetting
          : this.automaticRemindersSetting,
      archetype: archetype is _i5.Archetype? ? archetype : this.archetype,
      limitedOfferEndTime: limitedOfferEndTime is DateTime?
          ? limitedOfferEndTime
          : this.limitedOfferEndTime,
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
    picture = _i1.ColumnString(
      'picture',
      this,
    );
    hasPassedOnboarding = _i1.ColumnBool(
      'hasPassedOnboarding',
      this,
    );
    fcmToken = _i1.ColumnString(
      'fcmToken',
      this,
    );
    hasPassedGoalTutorial = _i1.ColumnBool(
      'hasPassedGoalTutorial',
      this,
    );
    informationCollectionSetting = _i1.ColumnBool(
      'informationCollectionSetting',
      this,
    );
    automaticRemindersSetting = _i1.ColumnBool(
      'automaticRemindersSetting',
      this,
    );
    archetype = _i1.ColumnEnum(
      'archetype',
      this,
      _i1.EnumSerialization.byIndex,
    );
    limitedOfferEndTime = _i1.ColumnDateTime(
      'limitedOfferEndTime',
      this,
    );
  }

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  late final _i1.ColumnDateTime birthday;

  _i3.GoalTable? ___goals;

  _i1.ManyRelation<_i3.GoalTable>? _goals;

  _i4.PurchaseItemTable? ___purchases;

  _i1.ManyRelation<_i4.PurchaseItemTable>? _purchases;

  late final _i1.ColumnInt highestStreak;

  late final _i1.ColumnString picture;

  late final _i1.ColumnBool hasPassedOnboarding;

  late final _i1.ColumnString fcmToken;

  late final _i1.ColumnBool hasPassedGoalTutorial;

  late final _i1.ColumnBool informationCollectionSetting;

  late final _i1.ColumnBool automaticRemindersSetting;

  late final _i1.ColumnEnum<_i5.Archetype> archetype;

  late final _i1.ColumnDateTime limitedOfferEndTime;

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

  _i4.PurchaseItemTable get __purchases {
    if (___purchases != null) return ___purchases!;
    ___purchases = _i1.createRelationTable(
      relationFieldName: '__purchases',
      field: User.t.id,
      foreignField: _i4.PurchaseItem.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.PurchaseItemTable(tableRelation: foreignTableRelation),
    );
    return ___purchases!;
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

  _i1.ManyRelation<_i4.PurchaseItemTable> get purchases {
    if (_purchases != null) return _purchases!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'purchases',
      field: User.t.id,
      foreignField: _i4.PurchaseItem.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.PurchaseItemTable(tableRelation: foreignTableRelation),
    );
    _purchases = _i1.ManyRelation<_i4.PurchaseItemTable>(
      tableWithRelations: relationTable,
      table: _i4.PurchaseItemTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _purchases!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userInfoId,
        birthday,
        highestStreak,
        picture,
        hasPassedOnboarding,
        fcmToken,
        hasPassedGoalTutorial,
        informationCollectionSetting,
        automaticRemindersSetting,
        archetype,
        limitedOfferEndTime,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userInfo') {
      return userInfo;
    }
    if (relationField == 'goals') {
      return __goals;
    }
    if (relationField == 'purchases') {
      return __purchases;
    }
    return null;
  }
}

class UserInclude extends _i1.IncludeObject {
  UserInclude._({
    _i2.UserInfoInclude? userInfo,
    _i3.GoalIncludeList? goals,
    _i4.PurchaseItemIncludeList? purchases,
  }) {
    _userInfo = userInfo;
    _goals = goals;
    _purchases = purchases;
  }

  _i2.UserInfoInclude? _userInfo;

  _i3.GoalIncludeList? _goals;

  _i4.PurchaseItemIncludeList? _purchases;

  @override
  Map<String, _i1.Include?> get includes => {
        'userInfo': _userInfo,
        'goals': _goals,
        'purchases': _purchases,
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

  /// Returns a list of [User]s matching the given query parameters.
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

  /// Returns the first matching [User] matching the given query parameters.
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

  /// Finds a single [User] by its [id] or null if no such row exists.
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

  /// Inserts all [User]s in the list and returns the inserted rows.
  ///
  /// The returned [User]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
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

  /// Inserts a single [User] and returns the inserted row.
  ///
  /// The returned [User] will have its `id` field set.
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

  /// Updates all [User]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
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

  /// Updates a single [User]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
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

  /// Deletes all [User]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
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

  /// Deletes a single [User].
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

  /// Deletes all rows matching the [where] expression.
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

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
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

  /// Creates a relation between this [User] and the given [Goal]s
  /// by setting each [Goal]'s foreign key `userId` to refer to this [User].
  Future<void> goals(
    _i1.Session session,
    User user,
    List<_i3.Goal> goal, {
    _i1.Transaction? transaction,
  }) async {
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
      transaction: transaction,
    );
  }

  /// Creates a relation between this [User] and the given [PurchaseItem]s
  /// by setting each [PurchaseItem]'s foreign key `userId` to refer to this [User].
  Future<void> purchases(
    _i1.Session session,
    User user,
    List<_i4.PurchaseItem> purchaseItem, {
    _i1.Transaction? transaction,
  }) async {
    if (purchaseItem.any((e) => e.id == null)) {
      throw ArgumentError.notNull('purchaseItem.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $purchaseItem =
        purchaseItem.map((e) => e.copyWith(userId: user.id)).toList();
    await session.db.update<_i4.PurchaseItem>(
      $purchaseItem,
      columns: [_i4.PurchaseItem.t.userId],
      transaction: transaction,
    );
  }
}

class UserAttachRowRepository {
  const UserAttachRowRepository._();

  /// Creates a relation between the given [User] and [UserInfo]
  /// by setting the [User]'s foreign key `userInfoId` to refer to the [UserInfo].
  Future<void> userInfo(
    _i1.Session session,
    User user,
    _i2.UserInfo userInfo, {
    _i1.Transaction? transaction,
  }) async {
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
      transaction: transaction,
    );
  }

  /// Creates a relation between this [User] and the given [Goal]
  /// by setting the [Goal]'s foreign key `userId` to refer to this [User].
  Future<void> goals(
    _i1.Session session,
    User user,
    _i3.Goal goal, {
    _i1.Transaction? transaction,
  }) async {
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
      transaction: transaction,
    );
  }

  /// Creates a relation between this [User] and the given [PurchaseItem]
  /// by setting the [PurchaseItem]'s foreign key `userId` to refer to this [User].
  Future<void> purchases(
    _i1.Session session,
    User user,
    _i4.PurchaseItem purchaseItem, {
    _i1.Transaction? transaction,
  }) async {
    if (purchaseItem.id == null) {
      throw ArgumentError.notNull('purchaseItem.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $purchaseItem = purchaseItem.copyWith(userId: user.id);
    await session.db.updateRow<_i4.PurchaseItem>(
      $purchaseItem,
      columns: [_i4.PurchaseItem.t.userId],
      transaction: transaction,
    );
  }
}
