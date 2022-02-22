import 'package:flutter/material.dart';
import 'package:models1/galleria.dart';
import 'package:models1/routes.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key key, this.title}) : super(key: key);

  void _gotoAbout(BuildContext context) {
    Navigator.pushNamed(context, GalleryRouteGenerator.ABOUT);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Galleria()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          this._gotoAbout(context);
        },
        child: Text('About'),
      ),
    );
  }
}
