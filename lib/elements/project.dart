import 'package:auto_size_text/auto_size_text.dart';
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
  String image = "";

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
    image = data['image'];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AutoSizeText(
                title,
                style: const TextStyle(fontSize: 30),
                maxLines: 1,
              ),
              Text(description),
            ],
          ),
        ],
      ),
    );
  }
}
