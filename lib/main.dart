import 'package:flutter/material.dart';
import 'package:hostel/list.dart';
import 'package:hostel/notification.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('User Name'),
      accountEmail: Text('user.name@email.com'),
      currentAccountPicture: CircleAvatar(
        child: FlutterLogo(size: 42.0),
        backgroundColor: Colors.white,
      ),
      otherAccountsPictures: <Widget>[
        CircleAvatar(
          child: Text('A'),
          backgroundColor: Colors.white,
        ),
        CircleAvatar(
          child: Text('B'),
          backgroundColor: Colors.white,
        )
      ],
    );
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title: Text('To page 1'),
          onTap: () => Navigator.of(context).push(_NewPage(1)),
        ),
        ListTile(
          title: Text('To page 2'),
          onTap: () => Navigator.of(context).push(_NewPage(2)),
        ),
        ListTile(
          title: Text('notification'),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListViewBuilderExample()),
            );
          },
        ),
      ],
    );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('hostel'),
        ),
        body: Center(
          child: CardExample(),
        ),
        drawer: Drawer(
          child: drawerItems,
        ));
  }
}



class _NewPage extends MaterialPageRoute<Null> {
  _NewPage(int id)
      : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page $id'),
        elevation: 1.0,
      ),
      body: Center(
        child: Text('Page $id'),
      ),
    );
  });
}


