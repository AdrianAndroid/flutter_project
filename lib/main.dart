import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() => runApp(
      MaterialApp(
        title: 'VisibilityDetector',
        home: Scaffold(
          appBar: AppBar(title: Text('VisibilityDetector')),
          body: Container(child: MyApp()),
        ),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.blue,
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(width: 100, height: 100, color: Colors.green),
              Container(width: 100, height: 100, color: Colors.green),
              Container(width: 100, height: 100, color: Colors.green),
              Container(width: 100, height: 100, color: Colors.green),
            ],
          ),
          SizedBox(height: 100),
          _visibilityDetector(
              ValueKey("DISPLAY"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(width: 100, height: 100, color: Colors.green),
                  Container(width: 100, height: 100, color: Colors.green),
                  Container(width: 100, height: 100, color: Colors.green),
                  Container(width: 100, height: 100, color: Colors.green),
                ],
              )),
          Container(
            color: Colors.blue,
            height: 1200,
          ),
        ],
      ),
    );
  }

  Widget _visibilityDetector(Key key, Widget child) {
    return VisibilityDetector(
      key: ValueKey(child.hashCode),
      child: child,
      onVisibilityChanged: (VisibilityInfo info) {
        debugPrint([
          'info.key=>${(info.key as ValueKey).value}',
          'info.visibleBounds=>${info.visibleBounds}',
          'info.visibleFraction=>${info.visibleFraction}',
          'info.size=>${info.size}'
        ].join(', '));
      },
    );
  }
}
