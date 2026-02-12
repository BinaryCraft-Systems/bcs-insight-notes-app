import 'package:bcs_insight_notes/src/features/notes/domain/entities/note_entity.dart';

abstract class NoteRepository {
  Future<List<NoteEntity>> getNotes();
  Future<NoteEntity?> getNote(String id);
  Future<NoteEntity> createNote(NoteEntity note);
  Future<NoteEntity?> updateNote(NoteEntity note);
  Future<bool> deleteNote(String id);
}
