/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/file_endpoint.dart' as _i2;
import '../endpoints/goals_endpoint.dart' as _i3;
import '../endpoints/profile_endpoint.dart' as _i4;
import 'package:fixie_server/src/generated/goal.dart' as _i5;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i6;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'file': _i2.FileEndpoint()
        ..initialize(
          server,
          'file',
          null,
        ),
      'goals': _i3.GoalsEndpoint()
        ..initialize(
          server,
          'goals',
          null,
        ),
      'profile': _i4.ProfileEndpoint()
        ..initialize(
          server,
          'profile',
          null,
        ),
    };
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
              (endpoints['file'] as _i2.FileEndpoint).getUploadDescription(
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
              (endpoints['file'] as _i2.FileEndpoint).verifyUpload(
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
            'goal': _i1.ParameterDescription(
              name: 'goal',
              type: _i1.getType<_i5.Goal>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['goals'] as _i3.GoalsEndpoint).addGoal(
            session,
            params['goal'],
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
              (endpoints['goals'] as _i3.GoalsEndpoint).getGoal(
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
              (endpoints['goals'] as _i3.GoalsEndpoint).getGoals(session),
        ),
        'updateGoal': _i1.MethodConnector(
          name: 'updateGoal',
          params: {
            'newGoal': _i1.ParameterDescription(
              name: 'newGoal',
              type: _i1.getType<_i5.Goal>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['goals'] as _i3.GoalsEndpoint).updateGoal(
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
              (endpoints['goals'] as _i3.GoalsEndpoint).deleteGoal(
            session,
            params['goalId'],
          ),
        ),
      },
    );
    connectors['profile'] = _i1.EndpointConnector(
      name: 'profile',
      endpoint: endpoints['profile']!,
      methodConnectors: {
        'createUser': _i1.MethodConnector(
          name: 'createUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i6.UserInfo?>(),
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
              (endpoints['profile'] as _i4.ProfileEndpoint).createUser(
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
              (endpoints['profile'] as _i4.ProfileEndpoint)
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
              (endpoints['profile'] as _i4.ProfileEndpoint).updateBirthday(
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
              (endpoints['profile'] as _i4.ProfileEndpoint).updateName(
            session,
            params['name'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i6.Endpoints()..initializeEndpoints(server);
  }
}
