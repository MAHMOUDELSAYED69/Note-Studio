import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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

  Future<void> addNote(Map<String, dynamic> note) async {
    try {
      emit(NotesLoading());
      await _notesRepository.insertNote(note);
      fetchNotes();
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }

  Future<void> updateNote(int id, Map<String, dynamic> note) async {
    try {
      emit(NotesLoading());
      await _notesRepository.updateNote(id, note);
      fetchNotes();
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }

  Future<void> deleteNote(int id) async {
    try {
      emit(NotesLoading());
      await _notesRepository.deleteNote(id);
      fetchNotes();
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }
}
