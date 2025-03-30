import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final _instance = DbHelper._();
  Database? _database;

  static const table = 'Text';

  DbHelper._();

  factory DbHelper() {
    return _instance;
  }

  Future<Database> get _db async {
    if (_database != null) {
      return _database!;
    }
    _database = await init();
    return _database!;
  }

  Future<Database?> init() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'ios.db');

    return await openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $table (
        id INTEGER PRIMARY KEY,
        name TEXT
        )''');
      },
      version: 1,
    );
  }

  Future<void> addData(String name) async {
    final db = await _db;
    await db.insert(table, {
      'name':name
    });
  }

  Future<List<Map<String, Object?>>> getUser() async {
    final db = await _db;

    List<Map<String, Object?>> list = await db.query(table);
    return list;
  }

  Future<void> deleteNameById(int id)async{
    final db = await _db;
    await db.delete(table,where: 'id = ?',whereArgs: [id]);
  }
}
