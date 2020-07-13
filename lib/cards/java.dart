import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(
  MaterialApp(
    home: Java(),
  ),
);

class Java extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Python'),
      ),
      body: Center(
        child: MarkdownExample(),
      ),
    );
  }
}

const String _markdownData = '''
# Java technology
Java is a programming language and computing platform first released by Sun Microsystems in 1995. There are lots of applications and websites that will not work unless you have Java installed, and more are created every day. Java is fast, secure, and reliable. From laptops to datacenters, game consoles to scientific supercomputers, cell phones to the Internet, Java is everywhere!
## Following are the notable features of Java: -
- Object Oriented. In Java, everything is an Object. ...
- Platform Independent. 
- Simple. 
- Secure. 
- Architecture-neutral. 
- Portable. 
- Robust. 
- Multithreaded.
## Links
- You can use [hyperlinks](http://oyoads.in/learn-all-the-basics-of-java-and-object-oriented-programming/) to get __FREE__ Udemy certified course of java and Ooop
![Flutter logo](https://www.theta.co.nz/media/1965/javacover.png)


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