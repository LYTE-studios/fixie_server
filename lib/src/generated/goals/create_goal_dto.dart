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
import '../category/category.dart' as _i2;
import '../shared/repetition.dart' as _i3;

abstract class CreateGoalDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CreateGoalDto._({
    required this.title,
    this.picture,
    required this.target,
    this.unit,
    this.category,
    this.repetition,
    this.repeatEvery,
    this.weekdays,
    this.end,
    this.reminders,
  });

  factory CreateGoalDto({
    required String title,
    String? picture,
    required int target,
    String? unit,
    _i2.Category? category,
    _i3.Repetition? repetition,
    int? repeatEvery,
    List<int>? weekdays,
    DateTime? end,
    List<DateTime>? reminders,
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
      repetition: jsonSerialization['repetition'] == null
          ? null
          : _i3.Repetition.fromJson((jsonSerialization['repetition'] as int)),
      repeatEvery: jsonSerialization['repeatEvery'] as int?,
      weekdays: (jsonSerialization['weekdays'] as List?)
          ?.map((e) => e as int)
          .toList(),
      end: jsonSerialization['end'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['end']),
      reminders: (jsonSerialization['reminders'] as List?)
          ?.map((e) => _i1.DateTimeJsonExtension.fromJson(e))
          .toList(),
    );
  }

  String title;

  String? picture;

  int target;

  String? unit;

  _i2.Category? category;

  _i3.Repetition? repetition;

  int? repeatEvery;

  List<int>? weekdays;

  DateTime? end;

  List<DateTime>? reminders;

  CreateGoalDto copyWith({
    String? title,
    String? picture,
    int? target,
    String? unit,
    _i2.Category? category,
    _i3.Repetition? repetition,
    int? repeatEvery,
    List<int>? weekdays,
    DateTime? end,
    List<DateTime>? reminders,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      if (picture != null) 'picture': picture,
      'target': target,
      if (unit != null) 'unit': unit,
      if (category != null) 'category': category?.toJson(),
      if (repetition != null) 'repetition': repetition?.toJson(),
      if (repeatEvery != null) 'repeatEvery': repeatEvery,
      if (weekdays != null) 'weekdays': weekdays?.toJson(),
      if (end != null) 'end': end?.toJson(),
      if (reminders != null)
        'reminders': reminders?.toJson(valueToJson: (v) => v.toJson()),
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
      if (repetition != null) 'repetition': repetition?.toJson(),
      if (repeatEvery != null) 'repeatEvery': repeatEvery,
      if (weekdays != null) 'weekdays': weekdays?.toJson(),
      if (end != null) 'end': end?.toJson(),
      if (reminders != null)
        'reminders': reminders?.toJson(valueToJson: (v) => v.toJson()),
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
    _i3.Repetition? repetition,
    int? repeatEvery,
    List<int>? weekdays,
    DateTime? end,
    List<DateTime>? reminders,
  }) : super._(
          title: title,
          picture: picture,
          target: target,
          unit: unit,
          category: category,
          repetition: repetition,
          repeatEvery: repeatEvery,
          weekdays: weekdays,
          end: end,
          reminders: reminders,
        );

  @override
  CreateGoalDto copyWith({
    String? title,
    Object? picture = _Undefined,
    int? target,
    Object? unit = _Undefined,
    Object? category = _Undefined,
    Object? repetition = _Undefined,
    Object? repeatEvery = _Undefined,
    Object? weekdays = _Undefined,
    Object? end = _Undefined,
    Object? reminders = _Undefined,
  }) {
    return CreateGoalDto(
      title: title ?? this.title,
      picture: picture is String? ? picture : this.picture,
      target: target ?? this.target,
      unit: unit is String? ? unit : this.unit,
      category:
          category is _i2.Category? ? category : this.category?.copyWith(),
      repetition: repetition is _i3.Repetition? ? repetition : this.repetition,
      repeatEvery: repeatEvery is int? ? repeatEvery : this.repeatEvery,
      weekdays: weekdays is List<int>?
          ? weekdays
          : this.weekdays?.map((e0) => e0).toList(),
      end: end is DateTime? ? end : this.end,
      reminders: reminders is List<DateTime>?
          ? reminders
          : this.reminders?.map((e0) => e0).toList(),
    );
  }
}
