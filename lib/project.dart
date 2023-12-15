class Project {
  String title = "";
  String description = "";
  Uri link = Uri();
  List<String> tags = List<String>.empty(growable: true);

  Project(this.title, this.description);

  Project.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    link = Uri.parse(json['link']);
  }
}
