import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:website/elements/project.dart';

class Projects extends StatefulWidget {
  final String path;
  const Projects(this.path, {super.key});

  @override
  State<Projects> createState() => _ProjectsState(path);
}

class _ProjectsState extends State<Projects> {
  String _file = "";
  var _projects;
  @override
  void initState() {
    super.initState();
    loadJson();
  }

  Future<void> loadJson() async {
    String encoded = await rootBundle.loadString(_file);
    final decoded = jsonDecode(encoded);
    setState(() {
      debugPrint(decoded[3]['title']);
      _projects = decoded;
    });
  }

  _ProjectsState(String file) {
    _file = file;
    initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(_file);
    return SizedBox(
      width: MediaQuery.of(context).size.width > 800
          ? 700
          : MediaQuery.of(context).size.width * 0.8,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: (_projects as List<dynamic>).length,
        itemBuilder: (BuildContext context, int index) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Project(_projects[index]),
          );
        },
      ),
    );
  }
}
