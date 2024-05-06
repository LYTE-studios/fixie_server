/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class EndpointException extends _i1.SerializableEntity
    implements _i1.SerializableException {
  EndpointException._({
    required this.message,
    required this.errorType,
  });

  factory EndpointException({
    required String message,
    required _i2.ErrorType errorType,
  }) = _EndpointExceptionImpl;

  factory EndpointException.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return EndpointException(
      message: serializationManager
          .deserialize<String>(jsonSerialization['message']),
      errorType: serializationManager
          .deserialize<_i2.ErrorType>(jsonSerialization['errorType']),
    );
  }

  String message;

  _i2.ErrorType errorType;

  EndpointException copyWith({
    String? message,
    _i2.ErrorType? errorType,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'errorType': errorType.toJson(),
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'message': message,
      'errorType': errorType.toJson(),
    };
  }
}

class _EndpointExceptionImpl extends EndpointException {
  _EndpointExceptionImpl({
    required String message,
    required _i2.ErrorType errorType,
  }) : super._(
          message: message,
          errorType: errorType,
        );

  @override
  EndpointException copyWith({
    String? message,
    _i2.ErrorType? errorType,
  }) {
    return EndpointException(
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
    );
  }
}
