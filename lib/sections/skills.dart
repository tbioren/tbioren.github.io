import 'package:auto_size_text/auto_size_text.dart';
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
        duration: const Duration(milliseconds: 1000), vsync: this);
    // Look up Dart's cascade notation for the ".."
    // The addListner() has to call setState() in order to update the state
    // TODO: change beginning to 0 and add VisibilityDetector to reinstate animation
    animation = Tween<double>(begin: 1, end: 1).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.8,
      child: const Padding(
        padding: EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Languages
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    AutoSizeText(
                      "Languages",
                      maxFontSize: 100,
                      minFontSize: 12,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    AutoSizeText(
                      "• Java\n• JavaScript\n• C#\n• Dart\n• C\n• ARM & RISC-V Assembly",
                      maxFontSize: 100,
                      minFontSize: 8,
                      maxLines: 6,
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            // Tools
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    AutoSizeText(
                      "Tools",
                      maxFontSize: 100,
                      minFontSize: 12,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    AutoSizeText(
                      "• Flutter\n• Unity\n• GitHub",
                      maxFontSize: 100,
                      minFontSize: 8,
                      maxLines: 6,
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            // Team Skills
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    AutoSizeText(
                      "Team Skills",
                      maxFontSize: 100,
                      minFontSize: 12,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    AutoSizeText(
                      "• Agile Development\n• Design\n• Communication",
                      maxFontSize: 100,
                      minFontSize: 8,
                      maxLines: 6,
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
