import '../model/note_model.dart';
import '../sql/sql.dart';

class NotesRepository {
  final SqlDatabase _database;

  NotesRepository(this._database);

  Future<List<Note>> getNotes() async {
    final db = await _database.db;
    final result = await db!.query('notes');
    return result.map((json) => Note.fromJson(json)).toList();
  }

  Future<int> insertNote({
    required String title,
    required String content,
  }) async {
    final db = await _database.db;
    final creationDate = DateTime.now();
    final lastModifiedDate = DateTime.now();
    return await db!.insert(
      'notes',
      {
        'title': title,
        'content': content,
        'creationDate': creationDate.toIso8601String(),
        'lastModifiedDate': lastModifiedDate.toIso8601String(),
      },
    );
  }

  Future<int> updateNote({
    required int id,
    required String title,
    required String content,
  }) async {
    final db = await _database.db;
    final lastModifiedDate = DateTime.now();
    return await db!.update(
      'notes',
      {
        'title': title,
        'content': content,
        'lastModifiedDate': lastModifiedDate.toIso8601String(),
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteNote({required int id}) async {
    final db = await _database.db;
    return await db!.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
}
