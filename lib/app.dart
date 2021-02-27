import 'package:flutter/material.dart';
import 'package:flutter_marvel_demo/routes/route_names.dart';
import 'package:flutter_marvel_demo/routes/routes.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Marvel Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: RouteNames.characterListPage,
      getPages: getPages(),
    );
  }
}
