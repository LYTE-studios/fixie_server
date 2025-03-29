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
import '../payment/benefit.dart' as _i2;
import '../users/user.dart' as _i3;

abstract class PurchaseItem implements _i1.TableRow, _i1.ProtocolSerialization {
  PurchaseItem._({
    this.id,
    required this.benefitIdentifier,
    this.expiryDate,
    this.created,
    this.internalInfo,
    required this.userId,
    this.user,
  });

  factory PurchaseItem({
    int? id,
    required _i2.Benefit benefitIdentifier,
    DateTime? expiryDate,
    DateTime? created,
    String? internalInfo,
    required int userId,
    _i3.User? user,
  }) = _PurchaseItemImpl;

  factory PurchaseItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return PurchaseItem(
      id: jsonSerialization['id'] as int?,
      benefitIdentifier: _i2.Benefit.fromJson(
          (jsonSerialization['benefitIdentifier'] as String)),
      expiryDate: jsonSerialization['expiryDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiryDate']),
      created: jsonSerialization['created'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['created']),
      internalInfo: jsonSerialization['internalInfo'] as String?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i3.User.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
    );
  }

  static final t = PurchaseItemTable();

  static const db = PurchaseItemRepository._();

  @override
  int? id;

  _i2.Benefit benefitIdentifier;

  DateTime? expiryDate;

  DateTime? created;

  String? internalInfo;

  int userId;

  _i3.User? user;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [PurchaseItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PurchaseItem copyWith({
    int? id,
    _i2.Benefit? benefitIdentifier,
    DateTime? expiryDate,
    DateTime? created,
    String? internalInfo,
    int? userId,
    _i3.User? user,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'benefitIdentifier': benefitIdentifier.toJson(),
      if (expiryDate != null) 'expiryDate': expiryDate?.toJson(),
      if (created != null) 'created': created?.toJson(),
      if (internalInfo != null) 'internalInfo': internalInfo,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'benefitIdentifier': benefitIdentifier.toJson(),
      if (expiryDate != null) 'expiryDate': expiryDate?.toJson(),
      if (created != null) 'created': created?.toJson(),
      if (internalInfo != null) 'internalInfo': internalInfo,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
    };
  }

  static PurchaseItemInclude include({_i3.UserInclude? user}) {
    return PurchaseItemInclude._(user: user);
  }

  static PurchaseItemIncludeList includeList({
    _i1.WhereExpressionBuilder<PurchaseItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PurchaseItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PurchaseItemTable>? orderByList,
    PurchaseItemInclude? include,
  }) {
    return PurchaseItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PurchaseItem.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PurchaseItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PurchaseItemImpl extends PurchaseItem {
  _PurchaseItemImpl({
    int? id,
    required _i2.Benefit benefitIdentifier,
    DateTime? expiryDate,
    DateTime? created,
    String? internalInfo,
    required int userId,
    _i3.User? user,
  }) : super._(
          id: id,
          benefitIdentifier: benefitIdentifier,
          expiryDate: expiryDate,
          created: created,
          internalInfo: internalInfo,
          userId: userId,
          user: user,
        );

  /// Returns a shallow copy of this [PurchaseItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PurchaseItem copyWith({
    Object? id = _Undefined,
    _i2.Benefit? benefitIdentifier,
    Object? expiryDate = _Undefined,
    Object? created = _Undefined,
    Object? internalInfo = _Undefined,
    int? userId,
    Object? user = _Undefined,
  }) {
    return PurchaseItem(
      id: id is int? ? id : this.id,
      benefitIdentifier: benefitIdentifier ?? this.benefitIdentifier,
      expiryDate: expiryDate is DateTime? ? expiryDate : this.expiryDate,
      created: created is DateTime? ? created : this.created,
      internalInfo: internalInfo is String? ? internalInfo : this.internalInfo,
      userId: userId ?? this.userId,
      user: user is _i3.User? ? user : this.user?.copyWith(),
    );
  }
}

class PurchaseItemTable extends _i1.Table {
  PurchaseItemTable({super.tableRelation}) : super(tableName: 'purchase_item') {
    benefitIdentifier = _i1.ColumnEnum(
      'benefitIdentifier',
      this,
      _i1.EnumSerialization.byName,
    );
    expiryDate = _i1.ColumnDateTime(
      'expiryDate',
      this,
    );
    created = _i1.ColumnDateTime(
      'created',
      this,
    );
    internalInfo = _i1.ColumnString(
      'internalInfo',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
  }

  late final _i1.ColumnEnum<_i2.Benefit> benefitIdentifier;

  late final _i1.ColumnDateTime expiryDate;

  late final _i1.ColumnDateTime created;

  late final _i1.ColumnString internalInfo;

  late final _i1.ColumnInt userId;

  _i3.UserTable? _user;

  _i3.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: PurchaseItem.t.userId,
      foreignField: _i3.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        benefitIdentifier,
        expiryDate,
        created,
        internalInfo,
        userId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class PurchaseItemInclude extends _i1.IncludeObject {
  PurchaseItemInclude._({_i3.UserInclude? user}) {
    _user = user;
  }

  _i3.UserInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {'user': _user};

  @override
  _i1.Table get table => PurchaseItem.t;
}

class PurchaseItemIncludeList extends _i1.IncludeList {
  PurchaseItemIncludeList._({
    _i1.WhereExpressionBuilder<PurchaseItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PurchaseItem.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => PurchaseItem.t;
}

class PurchaseItemRepository {
  const PurchaseItemRepository._();

  final attachRow = const PurchaseItemAttachRowRepository._();

  /// Returns a list of [PurchaseItem]s matching the given query parameters.
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
  Future<List<PurchaseItem>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PurchaseItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PurchaseItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PurchaseItemTable>? orderByList,
    _i1.Transaction? transaction,
    PurchaseItemInclude? include,
  }) async {
    return session.db.find<PurchaseItem>(
      where: where?.call(PurchaseItem.t),
      orderBy: orderBy?.call(PurchaseItem.t),
      orderByList: orderByList?.call(PurchaseItem.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PurchaseItem] matching the given query parameters.
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
  Future<PurchaseItem?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PurchaseItemTable>? where,
    int? offset,
    _i1.OrderByBuilder<PurchaseItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PurchaseItemTable>? orderByList,
    _i1.Transaction? transaction,
    PurchaseItemInclude? include,
  }) async {
    return session.db.findFirstRow<PurchaseItem>(
      where: where?.call(PurchaseItem.t),
      orderBy: orderBy?.call(PurchaseItem.t),
      orderByList: orderByList?.call(PurchaseItem.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PurchaseItem] by its [id] or null if no such row exists.
  Future<PurchaseItem?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PurchaseItemInclude? include,
  }) async {
    return session.db.findById<PurchaseItem>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PurchaseItem]s in the list and returns the inserted rows.
  ///
  /// The returned [PurchaseItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PurchaseItem>> insert(
    _i1.Session session,
    List<PurchaseItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PurchaseItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PurchaseItem] and returns the inserted row.
  ///
  /// The returned [PurchaseItem] will have its `id` field set.
  Future<PurchaseItem> insertRow(
    _i1.Session session,
    PurchaseItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PurchaseItem>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PurchaseItem]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PurchaseItem>> update(
    _i1.Session session,
    List<PurchaseItem> rows, {
    _i1.ColumnSelections<PurchaseItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PurchaseItem>(
      rows,
      columns: columns?.call(PurchaseItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PurchaseItem]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PurchaseItem> updateRow(
    _i1.Session session,
    PurchaseItem row, {
    _i1.ColumnSelections<PurchaseItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PurchaseItem>(
      row,
      columns: columns?.call(PurchaseItem.t),
      transaction: transaction,
    );
  }

  /// Deletes all [PurchaseItem]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PurchaseItem>> delete(
    _i1.Session session,
    List<PurchaseItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PurchaseItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PurchaseItem].
  Future<PurchaseItem> deleteRow(
    _i1.Session session,
    PurchaseItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PurchaseItem>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PurchaseItem>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PurchaseItemTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PurchaseItem>(
      where: where(PurchaseItem.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PurchaseItemTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PurchaseItem>(
      where: where?.call(PurchaseItem.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PurchaseItemAttachRowRepository {
  const PurchaseItemAttachRowRepository._();

  /// Creates a relation between the given [PurchaseItem] and [User]
  /// by setting the [PurchaseItem]'s foreign key `userId` to refer to the [User].
  Future<void> user(
    _i1.Session session,
    PurchaseItem purchaseItem,
    _i3.User user, {
    _i1.Transaction? transaction,
  }) async {
    if (purchaseItem.id == null) {
      throw ArgumentError.notNull('purchaseItem.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $purchaseItem = purchaseItem.copyWith(userId: user.id);
    await session.db.updateRow<PurchaseItem>(
      $purchaseItem,
      columns: [PurchaseItem.t.userId],
      transaction: transaction,
    );
  }
}
