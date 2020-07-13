import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(
  MaterialApp(
    home: Mark_down(),
  ),
);

class Mark_down extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Flutter'),
      ),
      body: Center(
        child: MarkdownExample(),
      ),
    );
  }
}


const String _markdownData = '''
# Flutter
Flutter is an app SDK for building high-performance, high-fidelity apps for iOS, Android, web (beta), and desktop (technical preview) from a single codebase. The goal is to enable developers to deliver high-performance apps that feel natural on different platforms
## About flutter -
- It is actually native (and not React Native native).
- It doesn’t require a JavaScript bridge to talk to OEM widgets.
- It is the default programming language for all the apps for Fuchsia OS.
- More and more startups are looking into it.
- It is being supported and promoted by Google XD
## Links
You can use [hyperlinks](https://www.appbrewery.co/courses/enrolled/851555) to get __FREE__ flutter course

![Flutter logo](https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png)

## Code blocks
Formatted Dart code looks really pretty too:
```
void main() {
  runApp(new MaterialApp(
    home: new Scaffold(
      body: new Markdown(data: markdownData)
    )
  ));
}
```
Enjoy!
''';

class MarkdownExample extends StatelessWidget {
  const MarkdownExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onTapLink(href) async {
      if (await canLaunch(href)) {
        launch(href);
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Wrong address: $href'),
          ),
        );
      }
    }
    return Scrollbar(
      child: Markdown(
        data: _markdownData,
        onTapLink: _onTapLink,
      ),
    );
  }
}