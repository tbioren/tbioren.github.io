import 'package:flutter/material.dart';
import 'package:website/bodyElement.dart';

import 'about.dart';
import 'skills.dart';
import 'titleScreen.dart';

void main() {
  runApp(const MyApp());
}

// TODO: Create custom "appear on load" widget
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: ListView(
          scrollDirection: Axis.vertical,
          children: const <Widget>[
            // Title Screen
            TitleScreen(),
            // About
            BodyElement("About Me", 'data/aboutMe.txt', child: About()),
            // Skillss
            BodyElement("My Skills", 'data/skills.txt', child: Skills()),
            // Footer
            Footer(),
          ],
        ),
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
