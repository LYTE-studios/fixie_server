/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

enum TargetPeriod implements _i1.SerializableModel {
  day,
  week,
  month;

  static TargetPeriod fromJson(int index) {
    switch (index) {
      case 0:
        return day;
      case 1:
        return week;
      case 2:
        return month;
      default:
        throw ArgumentError(
            'Value "$index" cannot be converted to "TargetPeriod"');
    }
  }

  @override
  int toJson() => index;
  @override
  String toString() => name;
}
