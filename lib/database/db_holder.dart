import 'app_db.dart';

class AppDatabaseHolder {
  static AppDatabase? _database;
  static const String dbName = 'app.db';

  static Future<AppDatabase> get database async {
    _database ??= await $FloorAppDatabase
                  .databaseBuilder(dbName)
                  .build();
    return _database!;
  }
}