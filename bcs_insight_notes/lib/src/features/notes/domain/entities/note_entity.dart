class NoteEntity {
  final String id;
  final String title;
  final String body;
  final DateTime createdAt;
  final DateTime updatedAt;

  const NoteEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt, required this.updatedAt,
  });

  NoteEntity copyWith({
    String? title,
    String? body,
    DateTime? updatedAt
  }) {
    return NoteEntity(
      id: id,
      title: title ?? this.title,
      body: body ?? this.body,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
