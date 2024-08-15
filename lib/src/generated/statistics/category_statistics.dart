/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class CategoryStatistics
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CategoryStatistics._({
    required this.category,
    this.bestStreak,
    required this.successRate,
    required this.currentSuccessRate,
    required this.chartData,
  });

  factory CategoryStatistics({
    required _i2.Category category,
    int? bestStreak,
    required double successRate,
    required double currentSuccessRate,
    required List<int> chartData,
  }) = _CategoryStatisticsImpl;

  factory CategoryStatistics.fromJson(Map<String, dynamic> jsonSerialization) {
    return CategoryStatistics(
      category: _i2.Category.fromJson(
          (jsonSerialization['category'] as Map<String, dynamic>)),
      bestStreak: jsonSerialization['bestStreak'] as int?,
      successRate: (jsonSerialization['successRate'] as num).toDouble(),
      currentSuccessRate:
          (jsonSerialization['currentSuccessRate'] as num).toDouble(),
      chartData: (jsonSerialization['chartData'] as List)
          .map((e) => e as int)
          .toList(),
    );
  }

  _i2.Category category;

  int? bestStreak;

  double successRate;

  double currentSuccessRate;

  List<int> chartData;

  CategoryStatistics copyWith({
    _i2.Category? category,
    int? bestStreak,
    double? successRate,
    double? currentSuccessRate,
    List<int>? chartData,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'category': category.toJson(),
      if (bestStreak != null) 'bestStreak': bestStreak,
      'successRate': successRate,
      'currentSuccessRate': currentSuccessRate,
      'chartData': chartData.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'category': category.toJsonForProtocol(),
      if (bestStreak != null) 'bestStreak': bestStreak,
      'successRate': successRate,
      'currentSuccessRate': currentSuccessRate,
      'chartData': chartData.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CategoryStatisticsImpl extends CategoryStatistics {
  _CategoryStatisticsImpl({
    required _i2.Category category,
    int? bestStreak,
    required double successRate,
    required double currentSuccessRate,
    required List<int> chartData,
  }) : super._(
          category: category,
          bestStreak: bestStreak,
          successRate: successRate,
          currentSuccessRate: currentSuccessRate,
          chartData: chartData,
        );

  @override
  CategoryStatistics copyWith({
    _i2.Category? category,
    Object? bestStreak = _Undefined,
    double? successRate,
    double? currentSuccessRate,
    List<int>? chartData,
  }) {
    return CategoryStatistics(
      category: category ?? this.category.copyWith(),
      bestStreak: bestStreak is int? ? bestStreak : this.bestStreak,
      successRate: successRate ?? this.successRate,
      currentSuccessRate: currentSuccessRate ?? this.currentSuccessRate,
      chartData: chartData ?? this.chartData.clone(),
    );
  }
}
