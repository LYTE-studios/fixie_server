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

abstract class Notification
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  Notification._({
    required this.title,
    required this.description,
    this.routeRedirect,
    required this.tokens,
  });

  factory Notification({
    required String title,
    required String description,
    String? routeRedirect,
    required List<String> tokens,
  }) = _NotificationImpl;

  factory Notification.fromJson(Map<String, dynamic> jsonSerialization) {
    return Notification(
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      routeRedirect: jsonSerialization['routeRedirect'] as String?,
      tokens: (jsonSerialization['tokens'] as List)
          .map((e) => e as String)
          .toList(),
    );
  }

  String title;

  String description;

  String? routeRedirect;

  List<String> tokens;

  Notification copyWith({
    String? title,
    String? description,
    String? routeRedirect,
    List<String>? tokens,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      if (routeRedirect != null) 'routeRedirect': routeRedirect,
      'tokens': tokens.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'title': title,
      'description': description,
      if (routeRedirect != null) 'routeRedirect': routeRedirect,
      'tokens': tokens.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NotificationImpl extends Notification {
  _NotificationImpl({
    required String title,
    required String description,
    String? routeRedirect,
    required List<String> tokens,
  }) : super._(
          title: title,
          description: description,
          routeRedirect: routeRedirect,
          tokens: tokens,
        );

  @override
  Notification copyWith({
    String? title,
    String? description,
    Object? routeRedirect = _Undefined,
    List<String>? tokens,
  }) {
    return Notification(
      title: title ?? this.title,
      description: description ?? this.description,
      routeRedirect:
          routeRedirect is String? ? routeRedirect : this.routeRedirect,
      tokens: tokens ?? this.tokens.clone(),
    );
  }
}
