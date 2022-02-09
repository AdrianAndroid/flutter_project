import 'package:flutter/material.dart';

// Flutter实战*第二版
// https://www.woolha.com/tutorials/flutter-using-futurebuilder-widget-examples

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: Scaffold(
        appBar: AppBar(
          title: Text('多语言/国际化'),
          centerTitle: true,
          backgroundColor: Colors.green,
          brightness: Brightness.dark,
          //automaticallyImplyLeading: false,
          leading: Icon(Icons.add),
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
