import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).popUntil(ModalRoute.withName('/'));
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const HomeRoute()),
                // );
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
        Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                if (!(ModalRoute.of(context)?.settings.name == '/projects')) {
                  print(ModalRoute.of(context)?.settings.name);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProjectRoute()),
                  );
                }
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
      },
      title: 'Thomas Bioren',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 46, 53, 50),
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
      body: const MyHomePage(title: 'Projects'),
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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Row(
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
                      'Hi I\'m',
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
              child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_G0N9CN_iM6-kvF6qpZFibDRcR-t25KVQQA&usqp=CAU'),
            ),
          ],
        ),
      ),
    );
  }
}
