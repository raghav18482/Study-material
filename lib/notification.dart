import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: ListViewBuilderExample(),
  ),
);

class ListViewBuilderExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Notification'),
        ),
        body: Center(
          child: ListViewBuilder(),
        ),
    );
  }
}


class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numItems = 20;
    final _biggerFont = const TextStyle(fontSize: 18.0);

    Widget _buildRow(int idx) {
      return ListTile(
        leading: CircleAvatar(
          child: Text('$idx'),
        ),
        title: Text(
          'Item $idx',
          style: _biggerFont,
        ),
        trailing: Icon(Icons.dashboard),
      );
    }

    return ListView.builder(
      itemCount: numItems * 2,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext context, int i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2 + 1;
        return _buildRow(index);
      },
    );
  }
}