import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            // Footer
            Footer(),
          ],
        ),
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
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
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
  double _aboutOpacity = 0;

  // TODO: change this to use AnimationController and ScrollController
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), () {
      _aboutOpacity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _aboutOpacity,
      duration: const Duration(milliseconds: 500),
      child: Container(
        color: const Color.fromARGB(255, 255, 255, 250),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
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
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width / 75,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
