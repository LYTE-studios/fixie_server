/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/categories_endpoint.dart' as _i2;
import '../endpoints/file_endpoint.dart' as _i3;
import '../endpoints/goals_endpoint.dart' as _i4;
import '../endpoints/journal_endpoint.dart' as _i5;
import '../endpoints/profile_endpoint.dart' as _i6;
import '../endpoints/statistics_endpoint.dart' as _i7;
import 'package:fixie_server/src/generated/category/create_category_dto.dart'
    as _i8;
import 'package:fixie_server/src/generated/goals/create_goal_dto.dart' as _i9;
import 'package:fixie_server/src/generated/shared/repeatable_days.dart' as _i10;
import 'package:fixie_server/src/generated/goals/goal.dart' as _i11;
import 'package:fixie_server/src/generated/journals/journal_log.dart' as _i12;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i13;
import 'package:fixie_server/src/generated/category/category.dart' as _i14;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'categories': _i2.CategoriesEndpoint()
        ..initialize(
          server,
          'categories',
          null,
        ),
      'file': _i3.FileEndpoint()
        ..initialize(
          server,
          'file',
          null,
        ),
      'goals': _i4.GoalsEndpoint()
        ..initialize(
          server,
          'goals',
          null,
        ),
      'journal': _i5.JournalEndpoint()
        ..initialize(
          server,
          'journal',
          null,
        ),
      'profile': _i6.ProfileEndpoint()
        ..initialize(
          server,
          'profile',
          null,
        ),
      'statistics': _i7.StatisticsEndpoint()
        ..initialize(
          server,
          'statistics',
          null,
        ),
    };
    connectors['categories'] = _i1.EndpointConnector(
      name: 'categories',
      endpoint: endpoints['categories']!,
      methodConnectors: {
        'addCategory': _i1.MethodConnector(
          name: 'addCategory',
          params: {
            'dto': _i1.ParameterDescription(
              name: 'dto',
              type: _i1.getType<_i8.CreateCategoryDto>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['categories'] as _i2.CategoriesEndpoint).addCategory(
            session,
            params['dto'],
          ),
        ),
        'getActiveCategories': _i1.MethodConnector(
          name: 'getActiveCategories',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['categories'] as _i2.CategoriesEndpoint)
                  .getActiveCategories(session),
        ),
      },
    );
    connectors['file'] = _i1.EndpointConnector(
      name: 'file',
      endpoint: endpoints['file']!,
      methodConnectors: {
        'getUploadDescription': _i1.MethodConnector(
          name: 'getUploadDescription',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['file'] as _i3.FileEndpoint).getUploadDescription(
            session,
            params['path'],
          ),
        ),
        'verifyUpload': _i1.MethodConnector(
          name: 'verifyUpload',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['file'] as _i3.FileEndpoint).verifyUpload(
            session,
            params['path'],
          ),
        ),
      },
    );
    connectors['goals'] = _i1.EndpointConnector(
      name: 'goals',
      endpoint: endpoints['goals']!,
      methodConnectors: {
        'addGoal': _i1.MethodConnector(
          name: 'addGoal',
          params: {
            'dto': _i1.ParameterDescription(
              name: 'dto',
              type: _i1.getType<_i9.CreateGoalDto>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['goals'] as _i4.GoalsEndpoint).addGoal(
            session,
            params['dto'],
          ),
        ),
        'addRepeatsForGoal': _i1.MethodConnector(
          name: 'addRepeatsForGoal',
          params: {
            'goalId': _i1.ParameterDescription(
              name: 'goalId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'days': _i1.ParameterDescription(
              name: 'days',
              type: _i1.getType<List<_i10.RepeatableDays>>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['goals'] as _i4.GoalsEndpoint).addRepeatsForGoal(
            session,
            goalId: params['goalId'],
            days: params['days'],
          ),
        ),
        'getGoal': _i1.MethodConnector(
          name: 'getGoal',
          params: {
            'goalId': _i1.ParameterDescription(
              name: 'goalId',
              type: _i1.getType<int?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['goals'] as _i4.GoalsEndpoint).getGoal(
            session,
            params['goalId'],
          ),
        ),
        'getGoals': _i1.MethodConnector(
          name: 'getGoals',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['goals'] as _i4.GoalsEndpoint).getGoals(session),
        ),
        'updateGoal': _i1.MethodConnector(
          name: 'updateGoal',
          params: {
            'newGoal': _i1.ParameterDescription(
              name: 'newGoal',
              type: _i1.getType<_i11.Goal>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['goals'] as _i4.GoalsEndpoint).updateGoal(
            session,
            params['newGoal'],
          ),
        ),
        'deleteGoal': _i1.MethodConnector(
          name: 'deleteGoal',
          params: {
            'goalId': _i1.ParameterDescription(
              name: 'goalId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['goals'] as _i4.GoalsEndpoint).deleteGoal(
            session,
            params['goalId'],
          ),
        ),
        'resetGoals': _i1.MethodConnector(
          name: 'resetGoals',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['goals'] as _i4.GoalsEndpoint).resetGoals(session),
        ),
      },
    );
    connectors['journal'] = _i1.EndpointConnector(
      name: 'journal',
      endpoint: endpoints['journal']!,
      methodConnectors: {
        'getImageUploadDescription': _i1.MethodConnector(
          name: 'getImageUploadDescription',
          params: {
            'log': _i1.ParameterDescription(
              name: 'log',
              type: _i1.getType<_i12.JournalLog>(),
              nullable: false,
            ),
            'fileName': _i1.ParameterDescription(
              name: 'fileName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['journal'] as _i5.JournalEndpoint)
                  .getImageUploadDescription(
            session,
            log: params['log'],
            fileName: params['fileName'],
          ),
        ),
        'verifyUpload': _i1.MethodConnector(
          name: 'verifyUpload',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['journal'] as _i5.JournalEndpoint).verifyUpload(
            session,
            params['path'],
          ),
        ),
        'getLogsForRange': _i1.MethodConnector(
          name: 'getLogsForRange',
          params: {
            'start': _i1.ParameterDescription(
              name: 'start',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'end': _i1.ParameterDescription(
              name: 'end',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['journal'] as _i5.JournalEndpoint).getLogsForRange(
            session,
            start: params['start'],
            end: params['end'],
          ),
        ),
        'addLog': _i1.MethodConnector(
          name: 'addLog',
          params: {
            'goalId': _i1.ParameterDescription(
              name: 'goalId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'log': _i1.ParameterDescription(
              name: 'log',
              type: _i1.getType<_i12.JournalLog>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['journal'] as _i5.JournalEndpoint).addLog(
            session,
            params['goalId'],
            params['log'],
          ),
        ),
        'getLog': _i1.MethodConnector(
          name: 'getLog',
          params: {
            'logId': _i1.ParameterDescription(
              name: 'logId',
              type: _i1.getType<int?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['journal'] as _i5.JournalEndpoint).getLog(
            session,
            params['logId'],
          ),
        ),
        'getJournal': _i1.MethodConnector(
          name: 'getJournal',
          params: {
            'goalId': _i1.ParameterDescription(
              name: 'goalId',
              type: _i1.getType<int?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['journal'] as _i5.JournalEndpoint).getJournal(
            session,
            params['goalId'],
          ),
        ),
        'updateLog': _i1.MethodConnector(
          name: 'updateLog',
          params: {
            'editedLog': _i1.ParameterDescription(
              name: 'editedLog',
              type: _i1.getType<_i12.JournalLog>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['journal'] as _i5.JournalEndpoint).updateLog(
            session,
            params['editedLog'],
          ),
        ),
      },
    );
    connectors['profile'] = _i1.EndpointConnector(
      name: 'profile',
      endpoint: endpoints['profile']!,
      methodConnectors: {
        'deleteAccount': _i1.MethodConnector(
          name: 'deleteAccount',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['profile'] as _i6.ProfileEndpoint)
                  .deleteAccount(session),
        ),
        'createUser': _i1.MethodConnector(
          name: 'createUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i13.UserInfo?>(),
              nullable: true,
            ),
            'birthday': _i1.ParameterDescription(
              name: 'birthday',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['profile'] as _i6.ProfileEndpoint).createUser(
            session,
            params['user'],
            params['birthday'],
          ),
        ),
        'getProfileData': _i1.MethodConnector(
          name: 'getProfileData',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['profile'] as _i6.ProfileEndpoint)
                  .getProfileData(session),
        ),
        'updateBirthday': _i1.MethodConnector(
          name: 'updateBirthday',
          params: {
            'birthday': _i1.ParameterDescription(
              name: 'birthday',
              type: _i1.getType<DateTime>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['profile'] as _i6.ProfileEndpoint).updateBirthday(
            session,
            params['birthday'],
          ),
        ),
        'updateName': _i1.MethodConnector(
          name: 'updateName',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['profile'] as _i6.ProfileEndpoint).updateName(
            session,
            params['name'],
          ),
        ),
      },
    );
    connectors['statistics'] = _i1.EndpointConnector(
      name: 'statistics',
      endpoint: endpoints['statistics']!,
      methodConnectors: {
        'getStatisticsForCategory': _i1.MethodConnector(
          name: 'getStatisticsForCategory',
          params: {
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<_i14.Category>(),
              nullable: false,
            ),
            'start': _i1.ParameterDescription(
              name: 'start',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'end': _i1.ParameterDescription(
              name: 'end',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['statistics'] as _i7.StatisticsEndpoint)
                  .getStatisticsForCategory(
            session,
            params['category'],
            params['start'],
            params['end'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i13.Endpoints()..initializeEndpoints(server);
  }
}
