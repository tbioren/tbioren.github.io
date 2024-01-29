import 'package:flutter/material.dart';
import 'package:website/elements/body_element.dart';
import 'package:website/sections/skills.dart';

import 'sections/about.dart';
import 'sections/projects.dart';
import 'sections/title_screen.dart';
import 'package:google_fonts/google_fonts.dart';

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
      title: 'Thomas Bioren',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: ListView(
          scrollDirection: Axis.vertical,
          children: const <Widget>[
            // Title Screen
            TitleScreen(),
            // About
            BodyElement("About Me", 'assets/data/aboutMe.txt', child: About()),
            // Skills
            BodyElement("My Skills", 'assets/data/skills.txt', child: Skills()),
            // Projects
            BodyElement("Projects I've Done", 'assets/data/projects.txt',
                child: Projects('assets/data/projects.json')),
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
      height: MediaQuery.of(context).size.height / 8,
      child: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            "",
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
