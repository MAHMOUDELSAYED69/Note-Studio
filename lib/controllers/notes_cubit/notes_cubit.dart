import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/note_model.dart';
import '../../data/repository/note_repo.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final NotesRepository _notesRepository;

  NotesCubit(this._notesRepository) : super(NotesInitial());

  Future<void> fetchNotes() async {
    try {
      emit(NotesLoading());
      final notes = await _notesRepository.getNotes();
      emit(NotesLoaded(notes));
    } catch (err) {
      emit(NotesError(message: err.toString()));
    }
  }

  Future<void> addNote({
    required String title,
    required String content,
  }) async {
    try {
      await _notesRepository.insertNote(
        title: title,
        content: content,
      );
      emit(NoteAdded());
      await fetchNotes();
    } catch (err) {
      emit(NotesError(message: err.toString()));
    }
  }

  Future<void> updateNote({
    required int id,
    required String title,
    required String content,
  }) async {
    try {
      await _notesRepository.updateNote(
        id: id,
        title: title,
        content: content,
      );
      emit(NoteUpdated());
      await fetchNotes();
    } catch (err) {
      emit(NotesError(message: err.toString()));
    }
  }

  Future<void> deleteNote({
    required int id,
  }) async {
    try {
      await _notesRepository.deleteNote(
        id: id,
      );
      await fetchNotes();
    } catch (err) {
      emit(NotesError(message: err.toString()));
    }
  }
}
