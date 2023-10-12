import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@freezed
class Person with _$Person {
  const factory Person({
    required int id,
    required String name,
    required String imageUrl,
  }) = _Person;

  factory Person.fromJson(Map<String, Object?> json) => _$PersonFromJson(json);
}

extension JsonWithoutId on Person {
  String toJsonWithoutId() {
    final map = toJson();
    // ignore: cascade_invocations  //remove returns the removed field!, cascade_invocations
    map.remove('id');
    return json.encode(map);
  }
}

// String toJsonWithoutId(Person p) {
//   var a = p.toJson();
//   var b = a.remove('id');
//   var c = json.encode(a);

//   // final map = p.toJson().remove('id');
//   // return json.encode(map);
//   return c;
// }
