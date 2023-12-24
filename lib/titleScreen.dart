import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class TitleScreen extends StatefulWidget {
  @override
  State<TitleScreen> createState() => _TitleScreenState();

  const TitleScreen({
    super.key,
  });
}

// TODO: Stop it from disappearing
class _TitleScreenState extends State<TitleScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
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
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VisibilityDetector(
            key: const Key("Title Screen"),
            onVisibilityChanged: (VisibilityInfo info) {
              controller.forward();
            },
            child: Opacity(
              opacity: animation.value,
              child: Text(
                "Thomas Bioren",
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width / 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
