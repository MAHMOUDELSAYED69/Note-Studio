class Note {
  final int id; // Change to int since SQLite autoincrement uses int
  final String title;
  final String content;
  final DateTime creationDate;
  final DateTime lastModifiedDate;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.creationDate,
    required this.lastModifiedDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'creationDate': creationDate.toIso8601String(),
      'lastModifiedDate': lastModifiedDate.toIso8601String(),
    };
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      creationDate: DateTime.parse(json['creationDate']),
      lastModifiedDate: DateTime.parse(json['lastModifiedDate']),
    );
  }
}
