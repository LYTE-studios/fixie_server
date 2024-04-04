/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/example_endpoint.dart' as _i2;
import '../endpoints/goals_endpoint.dart' as _i3;
import '../endpoints/profile_endpoint.dart' as _i4;
import 'package:fixie_server/src/generated/goal.dart' as _i5;
import 'package:serverpod_auth_server/module.dart' as _i6;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'example': _i2.ExampleEndpoint()
        ..initialize(
          server,
          'example',
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
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
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
              (endpoints['example'] as _i2.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
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
        'editGoal': _i1.MethodConnector(
          name: 'editGoal',
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
              (endpoints['goals'] as _i3.GoalsEndpoint).editGoal(
            session,
            params['goal'],
          ),
        ),
      },
    );
    connectors['profile'] = _i1.EndpointConnector(
      name: 'profile',
      endpoint: endpoints['profile']!,
      methodConnectors: {
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
