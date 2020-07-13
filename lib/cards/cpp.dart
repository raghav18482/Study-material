import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(
  MaterialApp(
    home: Cpp(),
  ),
);

class Cpp extends StatelessWidget {

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
# C++ Programming Language
C++ is an object oriented computer language created by notable computer scientist Bjorne Stroustrop as part of the evolution of the C family of languages.

Some call C++ “C with classes” because it introduces object oriented programming principles, including the use of defined classes, to the C programming language framework.

## C++ Language Features -
- Object-oriented: C++ is an object-oriented programming language. This means that the focus is on “objects” and manipulations around these objects. Information about how these manipulations work is abstracted out from the consumer of the object.
- Rich library support: Through C++ Standard Template Library (STL) many functions are available that help in quickly writing code. For instance, there are standard libraries for various containers like sets, maps, hash tables, etc.
- Speed: C++ is the preferred choice when latency is a critical metric. The compilation, as well as the execution time of a C++ program, is much faster than most other general purpose programming languages.
- Compiled: A C++ code has to be first compiled into low-level code and then executed, unlike interpreted programming languages where no compilation is needed.
- Pointer Support: C++ also supports pointers which are widely used in programming and are often not available in several programming languages.
## Links
- You can use [hyperlinks](http://oyoads.in/c-programming-step-by-step-from-beginner-to-ultimate-level/) to get __FREE__ Udemy certified C++ course

![Flutter logo](https://nareshit.com/wp-content/uploads/2018/09/C-plus-plus-online-training-nareshit.jpg)


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