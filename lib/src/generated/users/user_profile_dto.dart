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
import '../users/archetype.dart' as _i2;

abstract class UserProfileDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  UserProfileDto._({
    required this.name,
    this.birthday,
    required this.daysSinceCreation,
    this.email,
    this.picture,
    required this.hasPassedOnboarding,
    required this.hasPassedGoalTutorial,
    this.informationCollectionSetting,
    this.automaticRemindersSetting,
    this.locale,
    this.archetype,
  });

  factory UserProfileDto({
    required String name,
    DateTime? birthday,
    required int daysSinceCreation,
    String? email,
    String? picture,
    required bool hasPassedOnboarding,
    required bool hasPassedGoalTutorial,
    bool? informationCollectionSetting,
    bool? automaticRemindersSetting,
    String? locale,
    _i2.Archetype? archetype,
  }) = _UserProfileDtoImpl;

  factory UserProfileDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserProfileDto(
      name: jsonSerialization['name'] as String,
      birthday: jsonSerialization['birthday'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['birthday']),
      daysSinceCreation: jsonSerialization['daysSinceCreation'] as int,
      email: jsonSerialization['email'] as String?,
      picture: jsonSerialization['picture'] as String?,
      hasPassedOnboarding: jsonSerialization['hasPassedOnboarding'] as bool,
      hasPassedGoalTutorial: jsonSerialization['hasPassedGoalTutorial'] as bool,
      informationCollectionSetting:
          jsonSerialization['informationCollectionSetting'] as bool?,
      automaticRemindersSetting:
          jsonSerialization['automaticRemindersSetting'] as bool?,
      locale: jsonSerialization['locale'] as String?,
      archetype: jsonSerialization['archetype'] == null
          ? null
          : _i2.Archetype.fromJson((jsonSerialization['archetype'] as int)),
    );
  }

  String name;

  DateTime? birthday;

  int daysSinceCreation;

  String? email;

  String? picture;

  bool hasPassedOnboarding;

  bool hasPassedGoalTutorial;

  bool? informationCollectionSetting;

  bool? automaticRemindersSetting;

  String? locale;

  _i2.Archetype? archetype;

  /// Returns a shallow copy of this [UserProfileDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserProfileDto copyWith({
    String? name,
    DateTime? birthday,
    int? daysSinceCreation,
    String? email,
    String? picture,
    bool? hasPassedOnboarding,
    bool? hasPassedGoalTutorial,
    bool? informationCollectionSetting,
    bool? automaticRemindersSetting,
    String? locale,
    _i2.Archetype? archetype,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      if (birthday != null) 'birthday': birthday?.toJson(),
      'daysSinceCreation': daysSinceCreation,
      if (email != null) 'email': email,
      if (picture != null) 'picture': picture,
      'hasPassedOnboarding': hasPassedOnboarding,
      'hasPassedGoalTutorial': hasPassedGoalTutorial,
      if (informationCollectionSetting != null)
        'informationCollectionSetting': informationCollectionSetting,
      if (automaticRemindersSetting != null)
        'automaticRemindersSetting': automaticRemindersSetting,
      if (locale != null) 'locale': locale,
      if (archetype != null) 'archetype': archetype?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'name': name,
      if (birthday != null) 'birthday': birthday?.toJson(),
      'daysSinceCreation': daysSinceCreation,
      if (email != null) 'email': email,
      if (picture != null) 'picture': picture,
      'hasPassedOnboarding': hasPassedOnboarding,
      'hasPassedGoalTutorial': hasPassedGoalTutorial,
      if (informationCollectionSetting != null)
        'informationCollectionSetting': informationCollectionSetting,
      if (automaticRemindersSetting != null)
        'automaticRemindersSetting': automaticRemindersSetting,
      if (locale != null) 'locale': locale,
      if (archetype != null) 'archetype': archetype?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserProfileDtoImpl extends UserProfileDto {
  _UserProfileDtoImpl({
    required String name,
    DateTime? birthday,
    required int daysSinceCreation,
    String? email,
    String? picture,
    required bool hasPassedOnboarding,
    required bool hasPassedGoalTutorial,
    bool? informationCollectionSetting,
    bool? automaticRemindersSetting,
    String? locale,
    _i2.Archetype? archetype,
  }) : super._(
          name: name,
          birthday: birthday,
          daysSinceCreation: daysSinceCreation,
          email: email,
          picture: picture,
          hasPassedOnboarding: hasPassedOnboarding,
          hasPassedGoalTutorial: hasPassedGoalTutorial,
          informationCollectionSetting: informationCollectionSetting,
          automaticRemindersSetting: automaticRemindersSetting,
          locale: locale,
          archetype: archetype,
        );

  /// Returns a shallow copy of this [UserProfileDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserProfileDto copyWith({
    String? name,
    Object? birthday = _Undefined,
    int? daysSinceCreation,
    Object? email = _Undefined,
    Object? picture = _Undefined,
    bool? hasPassedOnboarding,
    bool? hasPassedGoalTutorial,
    Object? informationCollectionSetting = _Undefined,
    Object? automaticRemindersSetting = _Undefined,
    Object? locale = _Undefined,
    Object? archetype = _Undefined,
  }) {
    return UserProfileDto(
      name: name ?? this.name,
      birthday: birthday is DateTime? ? birthday : this.birthday,
      daysSinceCreation: daysSinceCreation ?? this.daysSinceCreation,
      email: email is String? ? email : this.email,
      picture: picture is String? ? picture : this.picture,
      hasPassedOnboarding: hasPassedOnboarding ?? this.hasPassedOnboarding,
      hasPassedGoalTutorial:
          hasPassedGoalTutorial ?? this.hasPassedGoalTutorial,
      informationCollectionSetting: informationCollectionSetting is bool?
          ? informationCollectionSetting
          : this.informationCollectionSetting,
      automaticRemindersSetting: automaticRemindersSetting is bool?
          ? automaticRemindersSetting
          : this.automaticRemindersSetting,
      locale: locale is String? ? locale : this.locale,
      archetype: archetype is _i2.Archetype? ? archetype : this.archetype,
    );
  }
}
