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

abstract class UserLocales
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  UserLocales._({
    this.id,
    required this.email,
    this.locale,
  });

  factory UserLocales({
    int? id,
    required String email,
    String? locale,
  }) = _UserLocalesImpl;

  factory UserLocales.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserLocales(
      id: jsonSerialization['id'] as int?,
      email: jsonSerialization['email'] as String,
      locale: jsonSerialization['locale'] as String?,
    );
  }

  static final t = UserLocalesTable();

  static const db = UserLocalesRepository._();

  @override
  int? id;

  String email;

  String? locale;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [UserLocales]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserLocales copyWith({
    int? id,
    String? email,
    String? locale,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'email': email,
      if (locale != null) 'locale': locale,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'email': email,
      if (locale != null) 'locale': locale,
    };
  }

  static UserLocalesInclude include() {
    return UserLocalesInclude._();
  }

  static UserLocalesIncludeList includeList({
    _i1.WhereExpressionBuilder<UserLocalesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserLocalesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserLocalesTable>? orderByList,
    UserLocalesInclude? include,
  }) {
    return UserLocalesIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserLocales.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserLocales.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserLocalesImpl extends UserLocales {
  _UserLocalesImpl({
    int? id,
    required String email,
    String? locale,
  }) : super._(
          id: id,
          email: email,
          locale: locale,
        );

  /// Returns a shallow copy of this [UserLocales]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserLocales copyWith({
    Object? id = _Undefined,
    String? email,
    Object? locale = _Undefined,
  }) {
    return UserLocales(
      id: id is int? ? id : this.id,
      email: email ?? this.email,
      locale: locale is String? ? locale : this.locale,
    );
  }
}

class UserLocalesTable extends _i1.Table<int?> {
  UserLocalesTable({super.tableRelation}) : super(tableName: 'user_locales') {
    email = _i1.ColumnString(
      'email',
      this,
    );
    locale = _i1.ColumnString(
      'locale',
      this,
    );
  }

  late final _i1.ColumnString email;

  late final _i1.ColumnString locale;

  @override
  List<_i1.Column> get columns => [
        id,
        email,
        locale,
      ];
}

class UserLocalesInclude extends _i1.IncludeObject {
  UserLocalesInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => UserLocales.t;
}

class UserLocalesIncludeList extends _i1.IncludeList {
  UserLocalesIncludeList._({
    _i1.WhereExpressionBuilder<UserLocalesTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserLocales.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => UserLocales.t;
}

class UserLocalesRepository {
  const UserLocalesRepository._();

  /// Returns a list of [UserLocales]s matching the given query parameters.
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
  Future<List<UserLocales>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserLocalesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserLocalesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserLocalesTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<UserLocales>(
      where: where?.call(UserLocales.t),
      orderBy: orderBy?.call(UserLocales.t),
      orderByList: orderByList?.call(UserLocales.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [UserLocales] matching the given query parameters.
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
  Future<UserLocales?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserLocalesTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserLocalesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserLocalesTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<UserLocales>(
      where: where?.call(UserLocales.t),
      orderBy: orderBy?.call(UserLocales.t),
      orderByList: orderByList?.call(UserLocales.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [UserLocales] by its [id] or null if no such row exists.
  Future<UserLocales?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<UserLocales>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [UserLocales]s in the list and returns the inserted rows.
  ///
  /// The returned [UserLocales]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<UserLocales>> insert(
    _i1.Session session,
    List<UserLocales> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserLocales>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [UserLocales] and returns the inserted row.
  ///
  /// The returned [UserLocales] will have its `id` field set.
  Future<UserLocales> insertRow(
    _i1.Session session,
    UserLocales row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserLocales>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [UserLocales]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UserLocales>> update(
    _i1.Session session,
    List<UserLocales> rows, {
    _i1.ColumnSelections<UserLocalesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserLocales>(
      rows,
      columns: columns?.call(UserLocales.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserLocales]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserLocales> updateRow(
    _i1.Session session,
    UserLocales row, {
    _i1.ColumnSelections<UserLocalesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserLocales>(
      row,
      columns: columns?.call(UserLocales.t),
      transaction: transaction,
    );
  }

  /// Deletes all [UserLocales]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UserLocales>> delete(
    _i1.Session session,
    List<UserLocales> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserLocales>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [UserLocales].
  Future<UserLocales> deleteRow(
    _i1.Session session,
    UserLocales row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserLocales>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<UserLocales>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserLocalesTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserLocales>(
      where: where(UserLocales.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserLocalesTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserLocales>(
      where: where?.call(UserLocales.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
