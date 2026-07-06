class ModelClass {
  int? id;
  String title;
  String description;

  ModelClass({this.id, required this.title, required this.description});

  factory ModelClass.fromMap(Map<String, dynamic> map) {
    return ModelClass(
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'description': description};
  }
}
