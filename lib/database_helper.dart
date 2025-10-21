import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('favoritos.db');
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

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE favoritos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        localizacao TEXT,
        valor TEXT,
        imagem TEXT
      )
    ''');
  }

  Future<void> insertFavorito(Map<String, dynamic> favorito) async {
    final db = await instance.database;
    await db.insert('favoritos', favorito);
  }

  Future<List<Map<String, dynamic>>> getFavoritos() async {
    final db = await instance.database;
    return await db.query('favoritos');
  }

  Future<void> deleteFavorito(int id) async {
    final db = await instance.database;
    await db.delete('favoritos', where: 'id = ?', whereArgs: [id]);
  }
}
