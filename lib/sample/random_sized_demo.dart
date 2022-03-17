import 'dart:math';

import 'package:flutter/material.dart';

import '../waterfall_flow.dart';

class RandomSizeDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RandomSizeDemoState();
}

class _RandomSizeDemoState extends State<RandomSizeDemo> {
  List<Color> colors = <Color>[];
  int crossAxisCount = 4;
  double crossAxisSpacing = 5.0;
  double mainAxisSpacing = 5.0;
  TextDirection textDirection = TextDirection.ltr;
  int length = 100;
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: textDirection,
        child: WaterfallFlow.builder(
          padding: const EdgeInsets.all(5.0),
          gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing,
          ),
          itemBuilder: (BuildContext c, int index) {
            final Color color = getRandomColor(index);
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: getRandomColor(index),
              ),
              alignment: Alignment.center,
              child: Text(
                '$index ' + 'TestString' * 10 * (index % 3 + 1),
                style: TextStyle(
                    color: color.computeLuminance() < 0.5
                        ? Colors.white
                        : Colors.black),
              ),
            );
          },
          itemCount: length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            crossAxisCount++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Color getRandomColor(int index) {
    if (index >= colors.length) {
      colors.add(
        Color.fromARGB(
          255,
          Random.secure().nextInt(255),
          Random.secure().nextInt(255),
          Random.secure().nextInt(255),
        ),
      );
    }
    return colors[index];
  }
}
