class Note {
  String? title;
  String? note_id;
  String? user_id;

  String? note_collection;
  String? content;
  DateTime? timeStamp;

  Note(
      {this.title,
      this.note_id,
      this.user_id,
      this.note_collection,
      this.content,
      this.timeStamp});

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
        title: map['title'],
        note_id: map['note_id'],
        user_id: map['user_id'],
        note_collection: map['note_collection'],
        content: map['content'],
        timeStamp: DateTime.tryParse(map['timeStamp']));
  }
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'note_id': note_id,
      'user_id': user_id,
      'note_collection': note_collection,
      'content': content,
      'timeStamp': timeStamp?.toIso8601String()
    };
  }
}
