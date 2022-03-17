import 'package:flutter/material.dart';
import 'package:flutter_project/sample/custom_scrollview_demo.dart';
import 'package:flutter_project/sample/random_sized_demo.dart';
import 'package:flutter_project/sample/variable_sized_demo.dart';

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
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AppBar')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return RandomSizeDemo();
                }));
              },
              icon: Icon(Icons.message),
              label: Text('RandomSizeDemo'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return CustomScrollViewDemo();
                }));
              },
              icon: Icon(Icons.message),
              label: Text('CustomScrollViewDemo'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return KnownSizedDemo();
                }));
              },
              icon: Icon(Icons.message),
              label: Text('KnownSizedDemo'),
            ),
          ],
        ),
      ),
    );
  }
}
