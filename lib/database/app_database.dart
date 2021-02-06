import 'dart:async';
import 'package:floor/floor.dart';
import './daos.dart';
import './entities.dart';
import './type_converters.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [Bio])
@TypeConverters([
  PersonalTypeConverter,
  EducationListTypeConverter,
  ExperienceListTypeConverter,
  SkillListTypeConverter,
  LinkListTypeConverter,
  ListTypeConverter
])
abstract class AppDatabase extends FloorDatabase {
  BioDao get bioDao;
  static final AppDatabase? _instance = null;
  static Future<AppDatabase> get instance async {
    return _instance ??
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }
}
