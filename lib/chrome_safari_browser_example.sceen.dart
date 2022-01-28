import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'main.dart';

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  @override
  void onOpened() {
    super.onOpened();
    print("ChromeSafari browser opened");
  }

  @override
  void onCompletedInitialLoad() {
    super.onCompletedInitialLoad();
    print("ChromeSafari browser initial load completed");
  }

  @override
  void onClosed() {
    super.onClosed();
    print("ChromeSafari browser closed");
  }
}

class ChromeSafariBrowserExampleScreen extends StatefulWidget {
  final ChromeSafariBrowser browser = MyChromeSafariBrowser();

  @override
  State<StatefulWidget> createState() =>
      _ChromeSafariBrowserExampleScreenState();
}

class _ChromeSafariBrowserExampleScreenState
    extends State<ChromeSafariBrowserExampleScreen> {
  @override
  void initState() {
    widget.browser.addMenuItem(
      ChromeSafariBrowserMenuItem(
        id: 1,
        label: 'Custom item menu 1 clicked!',
        action: (url, title) {
          print('Custom item menu 1 clicked!');
          print(url);
          print(title);
        },
      ),
    );
    widget.browser.addMenuItem(ChromeSafariBrowserMenuItem(
      id: 2,
      label: 'Cusstom item menu 2 clicked!',
      action: (url, title) {
        print('Custom item menu 2');
        print(url);
        print(title);
      },
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ChromeSafariBrowser')),
      drawer: myDrawer(context: context),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await widget.browser.open(
              url: Uri.parse("https://flutter.dev/"),
              options: ChromeSafariBrowserClassOptions(
                android: AndroidChromeCustomTabsOptions(
                  addDefaultShareMenuItem: false,
                  keepAliveEnabled: true,
                ),
                ios: IOSSafariOptions(
                    dismissButtonStyle: IOSSafariDismissButtonStyle.CLOSE,
                    presentationStyle:
                        IOSUIModalPresentationStyle.OVER_FULL_SCREEN),
              ),
            );
          },
          child: Text("Open Chrome Safari Browser"),
        ),
      ),
    );
  }
}
