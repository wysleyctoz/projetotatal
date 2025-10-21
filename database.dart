import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("hotel_app.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE favoritos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        preco TEXT NOT NULL,
        imagem TEXT NOT NULL
      )
    ''');
  }

  Future<int> addFavorito(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert('favoritos', row);
  }

  Future<List<Map<String, dynamic>>> getFavoritos() async {
    final db = await instance.database;
    return await db.query('favoritos');
  }

  Future<int> removeFavorito(String nome) async {
    final db = await instance.database;
    return await db.delete(
      'favoritos',
      where: 'nome = ?',
      whereArgs: [nome],
    );
  }
}
