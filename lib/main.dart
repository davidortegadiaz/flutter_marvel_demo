import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marvel_demo/di/inyector.dart';
import 'package:get/get.dart';
import 'package:colorize_lumberdash/colorize_lumberdash.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:flutter_marvel_demo/routes/route_names.dart';
import 'package:flutter_marvel_demo/routes/routes.dart';

void main() {
  Bloc.observer = MyBlocObserver() as BlocObserver;
  putLumberdashToWork(withClients: [ColorizeLumberdash()]);
  inyect();
  runApp(App());
}

class MyBlocObserver {}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Marvel Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteNames.characterListPage,
      getPages: getPages(),
      //home: CharacterListPage(),
    );
  }
}

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
