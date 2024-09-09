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
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'category/category.dart' as _i4;
import 'category/create_category_dto.dart' as _i5;
import 'core/endpoint_exception.dart' as _i6;
import 'core/error_types.dart' as _i7;
import 'goals/create_goal_dto.dart' as _i8;
import 'goals/goal.dart' as _i9;
import 'journals/journal_list_dto.dart' as _i10;
import 'journals/journal_log.dart' as _i11;
import 'journals/registration_log.dart' as _i12;
import 'notifications/notification.dart' as _i13;
import 'shared/repetition.dart' as _i14;
import 'statistics/category_statistics.dart' as _i15;
import 'statistics/goal_statistics.dart' as _i16;
import 'statistics/user_statistics.dart' as _i17;
import 'users/user.dart' as _i18;
import 'users/user_profile_dto.dart' as _i19;
import 'protocol.dart' as _i20;
import 'package:fixie_server/src/generated/category/category.dart' as _i21;
import 'package:fixie_server/src/generated/goals/goal.dart' as _i22;
import 'package:fixie_server/src/generated/journals/journal_log.dart' as _i23;
export 'category/category.dart';
export 'category/create_category_dto.dart';
export 'core/endpoint_exception.dart';
export 'core/error_types.dart';
export 'goals/create_goal_dto.dart';
export 'goals/goal.dart';
export 'journals/journal_list_dto.dart';
export 'journals/journal_log.dart';
export 'journals/registration_log.dart';
export 'notifications/notification.dart';
export 'shared/repetition.dart';
export 'statistics/category_statistics.dart';
export 'statistics/goal_statistics.dart';
export 'statistics/user_statistics.dart';
export 'users/user.dart';
export 'users/user_profile_dto.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'category',
      dartName: 'Category',
      schema: 'public',
      module: 'fixie',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'category_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'color',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'icon',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'category_pkey',
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
      name: 'fixie_user',
      dartName: 'User',
      schema: 'public',
      module: 'fixie',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'fixie_user_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'birthday',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'highestStreak',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'picture',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'hasPassedOnboarding',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
        ),
        _i2.ColumnDefinition(
          name: 'fcmToken',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'fixie_user_fk_0',
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
          indexName: 'fixie_user_pkey',
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
      name: 'goal',
      dartName: 'Goal',
      schema: 'public',
      module: 'fixie',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
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
          columnType: _i2.ColumnType.bigint,
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
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'unit',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'categoryId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'repetition',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'protocol:Repetition?',
        ),
        _i2.ColumnDefinition(
          name: 'repeatEvery',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'weekdays',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<int>?',
        ),
        _i2.ColumnDefinition(
          name: 'end',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'reminders',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<DateTime>?',
        ),
        _i2.ColumnDefinition(
          name: 'highestStreak',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'active',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'archived',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'created',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'goal_fk_0',
          columns: ['userId'],
          referenceTable: 'fixie_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'goal_fk_1',
          columns: ['categoryId'],
          referenceTable: 'category',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
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
      name: 'journal_log',
      dartName: 'JournalLog',
      schema: 'public',
      module: 'fixie',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'journal_log_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'goalId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'picture',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'note',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'loggedValue',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'registrationLog',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<protocol:RegistrationLog>?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'modifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'date',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'streak',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'journal_log_fk_0',
          columns: ['goalId'],
          referenceTable: 'goal',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'journal_log_pkey',
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
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.Category) {
      return _i4.Category.fromJson(data) as T;
    }
    if (t == _i5.CreateCategoryDto) {
      return _i5.CreateCategoryDto.fromJson(data) as T;
    }
    if (t == _i6.EndpointException) {
      return _i6.EndpointException.fromJson(data) as T;
    }
    if (t == _i7.ErrorType) {
      return _i7.ErrorType.fromJson(data) as T;
    }
    if (t == _i8.CreateGoalDto) {
      return _i8.CreateGoalDto.fromJson(data) as T;
    }
    if (t == _i9.Goal) {
      return _i9.Goal.fromJson(data) as T;
    }
    if (t == _i10.JournalListDto) {
      return _i10.JournalListDto.fromJson(data) as T;
    }
    if (t == _i11.JournalLog) {
      return _i11.JournalLog.fromJson(data) as T;
    }
    if (t == _i12.RegistrationLog) {
      return _i12.RegistrationLog.fromJson(data) as T;
    }
    if (t == _i13.Notification) {
      return _i13.Notification.fromJson(data) as T;
    }
    if (t == _i14.Repetition) {
      return _i14.Repetition.fromJson(data) as T;
    }
    if (t == _i15.CategoryStatistics) {
      return _i15.CategoryStatistics.fromJson(data) as T;
    }
    if (t == _i16.GoalStatistics) {
      return _i16.GoalStatistics.fromJson(data) as T;
    }
    if (t == _i17.UserStatistics) {
      return _i17.UserStatistics.fromJson(data) as T;
    }
    if (t == _i18.User) {
      return _i18.User.fromJson(data) as T;
    }
    if (t == _i19.UserProfileDto) {
      return _i19.UserProfileDto.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.Category?>()) {
      return (data != null ? _i4.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.CreateCategoryDto?>()) {
      return (data != null ? _i5.CreateCategoryDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.EndpointException?>()) {
      return (data != null ? _i6.EndpointException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.ErrorType?>()) {
      return (data != null ? _i7.ErrorType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.CreateGoalDto?>()) {
      return (data != null ? _i8.CreateGoalDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Goal?>()) {
      return (data != null ? _i9.Goal.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.JournalListDto?>()) {
      return (data != null ? _i10.JournalListDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.JournalLog?>()) {
      return (data != null ? _i11.JournalLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.RegistrationLog?>()) {
      return (data != null ? _i12.RegistrationLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Notification?>()) {
      return (data != null ? _i13.Notification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Repetition?>()) {
      return (data != null ? _i14.Repetition.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.CategoryStatistics?>()) {
      return (data != null ? _i15.CategoryStatistics.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i16.GoalStatistics?>()) {
      return (data != null ? _i16.GoalStatistics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.UserStatistics?>()) {
      return (data != null ? _i17.UserStatistics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.User?>()) {
      return (data != null ? _i18.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.UserProfileDto?>()) {
      return (data != null ? _i19.UserProfileDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<DateTime>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<DateTime>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<DateTime>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<DateTime>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i20.JournalLog>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i20.JournalLog>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i20.JournalLog>) {
      return (data as List).map((e) => deserialize<_i20.JournalLog>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i20.RegistrationLog>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i20.RegistrationLog>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == Map<DateTime, double?>) {
      return Map.fromEntries((data as List).map((e) => MapEntry(
              deserialize<DateTime>(e['k']), deserialize<double?>(e['v']))))
          as dynamic;
    }
    if (t == _i1.getType<List<_i20.Goal>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i20.Goal>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i21.Category>) {
      return (data as List).map((e) => deserialize<_i21.Category>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i22.Goal>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i22.Goal>(e)).toList()
          : null) as dynamic;
    }
    if (t == Map<String, String?>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<String?>(v))) as dynamic;
    }
    if (t == _i1.getType<List<_i23.JournalLog>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i23.JournalLog>(e)).toList()
          : null) as dynamic;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
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
    if (data is _i5.CreateCategoryDto) {
      return 'CreateCategoryDto';
    }
    if (data is _i6.EndpointException) {
      return 'EndpointException';
    }
    if (data is _i7.ErrorType) {
      return 'ErrorType';
    }
    if (data is _i8.CreateGoalDto) {
      return 'CreateGoalDto';
    }
    if (data is _i9.Goal) {
      return 'Goal';
    }
    if (data is _i10.JournalListDto) {
      return 'JournalListDto';
    }
    if (data is _i11.JournalLog) {
      return 'JournalLog';
    }
    if (data is _i12.RegistrationLog) {
      return 'RegistrationLog';
    }
    if (data is _i13.Notification) {
      return 'Notification';
    }
    if (data is _i14.Repetition) {
      return 'Repetition';
    }
    if (data is _i15.CategoryStatistics) {
      return 'CategoryStatistics';
    }
    if (data is _i16.GoalStatistics) {
      return 'GoalStatistics';
    }
    if (data is _i17.UserStatistics) {
      return 'UserStatistics';
    }
    if (data is _i18.User) {
      return 'User';
    }
    if (data is _i19.UserProfileDto) {
      return 'UserProfileDto';
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
    if (data['className'] == 'CreateCategoryDto') {
      return deserialize<_i5.CreateCategoryDto>(data['data']);
    }
    if (data['className'] == 'EndpointException') {
      return deserialize<_i6.EndpointException>(data['data']);
    }
    if (data['className'] == 'ErrorType') {
      return deserialize<_i7.ErrorType>(data['data']);
    }
    if (data['className'] == 'CreateGoalDto') {
      return deserialize<_i8.CreateGoalDto>(data['data']);
    }
    if (data['className'] == 'Goal') {
      return deserialize<_i9.Goal>(data['data']);
    }
    if (data['className'] == 'JournalListDto') {
      return deserialize<_i10.JournalListDto>(data['data']);
    }
    if (data['className'] == 'JournalLog') {
      return deserialize<_i11.JournalLog>(data['data']);
    }
    if (data['className'] == 'RegistrationLog') {
      return deserialize<_i12.RegistrationLog>(data['data']);
    }
    if (data['className'] == 'Notification') {
      return deserialize<_i13.Notification>(data['data']);
    }
    if (data['className'] == 'Repetition') {
      return deserialize<_i14.Repetition>(data['data']);
    }
    if (data['className'] == 'CategoryStatistics') {
      return deserialize<_i15.CategoryStatistics>(data['data']);
    }
    if (data['className'] == 'GoalStatistics') {
      return deserialize<_i16.GoalStatistics>(data['data']);
    }
    if (data['className'] == 'UserStatistics') {
      return deserialize<_i17.UserStatistics>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i18.User>(data['data']);
    }
    if (data['className'] == 'UserProfileDto') {
      return deserialize<_i19.UserProfileDto>(data['data']);
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
      case _i4.Category:
        return _i4.Category.t;
      case _i9.Goal:
        return _i9.Goal.t;
      case _i11.JournalLog:
        return _i11.JournalLog.t;
      case _i18.User:
        return _i18.User.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'fixie';
}
