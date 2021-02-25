import 'package:flutter/material.dart';

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: Center(child: Text('Press the button to fetch characters!!')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Fetch',
        child: Icon(Icons.download_outlined),
      ),
    );
  }
}
