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
import '../endpoints/categories_endpoint.dart' as _i2;
import '../endpoints/file_endpoint.dart' as _i3;
import '../endpoints/goals_endpoint.dart' as _i4;
import '../endpoints/journal_endpoint.dart' as _i5;
import '../endpoints/notification_endpoint.dart' as _i6;
import '../endpoints/payments_endpoint.dart' as _i7;
import '../endpoints/profile_endpoint.dart' as _i8;
import '../endpoints/statistics_endpoint.dart' as _i9;
import '../endpoints/theme_endpoint.dart' as _i10;
import 'package:fixie_server/src/generated/category/create_category_dto.dart'
    as _i11;
import 'package:fixie_server/src/generated/category/category.dart' as _i12;
import 'package:fixie_server/src/generated/goals/create_goal_dto.dart' as _i13;
import 'package:fixie_server/src/generated/journals/journal_log.dart' as _i14;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i15;
import 'package:fixie_server/src/generated/users/archetype.dart' as _i16;
import 'package:fixie_server/src/generated/goals/goal.dart' as _i17;

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
      'notification': _i6.NotificationEndpoint()
        ..initialize(
          server,
          'notification',
          null,
        ),
      'payments': _i7.PaymentsEndpoint()
        ..initialize(
          server,
          'payments',
          null,
        ),
      'profile': _i8.ProfileEndpoint()
        ..initialize(
          server,
          'profile',
          null,
        ),
      'statistics': _i9.StatisticsEndpoint()
        ..initialize(
          server,
          'statistics',
          null,
        ),
      'theme': _i10.ThemeEndpoint()
        ..initialize(
          server,
          'theme',
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
              type: _i1.getType<_i11.CreateCategoryDto>(),
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
        'editCategory': _i1.MethodConnector(
          name: 'editCategory',
          params: {
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<_i12.Category>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['categories'] as _i2.CategoriesEndpoint).editCategory(
            session,
            params['category'],
          ),
        ),
        'getGoalsForCategory': _i1.MethodConnector(
          name: 'getGoalsForCategory',
          params: {
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['categories'] as _i2.CategoriesEndpoint)
                  .getGoalsForCategory(
            session,
            params['categoryId'],
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
              type: _i1.getType<_i13.CreateGoalDto>(),
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
            'goalId': _i1.ParameterDescription(
              name: 'goalId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'newGoal': _i1.ParameterDescription(
              name: 'newGoal',
              type: _i1.getType<_i13.CreateGoalDto>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['goals'] as _i4.GoalsEndpoint).updateGoal(
            session,
            params['goalId'],
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
        'permanentlyDeleteAllGoals': _i1.MethodConnector(
          name: 'permanentlyDeleteAllGoals',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['goals'] as _i4.GoalsEndpoint)
                  .permanentlyDeleteAllGoals(session),
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
              type: _i1.getType<_i14.JournalLog>(),
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
              type: _i1.getType<_i14.JournalLog>(),
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
            ),
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'pageSize': _i1.ParameterDescription(
              name: 'pageSize',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['journal'] as _i5.JournalEndpoint).getJournal(
            session,
            params['goalId'],
            categoryId: params['categoryId'],
            pageSize: params['pageSize'],
            offset: params['offset'],
          ),
        ),
        'updateLog': _i1.MethodConnector(
          name: 'updateLog',
          params: {
            'editedLog': _i1.ParameterDescription(
              name: 'editedLog',
              type: _i1.getType<_i14.JournalLog>(),
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
    connectors['notification'] = _i1.EndpointConnector(
      name: 'notification',
      endpoint: endpoints['notification']!,
      methodConnectors: {
        'setFcmToken': _i1.MethodConnector(
          name: 'setFcmToken',
          params: {
            'token': _i1.ParameterDescription(
              name: 'token',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notification'] as _i6.NotificationEndpoint)
                  .setFcmToken(
            session,
            token: params['token'],
          ),
        )
      },
    );
    connectors['payments'] = _i1.EndpointConnector(
      name: 'payments',
      endpoint: endpoints['payments']!,
      methodConnectors: {
        'canStartTrial': _i1.MethodConnector(
          name: 'canStartTrial',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['payments'] as _i7.PaymentsEndpoint)
                  .canStartTrial(session),
        ),
        'startTrial': _i1.MethodConnector(
          name: 'startTrial',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['payments'] as _i7.PaymentsEndpoint)
                  .startTrial(session),
        ),
        'fetchActivePurchases': _i1.MethodConnector(
          name: 'fetchActivePurchases',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['payments'] as _i7.PaymentsEndpoint)
                  .fetchActivePurchases(session),
        ),
      },
    );
    connectors['profile'] = _i1.EndpointConnector(
      name: 'profile',
      endpoint: endpoints['profile']!,
      methodConnectors: {
        'updatePrivacySettings': _i1.MethodConnector(
          name: 'updatePrivacySettings',
          params: {
            'informationCollection': _i1.ParameterDescription(
              name: 'informationCollection',
              type: _i1.getType<bool?>(),
              nullable: true,
            ),
            'automaticReminders': _i1.ParameterDescription(
              name: 'automaticReminders',
              type: _i1.getType<bool?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['profile'] as _i8.ProfileEndpoint)
                  .updatePrivacySettings(
            session,
            informationCollection: params['informationCollection'],
            automaticReminders: params['automaticReminders'],
          ),
        ),
        'deleteAccount': _i1.MethodConnector(
          name: 'deleteAccount',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['profile'] as _i8.ProfileEndpoint)
                  .deleteAccount(session),
        ),
        'createUser': _i1.MethodConnector(
          name: 'createUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i15.UserInfo?>(),
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
              (endpoints['profile'] as _i8.ProfileEndpoint).createUser(
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
              (endpoints['profile'] as _i8.ProfileEndpoint)
                  .getProfileData(session),
        ),
        'setUserArchetype': _i1.MethodConnector(
          name: 'setUserArchetype',
          params: {
            'archetype': _i1.ParameterDescription(
              name: 'archetype',
              type: _i1.getType<_i16.Archetype>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['profile'] as _i8.ProfileEndpoint).setUserArchetype(
            session,
            params['archetype'],
          ),
        ),
        'setEmptyLocale': _i1.MethodConnector(
          name: 'setEmptyLocale',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'locale': _i1.ParameterDescription(
              name: 'locale',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['profile'] as _i8.ProfileEndpoint).setEmptyLocale(
            session,
            params['email'],
            params['locale'],
          ),
        ),
        'updateLocale': _i1.MethodConnector(
          name: 'updateLocale',
          params: {
            'locale': _i1.ParameterDescription(
              name: 'locale',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['profile'] as _i8.ProfileEndpoint).updateLocale(
            session,
            params['locale'],
          ),
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
              (endpoints['profile'] as _i8.ProfileEndpoint).updateBirthday(
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
              (endpoints['profile'] as _i8.ProfileEndpoint).updateName(
            session,
            params['name'],
          ),
        ),
        'completeOnboarding': _i1.MethodConnector(
          name: 'completeOnboarding',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['profile'] as _i8.ProfileEndpoint)
                  .completeOnboarding(session),
        ),
        'completeGoalTutorial': _i1.MethodConnector(
          name: 'completeGoalTutorial',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['profile'] as _i8.ProfileEndpoint)
                  .completeGoalTutorial(session),
        ),
        'getImageUploadDescription': _i1.MethodConnector(
          name: 'getImageUploadDescription',
          params: {
            'fileName': _i1.ParameterDescription(
              name: 'fileName',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['profile'] as _i8.ProfileEndpoint)
                  .getImageUploadDescription(
            session,
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
              (endpoints['profile'] as _i8.ProfileEndpoint).verifyUpload(
            session,
            params['path'],
          ),
        ),
        'updateProfilePicture': _i1.MethodConnector(
          name: 'updateProfilePicture',
          params: {
            'url': _i1.ParameterDescription(
              name: 'url',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['profile'] as _i8.ProfileEndpoint)
                  .updateProfilePicture(
            session,
            params['url'],
          ),
        ),
      },
    );
    connectors['statistics'] = _i1.EndpointConnector(
      name: 'statistics',
      endpoint: endpoints['statistics']!,
      methodConnectors: {
        'getStatisticsForGoal': _i1.MethodConnector(
          name: 'getStatisticsForGoal',
          params: {
            'goal': _i1.ParameterDescription(
              name: 'goal',
              type: _i1.getType<_i17.Goal>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['statistics'] as _i9.StatisticsEndpoint)
                  .getStatisticsForGoal(
            session,
            params['goal'],
          ),
        ),
        'getMonthlyJournalStatistics': _i1.MethodConnector(
          name: 'getMonthlyJournalStatistics',
          params: {
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<_i12.Category?>(),
              nullable: true,
            ),
            'goal': _i1.ParameterDescription(
              name: 'goal',
              type: _i1.getType<_i17.Goal?>(),
              nullable: true,
            ),
            'month': _i1.ParameterDescription(
              name: 'month',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['statistics'] as _i9.StatisticsEndpoint)
                  .getMonthlyJournalStatistics(
            session,
            params['category'],
            params['goal'],
            params['month'],
          ),
        ),
      },
    );
    connectors['theme'] = _i1.EndpointConnector(
      name: 'theme',
      endpoint: endpoints['theme']!,
      methodConnectors: {
        'updatePrivacySettings': _i1.MethodConnector(
          name: 'updatePrivacySettings',
          params: {
            'informationCollection': _i1.ParameterDescription(
              name: 'informationCollection',
              type: _i1.getType<bool?>(),
              nullable: true,
            ),
            'automaticReminders': _i1.ParameterDescription(
              name: 'automaticReminders',
              type: _i1.getType<bool?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['theme'] as _i10.ThemeEndpoint).updatePrivacySettings(
            session,
            informationCollection: params['informationCollection'],
            automaticReminders: params['automaticReminders'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i15.Endpoints()..initializeEndpoints(server);
  }
}
