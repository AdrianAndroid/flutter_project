import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AndroidVirtualDisplayPluginView extends StatelessWidget {
  const AndroidVirtualDisplayPluginView();

  @override
  Widget build(BuildContext context) {
    final String viewType = 'virtual-display-plugin-view';
    final Map<String, dynamic> creationParams = <String, dynamic>{};

    return AndroidView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
