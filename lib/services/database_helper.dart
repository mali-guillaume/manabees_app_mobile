import 'package:intl/intl.dart';
import 'package:manabees_app_mobile/models/note_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';




class DatabaseHelper {
  static const int _version = 3;
  static const String _dbName = "Notes.db";

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
            "Create TABLE Note(id INTEGER PRIMARY KEY, title TEXT NOT NULL, description TEXT NOT NULL, date DATE);"),
        version: _version);
  }








  static Future<int> addNote(Note note) async {
    final db = await _getDB();
    return await db.insert("Note", note.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateNote(Note note) async {
    final db = await _getDB();
    return await db.update("Note", note.toJson(),
        where: 'id = ?',
        whereArgs: [note.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  static Future<int> deleteNote(Note note) async {
    final db = await _getDB();
    return await db.delete("Note",
        where: 'id = ?',
        whereArgs: [note.id],
    );
  }



  static Future<List<Note>?> getAllNotes() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query("Note");
    if(maps.isEmpty){
      return null;
    }

    return List.generate(maps.length, (index) => Note.fromJson(maps[index]));
  }


  static Future<List<Note>?> getAllNotesofDay(DateTime date) async {
    String dateBD = DateFormat("yyyy-MM-dd").format(date);
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query("Note where date = '$dateBD'");
    if(maps.isEmpty){
      return null;
    }

    return List.generate(maps.length, (index) => Note.fromJson(maps[index]));
  }





}
