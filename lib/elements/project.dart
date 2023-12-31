import 'package:flutter/material.dart';
import 'dart:convert';

/// An individual project tile
class Project extends StatefulWidget {
  final String data;
  const Project(this.data, {super.key});

  @override
  State<Project> createState() => _ProjectState(data);
}

class _ProjectState extends State<Project> {
  String title = "";
  String description = "";
  Uri link = Uri();
  List<String> tags = List<String>.empty(growable: true);

  _ProjectState(String data) {
    debugPrint("project");
    // final parsedJson = jsonDecode(data);
    // title = parsedJson['title'];
    // description = parsedJson['description'];
    // link = Uri.parse(parsedJson['link']);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("project");
    return Text(title);
  }
}
