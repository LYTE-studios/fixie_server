/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/module.dart' as _i3;
import 'category.dart' as _i4;
import 'days.dart' as _i5;
import 'endpoint_exception.dart' as _i6;
import 'error_types.dart' as _i7;
import 'goal.dart' as _i8;
import 'journal.dart' as _i9;
import 'repetition.dart' as _i10;
import 'target_period.dart' as _i11;
import 'user.dart' as _i12;
import 'userProfile.dart' as _i13;
import 'protocol.dart' as _i14;
import 'package:fixie_server/src/generated/goal.dart' as _i15;
export 'category.dart';
export 'days.dart';
export 'endpoint_exception.dart';
export 'error_types.dart';
export 'goal.dart';
export 'journal.dart';
export 'repetition.dart';
export 'target_period.dart';
export 'user.dart';
export 'userProfile.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'goal',
      dartName: 'Goal',
      schema: 'public',
      module: 'fixie',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'goal_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'picture',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'target',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'targetPeriod',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'protocol:TargetPeriod',
        ),
        _i2.ColumnDefinition(
          name: 'category',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:Category',
        ),
        _i2.ColumnDefinition(
          name: 'repetition',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:Repetition',
        ),
        _i2.ColumnDefinition(
          name: 'days',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<protocol:Days>?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'goal_fk_0',
          columns: ['userId'],
          referenceTable: 'user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'goal_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'journal',
      dartName: 'Journal',
      schema: 'public',
      module: 'fixie',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'journal_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'date',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'pictures',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'journal_fk_0',
          columns: ['userId'],
          referenceTable: 'user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'journal_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user',
      dartName: 'User',
      schema: 'public',
      module: 'fixie',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'birthday',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'user_fk_0',
          columns: ['userInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'user_info_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userInfoId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i4.Category) {
      return _i4.Category.fromJson(data) as T;
    }
    if (t == _i5.Days) {
      return _i5.Days.fromJson(data) as T;
    }
    if (t == _i6.EndpointException) {
      return _i6.EndpointException.fromJson(data, this) as T;
    }
    if (t == _i7.ErrorType) {
      return _i7.ErrorType.fromJson(data) as T;
    }
    if (t == _i8.Goal) {
      return _i8.Goal.fromJson(data, this) as T;
    }
    if (t == _i9.Journal) {
      return _i9.Journal.fromJson(data, this) as T;
    }
    if (t == _i10.Repetition) {
      return _i10.Repetition.fromJson(data) as T;
    }
    if (t == _i11.TargetPeriod) {
      return _i11.TargetPeriod.fromJson(data) as T;
    }
    if (t == _i12.User) {
      return _i12.User.fromJson(data, this) as T;
    }
    if (t == _i13.UserProfile) {
      return _i13.UserProfile.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i4.Category?>()) {
      return (data != null ? _i4.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Days?>()) {
      return (data != null ? _i5.Days.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.EndpointException?>()) {
      return (data != null ? _i6.EndpointException.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i7.ErrorType?>()) {
      return (data != null ? _i7.ErrorType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Goal?>()) {
      return (data != null ? _i8.Goal.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i9.Journal?>()) {
      return (data != null ? _i9.Journal.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i10.Repetition?>()) {
      return (data != null ? _i10.Repetition.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.TargetPeriod?>()) {
      return (data != null ? _i11.TargetPeriod.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.User?>()) {
      return (data != null ? _i12.User.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i13.UserProfile?>()) {
      return (data != null ? _i13.UserProfile.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<List<_i14.Days>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i14.Days>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i14.Goal>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i14.Goal>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i14.Journal>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i14.Journal>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i15.Goal>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i15.Goal>(e)).toList()
          : null) as dynamic;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i4.Category) {
      return 'Category';
    }
    if (data is _i5.Days) {
      return 'Days';
    }
    if (data is _i6.EndpointException) {
      return 'EndpointException';
    }
    if (data is _i7.ErrorType) {
      return 'ErrorType';
    }
    if (data is _i8.Goal) {
      return 'Goal';
    }
    if (data is _i9.Journal) {
      return 'Journal';
    }
    if (data is _i10.Repetition) {
      return 'Repetition';
    }
    if (data is _i11.TargetPeriod) {
      return 'TargetPeriod';
    }
    if (data is _i12.User) {
      return 'User';
    }
    if (data is _i13.UserProfile) {
      return 'UserProfile';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Category') {
      return deserialize<_i4.Category>(data['data']);
    }
    if (data['className'] == 'Days') {
      return deserialize<_i5.Days>(data['data']);
    }
    if (data['className'] == 'EndpointException') {
      return deserialize<_i6.EndpointException>(data['data']);
    }
    if (data['className'] == 'ErrorType') {
      return deserialize<_i7.ErrorType>(data['data']);
    }
    if (data['className'] == 'Goal') {
      return deserialize<_i8.Goal>(data['data']);
    }
    if (data['className'] == 'Journal') {
      return deserialize<_i9.Journal>(data['data']);
    }
    if (data['className'] == 'Repetition') {
      return deserialize<_i10.Repetition>(data['data']);
    }
    if (data['className'] == 'TargetPeriod') {
      return deserialize<_i11.TargetPeriod>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i12.User>(data['data']);
    }
    if (data['className'] == 'UserProfile') {
      return deserialize<_i13.UserProfile>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i8.Goal:
        return _i8.Goal.t;
      case _i9.Journal:
        return _i9.Journal.t;
      case _i12.User:
        return _i12.User.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'fixie';
}
