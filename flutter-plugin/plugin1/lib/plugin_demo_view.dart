import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:plugin1/ios_ui_kit_view_plugin.dart';

class PluginDemoView extends StatelessWidget {
  const PluginDemoView();

  @override
  Widget build(BuildContext context) {
    return Column(children: buildChildren());
  }

  List<Widget> buildChildren() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return [
          Text('AndroidVirtualDisplayPluginView'),
        ];
      case TargetPlatform.iOS:
        return [
          Text('IOSUikitView'),
          SizedBox(child: Center(child: IOSUiKitView()), height: 200),
        ];
      default:
        return [];
    }
  }
}
