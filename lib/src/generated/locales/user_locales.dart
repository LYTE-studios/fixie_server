/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class UserLocales extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  UserLocales._({
    int? id,
    required this.email,
    this.locale,
  }) : super(id);

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

  String email;

  String? locale;

  @override
  _i1.Table get table => t;

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

class UserLocalesTable extends _i1.Table {
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
  _i1.Table get table => UserLocales.t;
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
  _i1.Table get table => UserLocales.t;
}

class UserLocalesRepository {
  const UserLocalesRepository._();

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
