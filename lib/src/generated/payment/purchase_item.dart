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
import '../protocol.dart' as _i2;

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
    _i2.User? user,
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
          : _i2.User.fromJson(
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

  _i2.User? user;

  @override
  _i1.Table get table => t;

  PurchaseItem copyWith({
    int? id,
    _i2.Benefit? benefitIdentifier,
    DateTime? expiryDate,
    DateTime? created,
    String? internalInfo,
    int? userId,
    _i2.User? user,
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

  static PurchaseItemInclude include({_i2.UserInclude? user}) {
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
    _i2.User? user,
  }) : super._(
          id: id,
          benefitIdentifier: benefitIdentifier,
          expiryDate: expiryDate,
          created: created,
          internalInfo: internalInfo,
          userId: userId,
          user: user,
        );

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
      user: user is _i2.User? ? user : this.user?.copyWith(),
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

  _i2.UserTable? _user;

  _i2.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: PurchaseItem.t.userId,
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
  PurchaseItemInclude._({_i2.UserInclude? user}) {
    _user = user;
  }

  _i2.UserInclude? _user;

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

  Future<List<PurchaseItem>> find(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<PurchaseItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PurchaseItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PurchaseItemTable>? orderByList,
    _i1.Transaction? transaction,
    PurchaseItemInclude? include,
  }) async {
    return databaseAccessor.db.find<PurchaseItem>(
      where: where?.call(PurchaseItem.t),
      orderBy: orderBy?.call(PurchaseItem.t),
      orderByList: orderByList?.call(PurchaseItem.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<PurchaseItem?> findFirstRow(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<PurchaseItemTable>? where,
    int? offset,
    _i1.OrderByBuilder<PurchaseItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PurchaseItemTable>? orderByList,
    _i1.Transaction? transaction,
    PurchaseItemInclude? include,
  }) async {
    return databaseAccessor.db.findFirstRow<PurchaseItem>(
      where: where?.call(PurchaseItem.t),
      orderBy: orderBy?.call(PurchaseItem.t),
      orderByList: orderByList?.call(PurchaseItem.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<PurchaseItem?> findById(
    _i1.DatabaseAccessor databaseAccessor,
    int id, {
    _i1.Transaction? transaction,
    PurchaseItemInclude? include,
  }) async {
    return databaseAccessor.db.findById<PurchaseItem>(
      id,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<List<PurchaseItem>> insert(
    _i1.DatabaseAccessor databaseAccessor,
    List<PurchaseItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insert<PurchaseItem>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<PurchaseItem> insertRow(
    _i1.DatabaseAccessor databaseAccessor,
    PurchaseItem row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insertRow<PurchaseItem>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<PurchaseItem>> update(
    _i1.DatabaseAccessor databaseAccessor,
    List<PurchaseItem> rows, {
    _i1.ColumnSelections<PurchaseItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.update<PurchaseItem>(
      rows,
      columns: columns?.call(PurchaseItem.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<PurchaseItem> updateRow(
    _i1.DatabaseAccessor databaseAccessor,
    PurchaseItem row, {
    _i1.ColumnSelections<PurchaseItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.updateRow<PurchaseItem>(
      row,
      columns: columns?.call(PurchaseItem.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<PurchaseItem>> delete(
    _i1.DatabaseAccessor databaseAccessor,
    List<PurchaseItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.delete<PurchaseItem>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<PurchaseItem> deleteRow(
    _i1.DatabaseAccessor databaseAccessor,
    PurchaseItem row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteRow<PurchaseItem>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<PurchaseItem>> deleteWhere(
    _i1.DatabaseAccessor databaseAccessor, {
    required _i1.WhereExpressionBuilder<PurchaseItemTable> where,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteWhere<PurchaseItem>(
      where: where(PurchaseItem.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<int> count(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<PurchaseItemTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.count<PurchaseItem>(
      where: where?.call(PurchaseItem.t),
      limit: limit,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class PurchaseItemAttachRowRepository {
  const PurchaseItemAttachRowRepository._();

  Future<void> user(
    _i1.DatabaseAccessor databaseAccessor,
    PurchaseItem purchaseItem,
    _i2.User user, {
    _i1.Transaction? transaction,
  }) async {
    if (purchaseItem.id == null) {
      throw ArgumentError.notNull('purchaseItem.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $purchaseItem = purchaseItem.copyWith(userId: user.id);
    await databaseAccessor.db.updateRow<PurchaseItem>(
      $purchaseItem,
      columns: [PurchaseItem.t.userId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}
