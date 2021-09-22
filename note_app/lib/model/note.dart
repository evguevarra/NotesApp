class Note {
  final int? id;
  final String title;
  final String description;
  final String createdTime;

  Note({
    this.id,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  factory Note.fromMap(Map<String, dynamic> json) => new Note(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        createdTime: json['createdTime'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': title,
      'createdTime': createdTime,
    };
  }
}
