part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesLoading extends NotesState {}

class NoteAdded extends NotesState {}

class NoteUpdated extends NotesState {}

class NotesLoaded extends NotesState {
  final List<Note> notes;

  NotesLoaded(this.notes);
}

class NotesError extends NotesState {
  final String? message;

  NotesError({this.message});
}
