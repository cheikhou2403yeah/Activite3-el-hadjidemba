import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;

  // Nom de la base
  static const String _dbName = 'notes.db';
  static const int _dbVersion = 1;

  // Table
  static const String tableNote = 'notes';

  // Singleton DB
  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  // Initialisation DB
  static Future<Database> _initDB() async {
    Directory docDir = await getApplicationDocumentsDirectory();
    String path = join(docDir.path, _dbName);

    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  // Création table
  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableNote (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titre TEXT NOT NULL,
        contenu TEXT NOT NULL
      )
    ''');
  }

  // ➕ Ajouter une note
  static Future<int> insertNote(Map<String, dynamic> note) async {
    final db = await database;
    return await db.insert(tableNote, note);
  }

  // 📄 Lire toutes les notes
  static Future<List<Map<String, dynamic>>> getNotes() async {
    final db = await database;
    return await db.query(tableNote, orderBy: 'id DESC');
  }

  // ❌ Supprimer une note
  static Future<int> deleteNote(int id) async {
    final db = await database;
    return await db.delete(
      tableNote,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // ✏️ Modifier une note existante
  static Future<int> updateNote(Map<String, dynamic> note) async {
    final db = await database;
    return await db.update(
      tableNote,
      note,
      where: 'id = ?',
      whereArgs: [note['id']],
    );
  }

}
