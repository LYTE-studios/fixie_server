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

abstract class Statistics
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  Statistics._({
    required this.monthlySuccessRate,
    required this.monthlySuccessRateTrend,
    required this.yearlySuccessRate,
    required this.yearlySuccessRateTrend,
    required this.yearlyGoalsCompleted,
    required this.monthlyGoalsCompleted,
    required this.monthlyGoalsCompletedTrend,
    required this.bestStreak,
    required this.bestCurrentStreak,
    this.monthlyUnitValue,
    this.yearlyUnitValue,
    required this.monthChartData,
  });

  factory Statistics({
    required double monthlySuccessRate,
    required double monthlySuccessRateTrend,
    required double yearlySuccessRate,
    required double yearlySuccessRateTrend,
    required int yearlyGoalsCompleted,
    required int monthlyGoalsCompleted,
    required int monthlyGoalsCompletedTrend,
    required int bestStreak,
    required int bestCurrentStreak,
    double? monthlyUnitValue,
    double? yearlyUnitValue,
    required Map<int, double> monthChartData,
  }) = _StatisticsImpl;

  factory Statistics.fromJson(Map<String, dynamic> jsonSerialization) {
    return Statistics(
      monthlySuccessRate:
          (jsonSerialization['monthlySuccessRate'] as num).toDouble(),
      monthlySuccessRateTrend:
          (jsonSerialization['monthlySuccessRateTrend'] as num).toDouble(),
      yearlySuccessRate:
          (jsonSerialization['yearlySuccessRate'] as num).toDouble(),
      yearlySuccessRateTrend:
          (jsonSerialization['yearlySuccessRateTrend'] as num).toDouble(),
      yearlyGoalsCompleted: jsonSerialization['yearlyGoalsCompleted'] as int,
      monthlyGoalsCompleted: jsonSerialization['monthlyGoalsCompleted'] as int,
      monthlyGoalsCompletedTrend:
          jsonSerialization['monthlyGoalsCompletedTrend'] as int,
      bestStreak: jsonSerialization['bestStreak'] as int,
      bestCurrentStreak: jsonSerialization['bestCurrentStreak'] as int,
      monthlyUnitValue:
          (jsonSerialization['monthlyUnitValue'] as num?)?.toDouble(),
      yearlyUnitValue:
          (jsonSerialization['yearlyUnitValue'] as num?)?.toDouble(),
      monthChartData: (jsonSerialization['monthChartData'] as List)
          .fold<Map<int, double>>(
              {}, (t, e) => {...t, e['k'] as int: (e['v'] as num).toDouble()}),
    );
  }

  double monthlySuccessRate;

  double monthlySuccessRateTrend;

  double yearlySuccessRate;

  double yearlySuccessRateTrend;

  int yearlyGoalsCompleted;

  int monthlyGoalsCompleted;

  int monthlyGoalsCompletedTrend;

  int bestStreak;

  int bestCurrentStreak;

  double? monthlyUnitValue;

  double? yearlyUnitValue;

  Map<int, double> monthChartData;

  /// Returns a shallow copy of this [Statistics]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Statistics copyWith({
    double? monthlySuccessRate,
    double? monthlySuccessRateTrend,
    double? yearlySuccessRate,
    double? yearlySuccessRateTrend,
    int? yearlyGoalsCompleted,
    int? monthlyGoalsCompleted,
    int? monthlyGoalsCompletedTrend,
    int? bestStreak,
    int? bestCurrentStreak,
    double? monthlyUnitValue,
    double? yearlyUnitValue,
    Map<int, double>? monthChartData,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'monthlySuccessRate': monthlySuccessRate,
      'monthlySuccessRateTrend': monthlySuccessRateTrend,
      'yearlySuccessRate': yearlySuccessRate,
      'yearlySuccessRateTrend': yearlySuccessRateTrend,
      'yearlyGoalsCompleted': yearlyGoalsCompleted,
      'monthlyGoalsCompleted': monthlyGoalsCompleted,
      'monthlyGoalsCompletedTrend': monthlyGoalsCompletedTrend,
      'bestStreak': bestStreak,
      'bestCurrentStreak': bestCurrentStreak,
      if (monthlyUnitValue != null) 'monthlyUnitValue': monthlyUnitValue,
      if (yearlyUnitValue != null) 'yearlyUnitValue': yearlyUnitValue,
      'monthChartData': monthChartData.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'monthlySuccessRate': monthlySuccessRate,
      'monthlySuccessRateTrend': monthlySuccessRateTrend,
      'yearlySuccessRate': yearlySuccessRate,
      'yearlySuccessRateTrend': yearlySuccessRateTrend,
      'yearlyGoalsCompleted': yearlyGoalsCompleted,
      'monthlyGoalsCompleted': monthlyGoalsCompleted,
      'monthlyGoalsCompletedTrend': monthlyGoalsCompletedTrend,
      'bestStreak': bestStreak,
      'bestCurrentStreak': bestCurrentStreak,
      if (monthlyUnitValue != null) 'monthlyUnitValue': monthlyUnitValue,
      if (yearlyUnitValue != null) 'yearlyUnitValue': yearlyUnitValue,
      'monthChartData': monthChartData.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StatisticsImpl extends Statistics {
  _StatisticsImpl({
    required double monthlySuccessRate,
    required double monthlySuccessRateTrend,
    required double yearlySuccessRate,
    required double yearlySuccessRateTrend,
    required int yearlyGoalsCompleted,
    required int monthlyGoalsCompleted,
    required int monthlyGoalsCompletedTrend,
    required int bestStreak,
    required int bestCurrentStreak,
    double? monthlyUnitValue,
    double? yearlyUnitValue,
    required Map<int, double> monthChartData,
  }) : super._(
          monthlySuccessRate: monthlySuccessRate,
          monthlySuccessRateTrend: monthlySuccessRateTrend,
          yearlySuccessRate: yearlySuccessRate,
          yearlySuccessRateTrend: yearlySuccessRateTrend,
          yearlyGoalsCompleted: yearlyGoalsCompleted,
          monthlyGoalsCompleted: monthlyGoalsCompleted,
          monthlyGoalsCompletedTrend: monthlyGoalsCompletedTrend,
          bestStreak: bestStreak,
          bestCurrentStreak: bestCurrentStreak,
          monthlyUnitValue: monthlyUnitValue,
          yearlyUnitValue: yearlyUnitValue,
          monthChartData: monthChartData,
        );

  /// Returns a shallow copy of this [Statistics]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Statistics copyWith({
    double? monthlySuccessRate,
    double? monthlySuccessRateTrend,
    double? yearlySuccessRate,
    double? yearlySuccessRateTrend,
    int? yearlyGoalsCompleted,
    int? monthlyGoalsCompleted,
    int? monthlyGoalsCompletedTrend,
    int? bestStreak,
    int? bestCurrentStreak,
    Object? monthlyUnitValue = _Undefined,
    Object? yearlyUnitValue = _Undefined,
    Map<int, double>? monthChartData,
  }) {
    return Statistics(
      monthlySuccessRate: monthlySuccessRate ?? this.monthlySuccessRate,
      monthlySuccessRateTrend:
          monthlySuccessRateTrend ?? this.monthlySuccessRateTrend,
      yearlySuccessRate: yearlySuccessRate ?? this.yearlySuccessRate,
      yearlySuccessRateTrend:
          yearlySuccessRateTrend ?? this.yearlySuccessRateTrend,
      yearlyGoalsCompleted: yearlyGoalsCompleted ?? this.yearlyGoalsCompleted,
      monthlyGoalsCompleted:
          monthlyGoalsCompleted ?? this.monthlyGoalsCompleted,
      monthlyGoalsCompletedTrend:
          monthlyGoalsCompletedTrend ?? this.monthlyGoalsCompletedTrend,
      bestStreak: bestStreak ?? this.bestStreak,
      bestCurrentStreak: bestCurrentStreak ?? this.bestCurrentStreak,
      monthlyUnitValue: monthlyUnitValue is double?
          ? monthlyUnitValue
          : this.monthlyUnitValue,
      yearlyUnitValue:
          yearlyUnitValue is double? ? yearlyUnitValue : this.yearlyUnitValue,
      monthChartData: monthChartData ??
          this.monthChartData.map((
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
