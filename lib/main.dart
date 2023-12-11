import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static AppBar topMenu(var boldNum, BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 46 + 20, 53 + 20, 50 + 20),
      title: const Text(
        'Thomas Bioren',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: <Widget>[
        // Home hyperlink
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).popUntil(ModalRoute.withName('/'));
              },
              child: Text(
                'Home',
                style: TextStyle(
                  fontWeight:
                      boldNum == 0 ? FontWeight.bold : FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        // Projects hyperlink
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProjectRoute()),
                );
              },
              child: Text(
                'Projects',
                style: TextStyle(
                  fontWeight:
                      boldNum == 1 ? FontWeight.bold : FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        // Contact hyperlink
        Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactRoute()),
                );
              },
              child: Text(
                'Contact',
                style: TextStyle(
                  fontWeight:
                      boldNum == 2 ? FontWeight.bold : FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeRoute(),
        '/projects': (context) => const ProjectRoute(),
        '/contact': (context) => const ContactRoute(),
      },
      title: 'Thomas Bioren',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 46, 53, 50),
        splashColor: Colors.transparent,
      ),
    );
  }
}

class HomeRoute extends StatelessWidget {
  const HomeRoute({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyApp.topMenu(0, context),
      body: const MyHomePage(title: 'Thomas Bioren'),
    );
  }
}

class ProjectRoute extends StatelessWidget {
  const ProjectRoute({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyApp.topMenu(1, context),
      body: const ProjectsPage(),
    );
  }
}

class ContactRoute extends StatelessWidget {
  const ContactRoute({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyApp.topMenu(2, context),
      body: const ContactPage(),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  get followLink => null;

  @override
  Widget build(BuildContext context) {
    bool wideScreen =
        MediaQuery.sizeOf(context).width > MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Align(
        alignment: Alignment.center,
        child: Flex(
          direction: wideScreen ? Axis.horizontal : Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            // GitHub Link
            Expanded(
              child: InkWell(
                onTap: () {
                  final url = Uri.parse('https://www.github.com/tbioren');
                  launchUrl(url);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/githubLogo.png',
                      width: 128,
                      height: 128,
                    ),
                    const AutoSizeText(
                      '@tbioren',
                      textAlign: TextAlign.center,
                      textScaleFactor: 2,
                      style: TextStyle(color: Colors.lightBlueAccent),
                    ),
                  ],
                ),
              ),
            ),

            // LinkedIn Link
            Expanded(
              child: InkWell(
                onTap: () {
                  final url = Uri.parse(
                      'https://www.linkedin.com/in/thomas-bioren-7124b4254/');
                  launchUrl(url);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/linkedinLogo.png',
                      width: 128,
                      height: 128,
                    ),
                    const AutoSizeText(
                      'Thomas Bioren',
                      textAlign: TextAlign.center,
                      textScaleFactor: 2,
                      style: TextStyle(color: Colors.lightBlueAccent),
                    ),
                  ],
                ),
              ),
            ),

            // Email Link
            Expanded(
              child: InkWell(
                onTap: () {
                  final url = Uri.parse('mailto:biorentr@rose-hulman.edu');
                  launchUrl(url);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/emailLogo.svg',
                      width: 128,
                      height: 128,
                    ),
                    const AutoSizeText(
                      'biorentr@rose-hulman.edu',
                      textAlign: TextAlign.center,
                      textScaleFactor: 2,
                      style: TextStyle(color: Colors.lightBlueAccent),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AutoSizeText(
                'Projects I\'ve Done:',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    bool wideScreen =
        MediaQuery.sizeOf(context).width > MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Flex(
          direction: wideScreen ? Axis.horizontal : Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: AutoSizeText(
                      'Hi, I\'m',
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: AutoSizeText(
                      'Thomas Bioren',
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Image.asset('assets/images/placeholderPhoto.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
