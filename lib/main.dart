import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      // '/': (context) => InAppWebViewExampleScreen(),
      // '/InAppBrowser': (context) => InAppBrowserExampleScreen(),
      // '/ChromeSafariBrowser': (context) => ChromeSafariBrowserExampleScreen(),
      // '/HeadlessInAppWebView': (context) => HeadlessInAppWebViewExampleScreen(),
    });
  }
}