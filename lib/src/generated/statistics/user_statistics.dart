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
import '../users/user.dart' as _i2;

abstract class UserStatistics
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  UserStatistics._({
    required this.user,
    required this.total,
    this.bestStreak,
    required this.loggedDays,
  });

  factory UserStatistics({
    required _i2.User user,
    required double total,
    int? bestStreak,
    required Map<DateTime, double?> loggedDays,
  }) = _UserStatisticsImpl;

  factory UserStatistics.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserStatistics(
      user: _i2.User.fromJson(
          (jsonSerialization['user'] as Map<String, dynamic>)),
      total: (jsonSerialization['total'] as num).toDouble(),
      bestStreak: jsonSerialization['bestStreak'] as int?,
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

  _i2.User user;

  double total;

  int? bestStreak;

  Map<DateTime, double?> loggedDays;

  /// Returns a shallow copy of this [UserStatistics]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserStatistics copyWith({
    _i2.User? user,
    double? total,
    int? bestStreak,
    Map<DateTime, double?>? loggedDays,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'total': total,
      if (bestStreak != null) 'bestStreak': bestStreak,
      'loggedDays': loggedDays.toJson(keyToJson: (k) => k.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'user': user.toJsonForProtocol(),
      'total': total,
      if (bestStreak != null) 'bestStreak': bestStreak,
      'loggedDays': loggedDays.toJson(keyToJson: (k) => k.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserStatisticsImpl extends UserStatistics {
  _UserStatisticsImpl({
    required _i2.User user,
    required double total,
    int? bestStreak,
    required Map<DateTime, double?> loggedDays,
  }) : super._(
          user: user,
          total: total,
          bestStreak: bestStreak,
          loggedDays: loggedDays,
        );

  /// Returns a shallow copy of this [UserStatistics]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserStatistics copyWith({
    _i2.User? user,
    double? total,
    Object? bestStreak = _Undefined,
    Map<DateTime, double?>? loggedDays,
  }) {
    return UserStatistics(
      user: user ?? this.user.copyWith(),
      total: total ?? this.total,
      bestStreak: bestStreak is int? ? bestStreak : this.bestStreak,
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
