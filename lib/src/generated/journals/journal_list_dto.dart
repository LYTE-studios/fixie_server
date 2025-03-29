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
import '../journals/journal_log.dart' as _i2;

abstract class JournalListDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  JournalListDto._({
    required this.daily,
    required this.weekly,
    required this.monthly,
    required this.yearly,
  });

  factory JournalListDto({
    required List<_i2.JournalLog> daily,
    required List<_i2.JournalLog> weekly,
    required List<_i2.JournalLog> monthly,
    required List<_i2.JournalLog> yearly,
  }) = _JournalListDtoImpl;

  factory JournalListDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return JournalListDto(
      daily: (jsonSerialization['daily'] as List)
          .map((e) => _i2.JournalLog.fromJson((e as Map<String, dynamic>)))
          .toList(),
      weekly: (jsonSerialization['weekly'] as List)
          .map((e) => _i2.JournalLog.fromJson((e as Map<String, dynamic>)))
          .toList(),
      monthly: (jsonSerialization['monthly'] as List)
          .map((e) => _i2.JournalLog.fromJson((e as Map<String, dynamic>)))
          .toList(),
      yearly: (jsonSerialization['yearly'] as List)
          .map((e) => _i2.JournalLog.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  List<_i2.JournalLog> daily;

  List<_i2.JournalLog> weekly;

  List<_i2.JournalLog> monthly;

  List<_i2.JournalLog> yearly;

  /// Returns a shallow copy of this [JournalListDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  JournalListDto copyWith({
    List<_i2.JournalLog>? daily,
    List<_i2.JournalLog>? weekly,
    List<_i2.JournalLog>? monthly,
    List<_i2.JournalLog>? yearly,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'daily': daily.toJson(valueToJson: (v) => v.toJson()),
      'weekly': weekly.toJson(valueToJson: (v) => v.toJson()),
      'monthly': monthly.toJson(valueToJson: (v) => v.toJson()),
      'yearly': yearly.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'daily': daily.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'weekly': weekly.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'monthly': monthly.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'yearly': yearly.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _JournalListDtoImpl extends JournalListDto {
  _JournalListDtoImpl({
    required List<_i2.JournalLog> daily,
    required List<_i2.JournalLog> weekly,
    required List<_i2.JournalLog> monthly,
    required List<_i2.JournalLog> yearly,
  }) : super._(
          daily: daily,
          weekly: weekly,
          monthly: monthly,
          yearly: yearly,
        );

  /// Returns a shallow copy of this [JournalListDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  JournalListDto copyWith({
    List<_i2.JournalLog>? daily,
    List<_i2.JournalLog>? weekly,
    List<_i2.JournalLog>? monthly,
    List<_i2.JournalLog>? yearly,
  }) {
    return JournalListDto(
      daily: daily ?? this.daily.map((e0) => e0.copyWith()).toList(),
      weekly: weekly ?? this.weekly.map((e0) => e0.copyWith()).toList(),
      monthly: monthly ?? this.monthly.map((e0) => e0.copyWith()).toList(),
      yearly: yearly ?? this.yearly.map((e0) => e0.copyWith()).toList(),
    );
  }
}
