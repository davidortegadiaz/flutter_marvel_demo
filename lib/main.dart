import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marvel_demo/app.dart';
import 'package:flutter_marvel_demo/debug/my_bloc_observer.dart';
import 'package:flutter_marvel_demo/di/inyector.dart';
import 'package:colorize_lumberdash/colorize_lumberdash.dart';
import 'package:lumberdash/lumberdash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  putLumberdashToWork(withClients: [ColorizeLumberdash()]);
  inyect();
  runApp(App());
}
