import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'chrome_safari_browser_example.sceen.dart';
import 'const.dart';
import 'headless_in_app_webview.screen.dart';
import 'in_app_broser_example.screen.dart';
import 'in_app_webview_example.screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Permission.camera.request();
  //await Permission.microphone.request();
  //await Permission.storage.request();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

    var swAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
    var swInterceptAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

    if (swAvailable && swInterceptAvailable) {
      AndroidServiceWorkerController serviceWorkerController =
          AndroidServiceWorkerController.instance();

      serviceWorkerController.serviceWorkerClient = AndroidServiceWorkerClient(
        shouldInterceptRequest: (request) async {
          print(request);
          return null;
        },
      );
    }
  }

  runApp(MyApp());
}

Drawer myDrawer({required BuildContext context}) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          child: Text('flutter_inappbrowser example'),
          decoration: BoxDecoration(color: Colors.blue),
        ),
        ListTile(
          title: Text('InAppBrowser'),
          onTap: () {
            Navigator.pushReplacementNamed(context, Const.InAppBrowser);
          },
        ),
        ListTile(
          title: Text('ChromeSafariBrowser'),
          onTap: () {
            Navigator.pushReplacementNamed(context, Const.ChromeSafariBrowser);
          },
        ),
        ListTile(
          title: Text('InAppWebView'),
          onTap: () {
            Navigator.pushReplacementNamed(context, Const.Route);
          },
        ),
        ListTile(
          title: Text('HeadlessInAppWebView'),
          onTap: () {
            Navigator.pushReplacementNamed(context, Const.HeadlessInAppWebView);
          },
        ),
      ],
    ),
  );
}

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
    return MaterialApp(
      initialRoute: Const.Route,
      routes: {
        Const.Route: (context) => InAppWebViewExampleScreen(),
        Const.InAppBrowser: (context) => InAppBrowserExampleScreen(),
        Const.ChromeSafariBrowser: (context) =>
            ChromeSafariBrowserExampleScreen(),
        Const.HeadlessInAppWebView: (context) =>
            HeadlessInAppWebViewExampleScreen(),
      },
    );
  }
}
