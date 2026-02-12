import 'package:bcs_insight_notes/src/features/notes/domain/models/note_model.dart';

abstract class NoteLocalDataSource {
  Future<List<NoteModel>> getNotes();
  Future<NoteModel?> getNote(String id);
  Future<NoteModel> createNote(NoteModel note);
  Future<NoteModel?> updateNote(NoteModel note);
  Future<bool> deleteNote(String id);
}
