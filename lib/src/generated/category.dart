/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Category extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  Category._({
    int? id,
    required this.title,
    required this.color,
    required this.icon,
  }) : super(id);

  factory Category({
    int? id,
    required String title,
    required String color,
    required String icon,
  }) = _CategoryImpl;

  factory Category.fromJson(Map<String, dynamic> jsonSerialization) {
    return Category(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      color: jsonSerialization['color'] as String,
      icon: jsonSerialization['icon'] as String,
    );
  }

  static final t = CategoryTable();

  static const db = CategoryRepository._();

  String title;

  String color;

  String icon;

  @override
  _i1.Table get table => t;

  Category copyWith({
    int? id,
    String? title,
    String? color,
    String? icon,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'color': color,
      'icon': icon,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'color': color,
      'icon': icon,
    };
  }

  static CategoryInclude include() {
    return CategoryInclude._();
  }

  static CategoryIncludeList includeList({
    _i1.WhereExpressionBuilder<CategoryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CategoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CategoryTable>? orderByList,
    CategoryInclude? include,
  }) {
    return CategoryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Category.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Category.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CategoryImpl extends Category {
  _CategoryImpl({
    int? id,
    required String title,
    required String color,
    required String icon,
  }) : super._(
          id: id,
          title: title,
          color: color,
          icon: icon,
        );

  @override
  Category copyWith({
    Object? id = _Undefined,
    String? title,
    String? color,
    String? icon,
  }) {
    return Category(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      color: color ?? this.color,
      icon: icon ?? this.icon,
    );
  }
}

class CategoryTable extends _i1.Table {
  CategoryTable({super.tableRelation}) : super(tableName: 'category') {
    title = _i1.ColumnString(
      'title',
      this,
    );
    color = _i1.ColumnString(
      'color',
      this,
    );
    icon = _i1.ColumnString(
      'icon',
      this,
    );
  }

  late final _i1.ColumnString title;

  late final _i1.ColumnString color;

  late final _i1.ColumnString icon;

  @override
  List<_i1.Column> get columns => [
        id,
        title,
        color,
        icon,
      ];
}

class CategoryInclude extends _i1.IncludeObject {
  CategoryInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Category.t;
}

class CategoryIncludeList extends _i1.IncludeList {
  CategoryIncludeList._({
    _i1.WhereExpressionBuilder<CategoryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Category.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Category.t;
}

class CategoryRepository {
  const CategoryRepository._();

  Future<List<Category>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CategoryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CategoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CategoryTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Category>(
      where: where?.call(Category.t),
      orderBy: orderBy?.call(Category.t),
      orderByList: orderByList?.call(Category.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Category?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CategoryTable>? where,
    int? offset,
    _i1.OrderByBuilder<CategoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CategoryTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Category>(
      where: where?.call(Category.t),
      orderBy: orderBy?.call(Category.t),
      orderByList: orderByList?.call(Category.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Category?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Category>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Category>> insert(
    _i1.Session session,
    List<Category> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Category>(
      rows,
      transaction: transaction,
    );
  }

  Future<Category> insertRow(
    _i1.Session session,
    Category row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Category>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Category>> update(
    _i1.Session session,
    List<Category> rows, {
    _i1.ColumnSelections<CategoryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Category>(
      rows,
      columns: columns?.call(Category.t),
      transaction: transaction,
    );
  }

  Future<Category> updateRow(
    _i1.Session session,
    Category row, {
    _i1.ColumnSelections<CategoryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Category>(
      row,
      columns: columns?.call(Category.t),
      transaction: transaction,
    );
  }

  Future<List<Category>> delete(
    _i1.Session session,
    List<Category> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Category>(
      rows,
      transaction: transaction,
    );
  }

  Future<Category> deleteRow(
    _i1.Session session,
    Category row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Category>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Category>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CategoryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Category>(
      where: where(Category.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CategoryTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Category>(
      where: where?.call(Category.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
