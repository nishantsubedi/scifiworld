import 'package:flutter/material.dart';
import 'package:scifiworld/pages/welcome/welcomePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Scifi World',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WelcomePage());
  }
}
