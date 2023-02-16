class Note {
  final int? id;
  final String title;
  final String description;
  final String date;

  const Note(
      {required this.title,
      required this.description,
      this.id,
      required this.date});

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        date: json['date'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'date': date,
      };

  @override
  String toString() {
    // TODO: implement toString
    return 'id: $id, title: $title , description: $description';
  }
}
