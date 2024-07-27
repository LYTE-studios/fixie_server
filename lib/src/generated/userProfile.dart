/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class UserProfile
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  UserProfile._({
    required this.name,
    required this.email,
    this.birthday,
    required this.daysSinceCreation,
  });

  factory UserProfile({
    required String name,
    required String email,
    DateTime? birthday,
    required int daysSinceCreation,
  }) = _UserProfileImpl;

  factory UserProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserProfile(
      name: jsonSerialization['name'] as String,
      email: jsonSerialization['email'] as String,
      birthday: jsonSerialization['birthday'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['birthday']),
      daysSinceCreation: jsonSerialization['daysSinceCreation'] as int,
    );
  }

  String name;

  String email;

  DateTime? birthday;

  int daysSinceCreation;

  UserProfile copyWith({
    String? name,
    String? email,
    DateTime? birthday,
    int? daysSinceCreation,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      if (birthday != null) 'birthday': birthday?.toJson(),
      'daysSinceCreation': daysSinceCreation,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'name': name,
      'email': email,
      if (birthday != null) 'birthday': birthday?.toJson(),
      'daysSinceCreation': daysSinceCreation,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserProfileImpl extends UserProfile {
  _UserProfileImpl({
    required String name,
    required String email,
    DateTime? birthday,
    required int daysSinceCreation,
  }) : super._(
          name: name,
          email: email,
          birthday: birthday,
          daysSinceCreation: daysSinceCreation,
        );

  @override
  UserProfile copyWith({
    String? name,
    String? email,
    Object? birthday = _Undefined,
    int? daysSinceCreation,
  }) {
    return UserProfile(
      name: name ?? this.name,
      email: email ?? this.email,
      birthday: birthday is DateTime? ? birthday : this.birthday,
      daysSinceCreation: daysSinceCreation ?? this.daysSinceCreation,
    );
  }
}
