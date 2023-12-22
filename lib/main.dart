import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<MyApp> {
  String _aboutFile = '';

  @override
  void initState() {
    super.initState();
    loadAssets();
  }

  Future<void> loadAssets() async {
    String fileText = await rootBundle.loadString('data/aboutMe.txt');
    setState(() {
      _aboutFile = fileText;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            // Title Screen
            TitleScreen(),
            // About
            About(aboutFile: _aboutFile),
            // Skills
            Skills(),
            // Footer
            Footer(),
          ],
        ),
      ),
    );
  }
}

class Skills extends StatefulWidget {
  const Skills({
    super.key,
  });

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "My Skills",
            style: TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width / 50,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Languages
              Padding(
                padding: const EdgeInsets.all(16.0),
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
                      "C\nC++\nJavascript\nDart\nPython\nJava\nC#",
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
                padding: const EdgeInsets.all(16.0),
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
                      "Flutter\nGitHub",
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
                padding: const EdgeInsets.all(16.0),
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
        ],
      ),
    );
  }
}

class TitleScreen extends StatefulWidget {
  @override
  State<TitleScreen> createState() => _TitleScreenState();

  const TitleScreen({
    super.key,
  });
}

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

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 5,
      child: Container(
        color: const Color.fromARGB(255, 240, 240, 240),
        child: Center(
          child: Text(
            "Placeholder Footer",
            style: TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width / 50,
            ),
          ),
        ),
      ),
    );
  }
}

class About extends StatefulWidget {
  const About({
    super.key,
    required String aboutFile,
  }) : _aboutFile = aboutFile;

  final String _aboutFile;
  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> with SingleTickerProviderStateMixin {
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
    // TODO: Find out what key does
    // VisibilityDetector detects when the widget is visible and calls
    // controller.forward()
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: VisibilityDetector(
            key: const Key("About"),
            onVisibilityChanged: (VisibilityInfo info) {
              controller.forward();
            },
            child: Opacity(
              opacity: animation.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "About Me",
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width / 50,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      widget._aboutFile,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal,
                        fontSize: MediaQuery.of(context).size.width / 75,
                      ),
                    ),
                  ),
                  const AboutSpecifics(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AboutSpecifics extends StatefulWidget {
  const AboutSpecifics({
    super.key,
  });

  @override
  State<AboutSpecifics> createState() => _AboutSpecificsState();
}

class _AboutSpecificsState extends State<AboutSpecifics>
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
    return VisibilityDetector(
      key: const Key("key0"),
      onVisibilityChanged: (VisibilityInfo info) {
        controller.forward();
      },
      child: Opacity(
        opacity: animation.value,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Education
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Education",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width / 80,
                        ),
                      ),
                      Text(
                        "Ballard High School\nUniversity of Washington (non-matriculated)\nRose-Hulman Institute of Technology",
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
                // Achievements
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Achievements",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width / 80,
                        ),
                      ),
                      Text(
                        "Lorem\nIpsum\nDolor",
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
                // Activities
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Activities",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width / 80,
                        ),
                      ),
                      Text(
                        "Rose-Hulman SmallSat Club Member\nRose-Hulman Swim Team Member\nEvolvable Hardware Research\nStudent Pilot",
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
