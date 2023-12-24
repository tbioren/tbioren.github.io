import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Skills extends StatefulWidget {
  const Skills({
    super.key,
  });

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    // Look up Dart's cascade notation for the ".."
    // The addListner() has to call setState() in order to update the state
    animation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: VisibilityDetector(
        key: const Key("Skills Specifics"),
        onVisibilityChanged: (VisibilityInfo info) {
          controller.forward();
        },
        child: Opacity(
          opacity: animation.value,
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Languages
                Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Languages",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width / 80,
                        ),
                      ),
                      Text(
                        "Javascript\nPython\nJava\nDart\nC#\nC/C++",
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          fontSize: MediaQuery.of(context).size.width / 100,
                        ),
                      ),
                    ],
                  ),
                ),
                // Tools
                Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Tools",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width / 80,
                        ),
                      ),
                      Text(
                        "Flutter\nUnity\nGitHub",
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          fontSize: MediaQuery.of(context).size.width / 100,
                        ),
                      ),
                    ],
                  ),
                ),
                // Skills
                Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Team Skills",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width / 80,
                        ),
                      ),
                      Text(
                        "Agile Development\nDesign\nCommunication",
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          fontSize: MediaQuery.of(context).size.width / 100,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
