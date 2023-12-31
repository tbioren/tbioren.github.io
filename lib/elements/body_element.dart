import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Body element for website
class BodyElement extends StatefulWidget {
  final String title;
  final String paragraphFile;
  final Widget? child;
  const BodyElement(this.title, this.paragraphFile, {this.child, super.key});
  @override
  State<BodyElement> createState() =>
      // TODO: Figure out what the following line means/does
      // ignore: no_logic_in_create_state
      _BodyElementState(title, paragraphFile, child);
}

class _BodyElementState extends State<BodyElement>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  String _title = "";
  String _bodyParagraph = "";
  Widget _child = Container();

  @override
  void initState() {
    super.initState();
    // Set up the animation controller for fading widgets in
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    // Look up Dart's cascade notation for the ".."
    // The addListner() has to call setState() in order to update the state
    animation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    loadText();
  }

  Future<void> loadText() async {
    String file = await rootBundle.loadString(_bodyParagraph);
    setState(() {
      _bodyParagraph = file;
    });
  }

  _BodyElementState(String title, String bodyParagraph, Widget? child) {
    _title = title;
    _bodyParagraph = bodyParagraph;
    _child = child ?? Container();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          VisibilityDetector(
            key: const Key("BodyElement"),
            onVisibilityChanged: (VisibilityInfo info) {
              controller.forward();
            },
            child: Opacity(
              opacity: animation.value,
              child: Text(
                _title,
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width / 50,
                ),
              ),
            ),
          ),
          Opacity(
            opacity: animation.value,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                _bodyParagraph,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  fontSize: MediaQuery.of(context).size.width / 75,
                ),
              ),
            ),
          ),
          _child,
        ],
      ),
    );
  }
}
