// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  BioDao _bioDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Bio` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `personal` TEXT, `educations` TEXT, `experiences` TEXT, `skills` TEXT, `interests` TEXT, `achievements` TEXT, `links` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  BioDao get bioDao {
    return _bioDaoInstance ??= _$BioDao(database, changeListener);
  }
}

class _$BioDao extends BioDao {
  _$BioDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _bioInsertionAdapter = InsertionAdapter(
            database,
            'Bio',
            (Bio item) => <String, dynamic>{
                  'id': item.id,
                  'personal': _personalTypeConverter.encode(item.personal),
                  'educations':
                      _educationListTypeConverter.encode(item.educations),
                  'experiences':
                      _experienceListTypeConverter.encode(item.experiences),
                  'skills': _skillListTypeConverter.encode(item.skills),
                  'interests': _listTypeConverter.encode(item.interests),
                  'achievements': _listTypeConverter.encode(item.achievements),
                  'links': _linkListTypeConverter.encode(item.links)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Bio> _bioInsertionAdapter;

  @override
  Future<List<Bio>> findAllBiosAsync() async {
    return _queryAdapter.queryList('SELECT * FROM Bio',
        mapper: (Map<String, dynamic> row) => Bio(
            row['id'] as int,
            _personalTypeConverter.decode(row['personal'] as String),
            _educationListTypeConverter.decode(row['educations'] as String),
            _experienceListTypeConverter.decode(row['experiences'] as String),
            _skillListTypeConverter.decode(row['skills'] as String),
            _listTypeConverter.decode(row['interests'] as String),
            _listTypeConverter.decode(row['achievements'] as String),
            _linkListTypeConverter.decode(row['links'] as String)));
  }

  @override
  Stream<List<Bio>> findAllBios() {
    return _queryAdapter.queryListStream('SELECT * FROM Bio',
        queryableName: 'Bio',
        isView: false,
        mapper: (Map<String, dynamic> row) => Bio(
            row['id'] as int,
            _personalTypeConverter.decode(row['personal'] as String),
            _educationListTypeConverter.decode(row['educations'] as String),
            _experienceListTypeConverter.decode(row['experiences'] as String),
            _skillListTypeConverter.decode(row['skills'] as String),
            _listTypeConverter.decode(row['interests'] as String),
            _listTypeConverter.decode(row['achievements'] as String),
            _linkListTypeConverter.decode(row['links'] as String)));
  }

  @override
  Future<void> insertBio(Bio bio) async {
    await _bioInsertionAdapter.insert(bio, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _personalTypeConverter = PersonalTypeConverter();
final _educationListTypeConverter = EducationListTypeConverter();
final _experienceListTypeConverter = ExperienceListTypeConverter();
final _skillListTypeConverter = SkillListTypeConverter();
final _linkListTypeConverter = LinkListTypeConverter();
final _listTypeConverter = ListTypeConverter();
