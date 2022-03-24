import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project/sample/custom_scrollview_demo.dart';
import 'package:flutter_project/sample/random_sized_demo.dart';
import 'package:flutter_project/sample/variable_sized_demo.dart';
import 'package:flutter_project/src/rendering/sliver_waterfall_flow.dart';
import 'package:flutter_project/src/widgets/sliver.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CustomScrollviewDemo(),
    );
  }
}

class CustomScrollviewDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomScrollviewDemoState();
}

class _CustomScrollviewDemoState extends State<CustomScrollviewDemo> {
  List<Color> colors = <Color>[];
  int crossAxisCount = 2;
  double crossAxisSpacing = 5.0;
  double mainAxisSpacing = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverToBoxAdapter(
          //   child: Container(
          //     height: 200,
          //     color: Colors.red,
          //     alignment: Alignment.center,
          //     child: const Text(
          //       'I\'m other slivers',
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 20,
          //       ),
          //     ),
          //   ),
          // ),
          SliverWaterfallFlow(
            gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: crossAxisSpacing,
              mainAxisSpacing: mainAxisSpacing,
              collectGarbage: (List<int> garbages) {
                print('collect garbage : $garbages');
              },
              viewportBuilder: (int firstIndex, int lastIndex) {
                print('viewport : [$firstIndex, $lastIndex]');
              },
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final Color color = getRandomColor(index);
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: getRandomColor(index),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '$index',
                    style: TextStyle(
                      color: color.computeLuminance() < 0.5
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  height: ((index % 3) + 1) * 100.0,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            crossAxisCount++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Color getRandomColor(int index) {
    if (index >= colors.length) {
      colors.add(Color.fromARGB(255, Random.secure().nextInt(255),
          Random.secure().nextInt(255), Random.secure().nextInt(255)));
    }

    return colors[index];
  }
}
