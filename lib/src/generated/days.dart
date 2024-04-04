/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

enum Days with _i1.SerializableEntity {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday;

  static Days? fromJson(int index) {
    switch (index) {
      case 0:
        return Monday;
      case 1:
        return Tuesday;
      case 2:
        return Wednesday;
      case 3:
        return Thursday;
      case 4:
        return Friday;
      case 5:
        return Saturday;
      case 6:
        return Sunday;
      default:
        return null;
    }
  }

  @override
  int toJson() => index;
}
