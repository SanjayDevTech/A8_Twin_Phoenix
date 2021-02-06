import 'dart:convert';

import 'package:floor/floor.dart';
import './entities.dart';

class PersonalTypeConverter extends TypeConverter<Personal, String> {
  @override
  Personal decode(String databaseValue) {
    return Personal.fromJson(jsonDecode(databaseValue));
  }

  @override
  String encode(Personal value) {
    return value.toJson().toString();
  }
}

class EducationListTypeConverter
    extends TypeConverter<List<Education>, String> {
  @override
  List<Education> decode(String databaseValue) =>
      List.from(jsonDecode(databaseValue));

  @override
  String encode(List<Education> value) =>
      jsonEncode(value.map((e) => e.toJson()).toList());
}

class ExperienceListTypeConverter
    extends TypeConverter<List<Experience>, String> {
  @override
  List<Experience> decode(String databaseValue) =>
      List.from(jsonDecode(databaseValue));

  @override
  String encode(List<Experience> value) =>
      jsonEncode(value.map((e) => e.toJson()).toList());
}

class SkillListTypeConverter extends TypeConverter<List<Skill>, String> {
  @override
  List<Skill> decode(String databaseValue) =>
      List.from(jsonDecode(databaseValue));

  @override
  String encode(List<Skill> value) =>
      jsonEncode(value.map((e) => e.toJson()).toList());
}

class LinkListTypeConverter extends TypeConverter<List<Link>, String> {
  @override
  List<Link> decode(String databaseValue) =>
      List.from(jsonDecode(databaseValue));

  @override
  String encode(List<Link> value) =>
      jsonEncode(value.map((e) => e.toJson()).toList());
}

class ListTypeConverter extends TypeConverter<List<String>, String> {
  @override
  List<String> decode(String databaseValue) =>
      List.from(jsonDecode(databaseValue));

  @override
  String encode(List<String> value) => jsonEncode(value);
}
