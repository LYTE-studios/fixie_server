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
import '../core/error_types.dart' as _i2;

abstract class EndpointException
    implements
        _i1.SerializableException,
        _i1.SerializableModel,
        _i1.ProtocolSerialization {
  EndpointException._({
    required this.message,
    required this.errorType,
  });

  factory EndpointException({
    required String message,
    required _i2.ErrorType errorType,
  }) = _EndpointExceptionImpl;

  factory EndpointException.fromJson(Map<String, dynamic> jsonSerialization) {
    return EndpointException(
      message: jsonSerialization['message'] as String,
      errorType:
          _i2.ErrorType.fromJson((jsonSerialization['errorType'] as String)),
    );
  }

  String message;

  _i2.ErrorType errorType;

  /// Returns a shallow copy of this [EndpointException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'message': message,
      'errorType': errorType.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
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

  /// Returns a shallow copy of this [EndpointException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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
