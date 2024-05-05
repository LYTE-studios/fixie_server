// import 'dart:typed_data';

// import 'package:fixie_server/src/generated/endpoints.dart';
// import 'package:fixie_server/src/generated/protocol.dart';
// import 'package:serverpod/serverpod.dart';
// import 'package:test/test.dart';

// void main() {
//   group(' Goal Endpoints tests', () async {
//     final args = <String>[];
//     final serializationManager = Protocol();
//     final endpoints = Endpoints();
//     final serverpod = Serverpod(
//       args,
//       serializationManager,
//       endpoints,
//     );
//     await serverpod.start();
//     final session = await serverpod.createSession();
//     var client = Client(session);

//     test('addGoal', () async {
//       Goal goal = Goal(
//           title: 'Goal',
//           target: 3,
//           targetPeriod: TargetPeriod.day,
//           category: Category.Learning,
//           repetition: Repetition.Daily);
//       expect(
//     });

//     await session.close();
//     await serverpod.shutdown(exitProcess: false);
//   });
// }
