import 'package:flutter/cupertino.dart';

String title = "";
String description = "";
Uri link = Uri();
List<String> tags = List<String>.empty(growable: true);

fromJson(Map<String, dynamic> json) {
  title = json['title'];
  description = json['description'];
  link = Uri.parse(json['link']);
}

class Project extends StatefulWidget {
  const Project({
    super.key,
  });

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
