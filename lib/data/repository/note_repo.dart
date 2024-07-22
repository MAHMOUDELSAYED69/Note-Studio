import '../sql/sql.dart';

class NotesRepository {
  final SqlDatabase _database;

  NotesRepository(this._database);

  Future<List<Map<String, dynamic>>> getNotes() async {
    final db = await _database.db;
    return await db!.query('notes');
  }

  Future<int> insertNote(Map<String, dynamic> note) async {
    final db = await _database.db;
    return await db!.insert('notes', note);
  }

  Future<int> updateNote(int id, Map<String, dynamic> note) async {
    final db = await _database.db;
    return await db!.update('notes', note, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteNote(int id) async {
    final db = await _database.db;
    return await db!.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
}
