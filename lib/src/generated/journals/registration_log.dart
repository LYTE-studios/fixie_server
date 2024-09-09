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

abstract class RegistrationLog
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  RegistrationLog._({
    this.loggedValue,
    required this.setTime,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory RegistrationLog({
    double? loggedValue,
    required DateTime setTime,
    required DateTime createdAt,
    required DateTime modifiedAt,
  }) = _RegistrationLogImpl;

  factory RegistrationLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return RegistrationLog(
      loggedValue: (jsonSerialization['loggedValue'] as num?)?.toDouble(),
      setTime: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['setTime']),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      modifiedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['modifiedAt']),
    );
  }

  double? loggedValue;

  DateTime setTime;

  DateTime createdAt;

  DateTime modifiedAt;

  RegistrationLog copyWith({
    double? loggedValue,
    DateTime? setTime,
    DateTime? createdAt,
    DateTime? modifiedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (loggedValue != null) 'loggedValue': loggedValue,
      'setTime': setTime.toJson(),
      'createdAt': createdAt.toJson(),
      'modifiedAt': modifiedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (loggedValue != null) 'loggedValue': loggedValue,
      'setTime': setTime.toJson(),
      'createdAt': createdAt.toJson(),
      'modifiedAt': modifiedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RegistrationLogImpl extends RegistrationLog {
  _RegistrationLogImpl({
    double? loggedValue,
    required DateTime setTime,
    required DateTime createdAt,
    required DateTime modifiedAt,
  }) : super._(
          loggedValue: loggedValue,
          setTime: setTime,
          createdAt: createdAt,
          modifiedAt: modifiedAt,
        );

  @override
  RegistrationLog copyWith({
    Object? loggedValue = _Undefined,
    DateTime? setTime,
    DateTime? createdAt,
    DateTime? modifiedAt,
  }) {
    return RegistrationLog(
      loggedValue: loggedValue is double? ? loggedValue : this.loggedValue,
      setTime: setTime ?? this.setTime,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
    );
  }
}
