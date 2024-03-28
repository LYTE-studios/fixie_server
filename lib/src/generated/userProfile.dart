/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class UserProfile extends _i1.SerializableEntity {
  UserProfile._({
    required this.name,
    required this.email,
    required this.daysSinceCreation,
  });

  factory UserProfile({
    required String name,
    required String email,
    required int daysSinceCreation,
  }) = _UserProfileImpl;

  factory UserProfile.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return UserProfile(
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      daysSinceCreation: serializationManager
          .deserialize<int>(jsonSerialization['daysSinceCreation']),
    );
  }

  String name;

  String email;

  int daysSinceCreation;

  UserProfile copyWith({
    String? name,
    String? email,
    int? daysSinceCreation,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'daysSinceCreation': daysSinceCreation,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'name': name,
      'email': email,
      'daysSinceCreation': daysSinceCreation,
    };
  }
}

class _UserProfileImpl extends UserProfile {
  _UserProfileImpl({
    required String name,
    required String email,
    required int daysSinceCreation,
  }) : super._(
          name: name,
          email: email,
          daysSinceCreation: daysSinceCreation,
        );

  @override
  UserProfile copyWith({
    String? name,
    String? email,
    int? daysSinceCreation,
  }) {
    return UserProfile(
      name: name ?? this.name,
      email: email ?? this.email,
      daysSinceCreation: daysSinceCreation ?? this.daysSinceCreation,
    );
  }
}
