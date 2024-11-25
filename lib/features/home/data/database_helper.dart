import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'local_data.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE my_data (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        description TEXT,
        imagePath TEXT
      )
    ''');
  }

  // إدخال البيانات
  Future<int> insertData(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('my_data', row);
  }

  // جلب كل البيانات
  Future<List<Map<String, dynamic>>> fetchAllData() async {
    Database db = await instance.database;
    return await db.query('my_data');
  }

  void addLocalData() async {
  final dbHelper = DatabaseHelper.instance;

  // مثال على إدخال بيانات
  await dbHelper.insertData({
    'name': 'Example Item',
    'description': 'This is an example description.',
    'imagePath': '/path/to/local/image.jpg',
  });

  print("Data inserted successfully!");
}

}
