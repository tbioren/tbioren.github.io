import 'package:flutter/material.dart';

/// An individual project tile
class Project extends StatefulWidget {
  final dynamic data;
  const Project(this.data, {super.key});

  @override
  State<Project> createState() => _ProjectState(data);
}

class _ProjectState extends State<Project> {
  String title = "";
  String description = "";
  Uri link = Uri();
  List<dynamic> tags = List<dynamic>.empty(growable: true);

  _ProjectState(dynamic data) {
    initState();
    readJson(data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void readJson(dynamic data) {
    title = data['title'];
    description = data['description'];
    link = Uri.parse(data['link']);
    tags = data['tags'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Text(title),
    );
  }
}
