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

abstract class CreateGoalDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CreateGoalDto._({
    required this.title,
    this.picture,
    required this.target,
    this.unit,
    this.category,
    this.days,
    this.end,
    required this.setRemind,
    this.remindHour,
    this.remindMinutes,
    this.remindHalf,
    this.remindTimezone,
  });

  factory CreateGoalDto({
    required String title,
    String? picture,
    required int target,
    String? unit,
    _i2.Category? category,
    List<_i2.RepeatableDays>? days,
    DateTime? end,
    required bool setRemind,
    int? remindHour,
    int? remindMinutes,
    bool? remindHalf,
    String? remindTimezone,
  }) = _CreateGoalDtoImpl;

  factory CreateGoalDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return CreateGoalDto(
      title: jsonSerialization['title'] as String,
      picture: jsonSerialization['picture'] as String?,
      target: jsonSerialization['target'] as int,
      unit: jsonSerialization['unit'] as String?,
      category: jsonSerialization['category'] == null
          ? null
          : _i2.Category.fromJson(
              (jsonSerialization['category'] as Map<String, dynamic>)),
      days: (jsonSerialization['days'] as List?)
          ?.map((e) => _i2.RepeatableDays.fromJson((e as Map<String, dynamic>)))
          .toList(),
      end: jsonSerialization['end'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['end']),
      setRemind: jsonSerialization['setRemind'] as bool,
      remindHour: jsonSerialization['remindHour'] as int?,
      remindMinutes: jsonSerialization['remindMinutes'] as int?,
      remindHalf: jsonSerialization['remindHalf'] as bool?,
      remindTimezone: jsonSerialization['remindTimezone'] as String?,
    );
  }

  String title;

  String? picture;

  int target;

  String? unit;

  _i2.Category? category;

  List<_i2.RepeatableDays>? days;

  DateTime? end;

  bool setRemind;

  int? remindHour;

  int? remindMinutes;

  bool? remindHalf;

  String? remindTimezone;

  CreateGoalDto copyWith({
    String? title,
    String? picture,
    int? target,
    String? unit,
    _i2.Category? category,
    List<_i2.RepeatableDays>? days,
    DateTime? end,
    bool? setRemind,
    int? remindHour,
    int? remindMinutes,
    bool? remindHalf,
    String? remindTimezone,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      if (picture != null) 'picture': picture,
      'target': target,
      if (unit != null) 'unit': unit,
      if (category != null) 'category': category?.toJson(),
      if (days != null) 'days': days?.toJson(valueToJson: (v) => v.toJson()),
      if (end != null) 'end': end?.toJson(),
      'setRemind': setRemind,
      if (remindHour != null) 'remindHour': remindHour,
      if (remindMinutes != null) 'remindMinutes': remindMinutes,
      if (remindHalf != null) 'remindHalf': remindHalf,
      if (remindTimezone != null) 'remindTimezone': remindTimezone,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'title': title,
      if (picture != null) 'picture': picture,
      'target': target,
      if (unit != null) 'unit': unit,
      if (category != null) 'category': category?.toJsonForProtocol(),
      if (days != null)
        'days': days?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (end != null) 'end': end?.toJson(),
      'setRemind': setRemind,
      if (remindHour != null) 'remindHour': remindHour,
      if (remindMinutes != null) 'remindMinutes': remindMinutes,
      if (remindHalf != null) 'remindHalf': remindHalf,
      if (remindTimezone != null) 'remindTimezone': remindTimezone,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CreateGoalDtoImpl extends CreateGoalDto {
  _CreateGoalDtoImpl({
    required String title,
    String? picture,
    required int target,
    String? unit,
    _i2.Category? category,
    List<_i2.RepeatableDays>? days,
    DateTime? end,
    required bool setRemind,
    int? remindHour,
    int? remindMinutes,
    bool? remindHalf,
    String? remindTimezone,
  }) : super._(
          title: title,
          picture: picture,
          target: target,
          unit: unit,
          category: category,
          days: days,
          end: end,
          setRemind: setRemind,
          remindHour: remindHour,
          remindMinutes: remindMinutes,
          remindHalf: remindHalf,
          remindTimezone: remindTimezone,
        );

  @override
  CreateGoalDto copyWith({
    String? title,
    Object? picture = _Undefined,
    int? target,
    Object? unit = _Undefined,
    Object? category = _Undefined,
    Object? days = _Undefined,
    Object? end = _Undefined,
    bool? setRemind,
    Object? remindHour = _Undefined,
    Object? remindMinutes = _Undefined,
    Object? remindHalf = _Undefined,
    Object? remindTimezone = _Undefined,
  }) {
    return CreateGoalDto(
      title: title ?? this.title,
      picture: picture is String? ? picture : this.picture,
      target: target ?? this.target,
      unit: unit is String? ? unit : this.unit,
      category:
          category is _i2.Category? ? category : this.category?.copyWith(),
      days: days is List<_i2.RepeatableDays>? ? days : this.days?.clone(),
      end: end is DateTime? ? end : this.end,
      setRemind: setRemind ?? this.setRemind,
      remindHour: remindHour is int? ? remindHour : this.remindHour,
      remindMinutes: remindMinutes is int? ? remindMinutes : this.remindMinutes,
      remindHalf: remindHalf is bool? ? remindHalf : this.remindHalf,
      remindTimezone:
          remindTimezone is String? ? remindTimezone : this.remindTimezone,
    );
  }
}
