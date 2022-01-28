import 'dart:collection';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'main.dart';

class MyInAppBrowser extends InAppBrowser {
  MyInAppBrowser({
    int? windowId,
    UnmodifiableListView<UserScript>? initialUserScripts,
  }) : super(windowId: windowId, initialUserScripts: initialUserScripts);

  @override
  void onBrowserCreated() {
    super.onBrowserCreated();
    print("Browser Created!");
  }

  @override
  void onLoadStart(Uri? url) {
    super.onLoadStart(url);
    print("Started $url");
  }

  @override
  void onLoadStop(Uri? url) {
    super.onLoadStop(url);
    pullToRefreshController?.endRefreshing();
    print("Stopped $url");
  }

  @override
  void onLoadError(Uri? url, int code, String message) {
    super.onLoadError(url, code, message);
    pullToRefreshController?.endRefreshing();
    print("Can't load $url.. Error:$message");
  }

  @override
  void onProgressChanged(int progress) {
    super.onProgressChanged(progress);
    if (progress == 100) {
      pullToRefreshController?.endRefreshing();
    }
    print("Progress: $progress");
  }

  @override
  void onExit() {
    super.onExit();
    print("Browser closed!");
  }

  @override
  Future<NavigationActionPolicy?>? shouldOverrideUrlLoading(
      NavigationAction navigationAction) {
    print("Override ${navigationAction.request.url}");
    return super.shouldOverrideUrlLoading(navigationAction);
  }

  @override
  void onLoadResource(LoadedResource resource) {
    super.onLoadResource(resource);
    print("Started at: " +
        resource.startTime.toString() +
        "ms ----> duration: " +
        resource.duration.toString() +
        "ms " +
        (resource.url ?? '').toString());
  }

  @override
  void onConsoleMessage(ConsoleMessage consoleMessage) {
    super.onConsoleMessage(consoleMessage);
    print("""
    console output:
      message : ${consoleMessage.message}
      messageLevel: ${consoleMessage.messageLevel.toValue()}
    """);
  }
}

class InAppBrowserExampleScreen extends StatefulWidget {
  final MyInAppBrowser browser = new MyInAppBrowser();

  @override
  State<StatefulWidget> createState() => _InAppBrowserExampleScreenState();
}

class _InAppBrowserExampleScreenState extends State<InAppBrowserExampleScreen> {
  late PullToRefreshController pullToRefreshController;

  @override
  void initState() {
    super.initState();
    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.black,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          widget.browser.webViewController.reload();
        } else if (Platform.isIOS) {
          widget.browser.webViewController.loadUrl(
            urlRequest: URLRequest(
              url: await widget.browser.webViewController.getUrl(),
            ),
          );
        }
      },
    );
    widget.browser.pullToRefreshController = pullToRefreshController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('InAppBrowser')),
      drawer: myDrawer(context: context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await widget.browser.openUrlRequest(
                  urlRequest: URLRequest(url: Uri.parse("https://flutter.dev")),
                  options: InAppBrowserClassOptions(
                    inAppWebViewGroupOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                        useShouldOverrideUrlLoading: true,
                        useOnLoadResource: true,
                      ),
                    ),
                  ),
                );
              },
              child: Text("Open In-App Browser"),
            ),
            Container(height: 40),
            ElevatedButton(
              onPressed: () async {
                await InAppBrowser.openWithSystemBrowser(
                    url: Uri.parse("https://flutter.dev/"));
              },
              child: Text('Open System Broser'),
            ),
          ],
        ),
      ),
    );
  }
}
