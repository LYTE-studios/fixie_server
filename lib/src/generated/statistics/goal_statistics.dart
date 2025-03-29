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
import '../goals/goal.dart' as _i2;

abstract class GoalStatistics
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  GoalStatistics._({
    required this.goal,
    required this.total,
    required this.loggedDays,
  });

  factory GoalStatistics({
    required _i2.Goal goal,
    required double total,
    required Map<DateTime, double?> loggedDays,
  }) = _GoalStatisticsImpl;

  factory GoalStatistics.fromJson(Map<String, dynamic> jsonSerialization) {
    return GoalStatistics(
      goal: _i2.Goal.fromJson(
          (jsonSerialization['goal'] as Map<String, dynamic>)),
      total: (jsonSerialization['total'] as num).toDouble(),
      loggedDays: (jsonSerialization['loggedDays'] as List)
          .fold<Map<DateTime, double?>>(
              {},
              (t, e) => {
                    ...t,
                    _i1.DateTimeJsonExtension.fromJson(e['k']):
                        (e['v'] as num?)?.toDouble()
                  }),
    );
  }

  _i2.Goal goal;

  double total;

  Map<DateTime, double?> loggedDays;

  /// Returns a shallow copy of this [GoalStatistics]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GoalStatistics copyWith({
    _i2.Goal? goal,
    double? total,
    Map<DateTime, double?>? loggedDays,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'goal': goal.toJson(),
      'total': total,
      'loggedDays': loggedDays.toJson(keyToJson: (k) => k.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'goal': goal.toJsonForProtocol(),
      'total': total,
      'loggedDays': loggedDays.toJson(keyToJson: (k) => k.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _GoalStatisticsImpl extends GoalStatistics {
  _GoalStatisticsImpl({
    required _i2.Goal goal,
    required double total,
    required Map<DateTime, double?> loggedDays,
  }) : super._(
          goal: goal,
          total: total,
          loggedDays: loggedDays,
        );

  /// Returns a shallow copy of this [GoalStatistics]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GoalStatistics copyWith({
    _i2.Goal? goal,
    double? total,
    Map<DateTime, double?>? loggedDays,
  }) {
    return GoalStatistics(
      goal: goal ?? this.goal.copyWith(),
      total: total ?? this.total,
      loggedDays: loggedDays ??
          this.loggedDays.map((
                key0,
                value0,
              ) =>
                  MapEntry(
                    key0,
                    value0,
                  )),
    );
  }
}
