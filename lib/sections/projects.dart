import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Projects extends StatefulWidget {
  final String path;
  const Projects(this.path, {super.key});

  @override
  State<Projects> createState() => _ProjectsState(path);
}

class _ProjectsState extends State<Projects> {
  String _file = "";
  @override
  void initState() {
    super.initState();
    loadJson();
  }

  Future<void> loadJson() async {
    String json = await rootBundle.loadString(_file);
    setState(() {
      // debugPrint(_file);
    });
  }

  _ProjectsState(String file) {
    _file = file;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
