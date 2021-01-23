
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hiapp/samplepage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HiPals Assignment',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SamplePage(),
    );
  }
}

