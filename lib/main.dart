import 'package:fashion_link/modules/modules.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fashion Link',
      theme: ThemeData(
        fontFamily: 'QuickSand',
        primarySwatch: Colors.indigo,
        accentColor: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}

