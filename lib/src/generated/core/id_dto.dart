/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class IdDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  IdDto._({required this.id});

  factory IdDto({required int id}) = _IdDtoImpl;

  factory IdDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return IdDto(id: jsonSerialization['id'] as int);
  }

  int id;

  IdDto copyWith({int? id});
  @override
  Map<String, dynamic> toJson() {
    return {'id': id};
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {'id': id};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _IdDtoImpl extends IdDto {
  _IdDtoImpl({required int id}) : super._(id: id);

  @override
  IdDto copyWith({int? id}) {
    return IdDto(id: id ?? this.id);
  }
}
