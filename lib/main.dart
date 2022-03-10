import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('AppBar')),
        body: Column(
          children: [
            _getVisibility(),
            SizedBox(height: 10),
            _getVisibility(visibility: true),
            SizedBox(height: 10),
            _getVisibility(),
          ],
        ),
      ),
    );
  }

  _getVisibility({bool visibility = false}) => Visibility(
        visible: visibility,
        replacement: Container(
          height: 50,
          width: 50,
          color: Colors.red,
        ),
        child: Container(
          height: 100,
          width: 100,
          color: Colors.blue,
        ),
      );
}
