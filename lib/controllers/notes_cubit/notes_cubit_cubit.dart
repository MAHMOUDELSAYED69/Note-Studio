import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/note_model.dart';
import '../../data/repository/note_repo.dart';

part 'notes_cubit_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final NotesRepository _notesRepository;

  NotesCubit(this._notesRepository) : super(NotesInitial());

  Future<void> fetchNotes() async {
    try {
      emit(NotesLoading());
      final notes = await _notesRepository.getNotes();
      emit(NotesLoaded(notes));
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }

  Future<void> addNote({
    required String title,
    required String content,
  }) async {
    try {
      emit(NotesLoading());
      await _notesRepository.insertNote(
        title: title,
        content: content,
      );
      await fetchNotes();
      emit(NoteAdded());
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }

  Future<void> updateNote({
    required int id,
    required String title,
    required String content,
  }) async {
    try {
      emit(NotesLoading());
      await _notesRepository.updateNote(
        id: id,
        title: title,
        content: content,
      );
      await fetchNotes();
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }

  Future<void> deleteNote({
    required int id,
  }) async {
    try {
      emit(NotesLoading());
      await _notesRepository.deleteNote(
        id: id,
      );
      await fetchNotes();
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }
}
