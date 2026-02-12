import 'package:bcs_insight_notes/src/features/notes/domain/entities/note_entity.dart';

import '../../domain/models/note_model.dart';
import '../../domain/repositories/note_repository.dart';
import '../datasources/note_local_data_source.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDataSource _localDataSource;

  NoteRepositoryImpl(this._localDataSource);

  @override
  Future<NoteEntity> createNote(NoteEntity note) async {
    final model = NoteModel.fromEntity(note);
    final createdModel = await _localDataSource.createNote(model);
    return createdModel.toEntity();
  }

  @override
  Future<bool> deleteNote(String id) {
    return _localDataSource.deleteNote(id);
  }

  @override
  Future<NoteEntity?> getNote(String id) async {
    final model = await _localDataSource.getNote(id);
    return model?.toEntity();
  }

  @override
  Future<List<NoteEntity>> getNotes() async {
    final models = await _localDataSource.getNotes();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<NoteEntity?> updateNote(NoteEntity note) async {
    final model = NoteModel.fromEntity(note);
    final updatedModel = await _localDataSource.updateNote(model);
    return updatedModel?.toEntity();
  }
}
