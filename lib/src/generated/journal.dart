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

abstract class Journal extends _i1.TableRow {
  Journal._({
    int? id,
    required this.userId,
    this.user,
    required this.text,
    required this.date,
    this.pictures,
  }) : super(id);

  factory Journal({
    int? id,
    required int userId,
    _i2.User? user,
    required String text,
    required DateTime date,
    List<String>? pictures,
  }) = _JournalImpl;

  factory Journal.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Journal(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      user: serializationManager
          .deserialize<_i2.User?>(jsonSerialization['user']),
      text: serializationManager.deserialize<String>(jsonSerialization['text']),
      date:
          serializationManager.deserialize<DateTime>(jsonSerialization['date']),
      pictures: serializationManager
          .deserialize<List<String>?>(jsonSerialization['pictures']),
    );
  }

  static final t = JournalTable();

  static const db = JournalRepository._();

  int userId;

  _i2.User? user;

  String text;

  DateTime date;

  List<String>? pictures;

  @override
  _i1.Table get table => t;

  Journal copyWith({
    int? id,
    int? userId,
    _i2.User? user,
    String? text,
    DateTime? date,
    List<String>? pictures,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'text': text,
      'date': date.toJson(),
      if (pictures != null) 'pictures': pictures?.toJson(),
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'userId': userId,
      'text': text,
      'date': date,
      'pictures': pictures,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.allToJson(),
      'text': text,
      'date': date.toJson(),
      if (pictures != null) 'pictures': pictures?.toJson(),
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
      case 'userId':
        userId = value;
        return;
      case 'text':
        text = value;
        return;
      case 'date':
        date = value;
        return;
      case 'pictures':
        pictures = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<Journal>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<JournalTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
    JournalInclude? include,
  }) async {
    return session.db.find<Journal>(
      where: where != null ? where(Journal.t) : null,
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
  static Future<Journal?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<JournalTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
    JournalInclude? include,
  }) async {
    return session.db.findSingleRow<Journal>(
      where: where != null ? where(Journal.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<Journal?> findById(
    _i1.Session session,
    int id, {
    JournalInclude? include,
  }) async {
    return session.db.findById<Journal>(
      id,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<JournalTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Journal>(
      where: where(Journal.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    Journal row, {
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
    Journal row, {
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
    Journal row, {
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
    _i1.WhereExpressionBuilder<JournalTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Journal>(
      where: where != null ? where(Journal.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static JournalInclude include({_i2.UserInclude? user}) {
    return JournalInclude._(user: user);
  }

  static JournalIncludeList includeList({
    _i1.WhereExpressionBuilder<JournalTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<JournalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<JournalTable>? orderByList,
    JournalInclude? include,
  }) {
    return JournalIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Journal.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Journal.t),
      include: include,
    );
  }
}

class _Undefined {}

class _JournalImpl extends Journal {
  _JournalImpl({
    int? id,
    required int userId,
    _i2.User? user,
    required String text,
    required DateTime date,
    List<String>? pictures,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          text: text,
          date: date,
          pictures: pictures,
        );

  @override
  Journal copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    String? text,
    DateTime? date,
    Object? pictures = _Undefined,
  }) {
    return Journal(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      text: text ?? this.text,
      date: date ?? this.date,
      pictures: pictures is List<String>? ? pictures : this.pictures?.clone(),
    );
  }
}

class JournalTable extends _i1.Table {
  JournalTable({super.tableRelation}) : super(tableName: 'journal') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    text = _i1.ColumnString(
      'text',
      this,
    );
    date = _i1.ColumnDateTime(
      'date',
      this,
    );
    pictures = _i1.ColumnSerializable(
      'pictures',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  _i2.UserTable? _user;

  late final _i1.ColumnString text;

  late final _i1.ColumnDateTime date;

  late final _i1.ColumnSerializable pictures;

  _i2.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: Journal.t.userId,
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
        userId,
        text,
        date,
        pictures,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

@Deprecated('Use JournalTable.t instead.')
JournalTable tJournal = JournalTable();

class JournalInclude extends _i1.IncludeObject {
  JournalInclude._({_i2.UserInclude? user}) {
    _user = user;
  }

  _i2.UserInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {'user': _user};

  @override
  _i1.Table get table => Journal.t;
}

class JournalIncludeList extends _i1.IncludeList {
  JournalIncludeList._({
    _i1.WhereExpressionBuilder<JournalTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Journal.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Journal.t;
}

class JournalRepository {
  const JournalRepository._();

  final attachRow = const JournalAttachRowRepository._();

  Future<List<Journal>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<JournalTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<JournalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<JournalTable>? orderByList,
    _i1.Transaction? transaction,
    JournalInclude? include,
  }) async {
    return session.dbNext.find<Journal>(
      where: where?.call(Journal.t),
      orderBy: orderBy?.call(Journal.t),
      orderByList: orderByList?.call(Journal.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Journal?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<JournalTable>? where,
    int? offset,
    _i1.OrderByBuilder<JournalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<JournalTable>? orderByList,
    _i1.Transaction? transaction,
    JournalInclude? include,
  }) async {
    return session.dbNext.findFirstRow<Journal>(
      where: where?.call(Journal.t),
      orderBy: orderBy?.call(Journal.t),
      orderByList: orderByList?.call(Journal.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Journal?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    JournalInclude? include,
  }) async {
    return session.dbNext.findById<Journal>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Journal>> insert(
    _i1.Session session,
    List<Journal> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<Journal>(
      rows,
      transaction: transaction,
    );
  }

  Future<Journal> insertRow(
    _i1.Session session,
    Journal row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<Journal>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Journal>> update(
    _i1.Session session,
    List<Journal> rows, {
    _i1.ColumnSelections<JournalTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<Journal>(
      rows,
      columns: columns?.call(Journal.t),
      transaction: transaction,
    );
  }

  Future<Journal> updateRow(
    _i1.Session session,
    Journal row, {
    _i1.ColumnSelections<JournalTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<Journal>(
      row,
      columns: columns?.call(Journal.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<Journal> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<Journal>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    Journal row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<Journal>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<JournalTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<Journal>(
      where: where(Journal.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<JournalTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<Journal>(
      where: where?.call(Journal.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class JournalAttachRowRepository {
  const JournalAttachRowRepository._();

  Future<void> user(
    _i1.Session session,
    Journal journal,
    _i2.User user,
  ) async {
    if (journal.id == null) {
      throw ArgumentError.notNull('journal.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $journal = journal.copyWith(userId: user.id);
    await session.dbNext.updateRow<Journal>(
      $journal,
      columns: [Journal.t.userId],
    );
  }
}
