import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';

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
    // TODO: change beginning to 0 and add VisibilityDetector to reinstate animation
    animation = Tween<double>(begin: 1, end: 1).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  Future<void> launch(String url, {bool isNewTab = true}) async {
    await launchUrl(
      Uri.parse(url),
      webOnlyWindowName: isNewTab ? '_blank' : '_self',
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width > 800
          ? 700
          : MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width > 800
                ? 700
                : MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
            child: const AutoSizeText(
              "Thomas Bioren",
              minFontSize: 16,
              maxFontSize: 80,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 64,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton(
                  onPressed: () {
                    launch('https://github.com/tbioren', isNewTab: true);
                  },
                  icon: SvgPicture.asset(
                    'assets/images/githubLogo.svg',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton(
                  onPressed: () {
                    launch(
                        'https://www.linkedin.com/in/thomas-bioren-7124b4254/',
                        isNewTab: true);
                  },
                  icon: SvgPicture.asset(
                    'assets/images/linkedinLogo.svg',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton(
                  onPressed: () {
                    launch('mailto:biorentr@rose-hulman.edu', isNewTab: true);
                  },
                  icon: SvgPicture.asset(
                    'assets/images/emailLogo.svg',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
