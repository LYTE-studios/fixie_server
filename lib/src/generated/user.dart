/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class User extends _i1.SerializableEntity {
  User._({
    required this.email,
    required this.password,
  });

  factory User({
    required String email,
    required String password,
  }) = _UserImpl;

  factory User.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return User(
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      password: serializationManager
          .deserialize<String>(jsonSerialization['password']),
    );
  }

  String email;

  String password;

  User copyWith({
    String? email,
    String? password,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class _UserImpl extends User {
  _UserImpl({
    required String email,
    required String password,
  }) : super._(
          email: email,
          password: password,
        );

  @override
  User copyWith({
    String? email,
    String? password,
  }) {
    return User(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
