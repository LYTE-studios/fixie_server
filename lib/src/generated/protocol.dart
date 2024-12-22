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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'category/category.dart' as _i4;
import 'category/create_category_dto.dart' as _i5;
import 'core/endpoint_exception.dart' as _i6;
import 'core/error_types.dart' as _i7;
import 'core/id_dto.dart' as _i8;
import 'goals/create_goal_dto.dart' as _i9;
import 'goals/goal.dart' as _i10;
import 'journals/journal_list_dto.dart' as _i11;
import 'journals/journal_log.dart' as _i12;
import 'journals/registration_log.dart' as _i13;
import 'locales/user_locales.dart' as _i14;
import 'notifications/notification.dart' as _i15;
import 'payment/benefit.dart' as _i16;
import 'payment/purchase_item.dart' as _i17;
import 'shared/repetition.dart' as _i18;
import 'statistics/goal_statistics.dart' as _i19;
import 'statistics/statistics.dart' as _i20;
import 'statistics/user_statistics.dart' as _i21;
import 'theme/app_theme.dart' as _i22;
import 'users/user.dart' as _i23;
import 'users/user_profile_dto.dart' as _i24;
import 'package:fixie_server/src/generated/goals/goal.dart' as _i25;
import 'package:fixie_server/src/generated/category/category.dart' as _i26;
import 'package:fixie_server/src/generated/journals/journal_log.dart' as _i27;
import 'package:fixie_server/src/generated/payment/purchase_item.dart' as _i28;
export 'category/category.dart';
export 'category/create_category_dto.dart';
export 'core/endpoint_exception.dart';
export 'core/error_types.dart';
export 'core/id_dto.dart';
export 'goals/create_goal_dto.dart';
export 'goals/goal.dart';
export 'journals/journal_list_dto.dart';
export 'journals/journal_log.dart';
export 'journals/registration_log.dart';
export 'locales/user_locales.dart';
export 'notifications/notification.dart';
export 'payment/benefit.dart';
export 'payment/purchase_item.dart';
export 'shared/repetition.dart';
export 'statistics/goal_statistics.dart';
export 'statistics/statistics.dart';
export 'statistics/user_statistics.dart';
export 'theme/app_theme.dart';
export 'users/user.dart';
export 'users/user_profile_dto.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'app_theme',
      dartName: 'AppTheme',
      schema: 'public',
      module: 'fixie',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'app_theme_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'validFrom',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'validUntil',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'disabled',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
        ),
        _i2.ColumnDefinition(
          name: 'primaryColor',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'mainGradientFirstColor',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'mainGradientSecondColor',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'backgroundColor',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'app_theme_pkey',
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
        _i2.ColumnDefinition(
          name: 'presetId',
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
        _i2.ColumnDefinition(
          name: 'hasPassedGoalTutorial',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
        ),
        _i2.ColumnDefinition(
          name: 'informationCollectionSetting',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
        ),
        _i2.ColumnDefinition(
          name: 'automaticRemindersSetting',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
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
        _i2.ColumnDefinition(
          name: 'currentStreak',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
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
    _i2.TableDefinition(
      name: 'purchase_item',
      dartName: 'PurchaseItem',
      schema: 'public',
      module: 'fixie',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'purchase_item_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'benefitIdentifier',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:Benefit',
        ),
        _i2.ColumnDefinition(
          name: 'expiryDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'created',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'internalInfo',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'purchase_item_fk_0',
          columns: ['userId'],
          referenceTable: 'fixie_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'purchase_item_pkey',
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
      name: 'user_locales',
      dartName: 'UserLocales',
      schema: 'public',
      module: 'fixie',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_locales_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'locale',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_locales_pkey',
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
    if (t == _i8.IdDto) {
      return _i8.IdDto.fromJson(data) as T;
    }
    if (t == _i9.CreateGoalDto) {
      return _i9.CreateGoalDto.fromJson(data) as T;
    }
    if (t == _i10.Goal) {
      return _i10.Goal.fromJson(data) as T;
    }
    if (t == _i11.JournalListDto) {
      return _i11.JournalListDto.fromJson(data) as T;
    }
    if (t == _i12.JournalLog) {
      return _i12.JournalLog.fromJson(data) as T;
    }
    if (t == _i13.RegistrationLog) {
      return _i13.RegistrationLog.fromJson(data) as T;
    }
    if (t == _i14.UserLocales) {
      return _i14.UserLocales.fromJson(data) as T;
    }
    if (t == _i15.Notification) {
      return _i15.Notification.fromJson(data) as T;
    }
    if (t == _i16.Benefit) {
      return _i16.Benefit.fromJson(data) as T;
    }
    if (t == _i17.PurchaseItem) {
      return _i17.PurchaseItem.fromJson(data) as T;
    }
    if (t == _i18.Repetition) {
      return _i18.Repetition.fromJson(data) as T;
    }
    if (t == _i19.GoalStatistics) {
      return _i19.GoalStatistics.fromJson(data) as T;
    }
    if (t == _i20.Statistics) {
      return _i20.Statistics.fromJson(data) as T;
    }
    if (t == _i21.UserStatistics) {
      return _i21.UserStatistics.fromJson(data) as T;
    }
    if (t == _i22.AppTheme) {
      return _i22.AppTheme.fromJson(data) as T;
    }
    if (t == _i23.User) {
      return _i23.User.fromJson(data) as T;
    }
    if (t == _i24.UserProfileDto) {
      return _i24.UserProfileDto.fromJson(data) as T;
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
    if (t == _i1.getType<_i8.IdDto?>()) {
      return (data != null ? _i8.IdDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.CreateGoalDto?>()) {
      return (data != null ? _i9.CreateGoalDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Goal?>()) {
      return (data != null ? _i10.Goal.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.JournalListDto?>()) {
      return (data != null ? _i11.JournalListDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.JournalLog?>()) {
      return (data != null ? _i12.JournalLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.RegistrationLog?>()) {
      return (data != null ? _i13.RegistrationLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.UserLocales?>()) {
      return (data != null ? _i14.UserLocales.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Notification?>()) {
      return (data != null ? _i15.Notification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.Benefit?>()) {
      return (data != null ? _i16.Benefit.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.PurchaseItem?>()) {
      return (data != null ? _i17.PurchaseItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Repetition?>()) {
      return (data != null ? _i18.Repetition.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.GoalStatistics?>()) {
      return (data != null ? _i19.GoalStatistics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.Statistics?>()) {
      return (data != null ? _i20.Statistics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.UserStatistics?>()) {
      return (data != null ? _i21.UserStatistics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.AppTheme?>()) {
      return (data != null ? _i22.AppTheme.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.User?>()) {
      return (data != null ? _i23.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.UserProfileDto?>()) {
      return (data != null ? _i24.UserProfileDto.fromJson(data) : null) as T;
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
    if (t == _i1.getType<List<_i12.JournalLog>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i12.JournalLog>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i12.JournalLog>) {
      return (data as List).map((e) => deserialize<_i12.JournalLog>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.RegistrationLog>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i13.RegistrationLog>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == Map<DateTime, double?>) {
      return Map.fromEntries((data as List).map((e) => MapEntry(
              deserialize<DateTime>(e['k']), deserialize<double?>(e['v']))))
          as dynamic;
    }
    if (t == Map<int, double>) {
      return Map.fromEntries((data as List).map((e) =>
              MapEntry(deserialize<int>(e['k']), deserialize<double>(e['v']))))
          as dynamic;
    }
    if (t == _i1.getType<List<_i10.Goal>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i10.Goal>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i17.PurchaseItem>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i17.PurchaseItem>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i25.Goal>) {
      return (data as List).map((e) => deserialize<_i25.Goal>(e)).toList()
          as dynamic;
    }
    if (t == List<_i26.Category>) {
      return (data as List).map((e) => deserialize<_i26.Category>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i25.Goal>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i25.Goal>(e)).toList()
          : null) as dynamic;
    }
    if (t == Map<String, String?>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<String?>(v))) as dynamic;
    }
    if (t == _i1.getType<List<_i27.JournalLog>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i27.JournalLog>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i28.PurchaseItem>) {
      return (data as List)
          .map((e) => deserialize<_i28.PurchaseItem>(e))
          .toList() as dynamic;
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
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
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
    if (data is _i8.IdDto) {
      return 'IdDto';
    }
    if (data is _i9.CreateGoalDto) {
      return 'CreateGoalDto';
    }
    if (data is _i10.Goal) {
      return 'Goal';
    }
    if (data is _i11.JournalListDto) {
      return 'JournalListDto';
    }
    if (data is _i12.JournalLog) {
      return 'JournalLog';
    }
    if (data is _i13.RegistrationLog) {
      return 'RegistrationLog';
    }
    if (data is _i14.UserLocales) {
      return 'UserLocales';
    }
    if (data is _i15.Notification) {
      return 'Notification';
    }
    if (data is _i16.Benefit) {
      return 'Benefit';
    }
    if (data is _i17.PurchaseItem) {
      return 'PurchaseItem';
    }
    if (data is _i18.Repetition) {
      return 'Repetition';
    }
    if (data is _i19.GoalStatistics) {
      return 'GoalStatistics';
    }
    if (data is _i20.Statistics) {
      return 'Statistics';
    }
    if (data is _i21.UserStatistics) {
      return 'UserStatistics';
    }
    if (data is _i22.AppTheme) {
      return 'AppTheme';
    }
    if (data is _i23.User) {
      return 'User';
    }
    if (data is _i24.UserProfileDto) {
      return 'UserProfileDto';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Category') {
      return deserialize<_i4.Category>(data['data']);
    }
    if (dataClassName == 'CreateCategoryDto') {
      return deserialize<_i5.CreateCategoryDto>(data['data']);
    }
    if (dataClassName == 'EndpointException') {
      return deserialize<_i6.EndpointException>(data['data']);
    }
    if (dataClassName == 'ErrorType') {
      return deserialize<_i7.ErrorType>(data['data']);
    }
    if (dataClassName == 'IdDto') {
      return deserialize<_i8.IdDto>(data['data']);
    }
    if (dataClassName == 'CreateGoalDto') {
      return deserialize<_i9.CreateGoalDto>(data['data']);
    }
    if (dataClassName == 'Goal') {
      return deserialize<_i10.Goal>(data['data']);
    }
    if (dataClassName == 'JournalListDto') {
      return deserialize<_i11.JournalListDto>(data['data']);
    }
    if (dataClassName == 'JournalLog') {
      return deserialize<_i12.JournalLog>(data['data']);
    }
    if (dataClassName == 'RegistrationLog') {
      return deserialize<_i13.RegistrationLog>(data['data']);
    }
    if (dataClassName == 'UserLocales') {
      return deserialize<_i14.UserLocales>(data['data']);
    }
    if (dataClassName == 'Notification') {
      return deserialize<_i15.Notification>(data['data']);
    }
    if (dataClassName == 'Benefit') {
      return deserialize<_i16.Benefit>(data['data']);
    }
    if (dataClassName == 'PurchaseItem') {
      return deserialize<_i17.PurchaseItem>(data['data']);
    }
    if (dataClassName == 'Repetition') {
      return deserialize<_i18.Repetition>(data['data']);
    }
    if (dataClassName == 'GoalStatistics') {
      return deserialize<_i19.GoalStatistics>(data['data']);
    }
    if (dataClassName == 'Statistics') {
      return deserialize<_i20.Statistics>(data['data']);
    }
    if (dataClassName == 'UserStatistics') {
      return deserialize<_i21.UserStatistics>(data['data']);
    }
    if (dataClassName == 'AppTheme') {
      return deserialize<_i22.AppTheme>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i23.User>(data['data']);
    }
    if (dataClassName == 'UserProfileDto') {
      return deserialize<_i24.UserProfileDto>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i3.Protocol().deserializeByClassName(data);
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
      case _i10.Goal:
        return _i10.Goal.t;
      case _i12.JournalLog:
        return _i12.JournalLog.t;
      case _i14.UserLocales:
        return _i14.UserLocales.t;
      case _i17.PurchaseItem:
        return _i17.PurchaseItem.t;
      case _i22.AppTheme:
        return _i22.AppTheme.t;
      case _i23.User:
        return _i23.User.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'fixie';
}
