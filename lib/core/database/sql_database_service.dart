import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/core/utils/app_constants.dart';

class SqlDBService {
  static Database? _db;
  //* implementing the singleton design pattern
  SqlDBService._internal();
  static final SqlDBService instance = SqlDBService._internal();

  //* ensuring that db is initialized once
  Future<Database?> get database async {
    if (_db != null) return _db!;
    _db = await initDatabase();
    return _db!;
  }

  Future<Database> initDatabase() async {
    final String dbDirectoryPath = await getDatabasesPath();
    final String dbPath = join(dbDirectoryPath, tasksDatabasePathName);
    final Database database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
      CREATE TABLE $tasksTableName(
      $tasksIdColumnName INTEGER PRIMARY KEY NOT NULL AUTOINCREMENT,
      $tasksTitleColumnName TEXT NOT NULL,
      $tasksDescriptionColumnName TEXT NULL,
      $tasksDeadlineColumnName TEXT NULL,
      $tasksStatusColumnName INTEGER NOT NULL,
      )
''');
      },
    );
    return database;
  }

  Future<void> insertInTable(
      String tableName, Map<String, dynamic> data) async {
    final db = await database;
    await db!.insert(tableName, data);
  }

  Future<List<Map<String, dynamic>>> getTableData(String tableName) async {
    final Database? db = await database;
    return await db!.query(tableName);
  }

  Future<void> updateTableValues(
      String tableName, Map<String, dynamic> valuesToUpdate,
      {List<Object?>? whereArgs, String? where}) async {
    final Database? db = await database;
    await db!
        .update(tableName, valuesToUpdate, where: where, whereArgs: whereArgs);
  }

  Future<void> deleteFromDb(String tableName,
      {String? where, List<Object?>? whereArgs}) async {
    final Database? db = await database;
    await db!.delete(tableName, where: where, whereArgs: whereArgs);
  }
}
