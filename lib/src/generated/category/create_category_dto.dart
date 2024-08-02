/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class CreateCategoryDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CreateCategoryDto._({
    required this.title,
    required this.color,
    this.icon,
  });

  factory CreateCategoryDto({
    required String title,
    required String color,
    String? icon,
  }) = _CreateCategoryDtoImpl;

  factory CreateCategoryDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return CreateCategoryDto(
      title: jsonSerialization['title'] as String,
      color: jsonSerialization['color'] as String,
      icon: jsonSerialization['icon'] as String?,
    );
  }

  String title;

  String color;

  String? icon;

  CreateCategoryDto copyWith({
    String? title,
    String? color,
    String? icon,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'color': color,
      if (icon != null) 'icon': icon,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'title': title,
      'color': color,
      if (icon != null) 'icon': icon,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CreateCategoryDtoImpl extends CreateCategoryDto {
  _CreateCategoryDtoImpl({
    required String title,
    required String color,
    String? icon,
  }) : super._(
          title: title,
          color: color,
          icon: icon,
        );

  @override
  CreateCategoryDto copyWith({
    String? title,
    String? color,
    Object? icon = _Undefined,
  }) {
    return CreateCategoryDto(
      title: title ?? this.title,
      color: color ?? this.color,
      icon: icon is String? ? icon : this.icon,
    );
  }
}
