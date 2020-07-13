import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(
  MaterialApp(
    home: Webdev(),
  ),
);

class Webdev extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Web Development Kit'),
      ),
      body: Center(
        child: MarkdownExample(),
      ),
    );
  }
}

const String _markdownData = '''
# Web Development
Web development is the building and maintenance of websites; it's the work that happens behind the scenes to make a website look great, work fast and perform well with a seamless user experience. Web developers, or 'devs', do this by using a variety of coding languages
## basics of Web development -
- Learn the Basics. Every Web Developer must have a basic understanding of HTML, CSS, and JavaScript.
- Dig Deeper. When you feel comfortable with HTML and CSS, it is time to dig deeper. ...
- Choose Frameworks. Now it is time to look at some Frameworks. ...
- Back-End Roadmaps. Fullstack.
## Links
You can use [hyperlinks](https://www.udemy.com/share/10275AAEEfeF5RRXoB/) to get __FREE__ Udemy certified course

![Flutter logo](https://journocode.com/wp-content/uploads/2016/06/htmlCssJS-1140x515.jpg)


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