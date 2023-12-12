class Project {
  String title = "";
  String description = "";

  Project(this.title, this.description);

  Project.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }
}
