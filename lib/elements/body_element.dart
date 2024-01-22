import 'package:auto_size_text/auto_size_text.dart';
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
  late AnimationController _controller;

  String _title = "";
  String _bodyParagraph = "";
  Widget _child = Container();
  bool _isAnimationPlayed = false;

  @override
  void initState() {
    super.initState();
    // Set up the animation controller for fading widgets in
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    // Look up Dart's cascade notation for the ".."
    // The addListner() has to call setState() in order to update the state
    animation = Tween<double>(begin: 0, end: 1).animate(_controller)
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleVisibilityChange(VisibilityInfo info) {
    if (info.visibleFraction > 0.5 && !_isAnimationPlayed) {
      _controller.forward();
      setState(() {
        _isAnimationPlayed = true;
        debugPrint("updatae animation");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          // height: MediaQuery.of(context).size.height * 0.4,
          child: AutoSizeText(
            _title,
            maxFontSize: 100,
            minFontSize: 24,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          // height: MediaQuery.of(context).size.height * 0.4,
          child: AutoSizeText(
            _bodyParagraph,
            textAlign: TextAlign.start,
            maxFontSize: 100,
            minFontSize: 12,
            maxLines: 4,
            style: const TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ),
        _child,
      ],
    );
  }
}
