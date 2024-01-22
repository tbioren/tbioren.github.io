import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

// An indivudal project tile
class Project extends StatefulWidget {
  final dynamic data;
  const Project(this.data, {super.key});

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  late String title;
  late String description;
  late String link;
  late List<dynamic> tags;
  late String image;
  bool isHover = false;

  @override
  void initState() {
    super.initState();
    readJson(widget.data);
  }

  void readJson(dynamic data) {
    title = data['title'];
    description = data['description'];
    link = data['link'];
    tags = data['tags'];
    image = data['image'];
  }

  Future<void> launch(String url, {bool isNewTab = true}) async {
    await launchUrl(
      Uri.parse(url),
      webOnlyWindowName: isNewTab ? '_blank' : '_self',
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      color: isHover ? Colors.black12 : Colors.white,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        onPressed: () {
          launch(link, isNewTab: true);
        },
        child: Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                image,
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        title,
                        maxFontSize: 48,
                        minFontSize: 20,
                        maxLines: 1,
                      ),
                      AutoSizeText(
                        description,
                        maxFontSize: 36,
                        minFontSize: 8,
                        maxLines: 4,
                        softWrap: true,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 80, 80, 80),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
