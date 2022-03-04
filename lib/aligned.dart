import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project/common.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AlignedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AlignedPageState();
}

class _AlignedPageState extends State<AlignedPage> {
  final rnd = Random();
  late List<int> extents;
  int crossAxisCount = 2;

  @override
  void initState() {
    super.initState();
    extents = List<int>.generate(10000, (int index) => rnd.nextInt(7) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        final height = extents[index] * 40;
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
