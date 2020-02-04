import 'package:flutter/material.dart';
import 'package:flutter_app/counter/counter.dart';
// import 'package:flutter_app/counter/counterEvent.dart';
// import 'package:flutter_app/counter/counter_bloc.dart';

import 'login/loginform.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Bloc',
      routes: <String, WidgetBuilder>{
        '/': (_) => Counter(),
        'practise2': (_) => LoginForm(),
      },
    );
  }
}
