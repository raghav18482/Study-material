import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(
  MaterialApp(
    home: Python(),
  ),
);

class Python extends StatelessWidget {

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
# What is Python? 
Python is an interpreted, object-oriented, high-level programming language with dynamic semantics. Its high-level built in data structures, combined with dynamic typing and dynamic binding, make it very attractive for Rapid Application Development, as well as for use as a scripting or glue language to connect existing components together. Python's simple, easy to learn syntax emphasizes readability and therefore reduces the cost of program maintenance. Python supports modules and packages, which encourages program modularity and code reuse. The Python interpreter and the extensive standard library are available in source or binary form without charge for all major platforms, and can be freely distributed.
## Applications -
- Web and Internet Development
- Database Access
- Desktop GUIs
- Scientific & Numeric
- Education
- Network Programming
- Software & Game Development
## Links
- You can use [hyperlinks](https://www.udemy.com/share/101qt6AEEfeF5RRXoB/) to get __FREE__ Udemy certified Python course
- You can use [hyperlinks](https://learn.datacamp.com/courses/intermediate-python-for-data-science) to get __FREE__ certificate of intro to python , it also provide online Terminal for practice 

![Flutter logo](https://svt.ac-creteil.fr/IMG/arton5557.jpg)


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