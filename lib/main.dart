import 'package:flutter/material.dart';
import 'package:flutter_project/examples/animated_header.dart';
import 'package:flutter_project/examples/grid.dart';
import 'package:flutter_project/examples/mix_slivers.dart';
import 'package:flutter_project/examples/reverse.dart';
import 'package:flutter_project/examples/side_header.dart';

import 'examples/list.dart';
import 'examples/not_sticky.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sticky Headers',
      home: _Home(),
    );
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Sticky Headers')),
      body: ListView(
        children: [
          _Item(text: 'List Example', builder: (_) => ListExample()),
          _Item(text: 'Grid Example', builder: (_) => GridExample()),
          _Item(text: 'Not Sticky Example', builder: (_) => NotStickyExample()),
          _Item(text: 'Side Header Example', builder: (_) => SideHeaderExample()),
          _Item(text: 'Animated Header Example', builder: (_) => AnimatedHeaderExample()),
          _Item(text: 'Reverser List Example', builder: (_) => ReverseExample()),
          _Item(text: 'Mixing other slivers', builder: (_) => MixSliversExample()),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String text;
  final WidgetBuilder builder;

  const _Item({Key? key, required this.text, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: InkWell(
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: builder)),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
