import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

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
  late Uri link;
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
    link = Uri.parse(data['link']);
    tags = data['tags'];
    image = data['image'];
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (isHovering) {
        setState(() {
          isHover = isHovering;
        });
        debugPrint("hover: $isHover");
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          color: isHover ? Colors.black12 : Colors.white,
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
