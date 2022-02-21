import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:plugin1/android_hybrid_composition_plugin.dart';
import 'package:plugin1/android_virtual_display_plugin.dart';
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
          SizedBox(
            height: 200,
            child: Center(
              child: AndroidVirtualDisplayPluginView(),
            ),
          ),
          Text('AndroidHybridCompositionPluginView'),
          SizedBox(
            height: 200,
            child: Center(child: AndroidHybridCompositionPluginView()),
          ),
          SizedBox(height: 10),
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
