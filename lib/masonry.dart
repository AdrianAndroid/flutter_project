import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project/common.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MasonryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MasonryPageState();
}

class _MasonryPageState extends State<MasonryPage> {
  final rnd = Random();
  late List<int> extents;
  int crossAxisCount = 4;

  @override
  void initState() {
    super.initState();
    extents = List<int>.generate(10000, (int index) => rnd.nextInt(5) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        final height = extents[index] * 100;
        return ImageTile(
          index: index,
          width: 100,
          height: height,
        );
      },
      itemCount: extents.length,
    );
  }
}