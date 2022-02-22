import 'package:flutter/material.dart';
import 'package:models1/gallery_home.dart';
import 'package:models1/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Modules',
      theme: ThemeData(primaryColor: Colors.blue),
      home: MyHomePage(title: 'Module: gallery'),
      initialRoute: GalleryRouteGenerator.ROUTE,
      onGenerateRoute: GalleryRouteGenerator.generateRoute,
    );
  }
}
