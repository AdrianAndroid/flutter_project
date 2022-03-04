import 'package:flutter/material.dart';
import 'package:flutter_project/common.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StairedPage extends StatelessWidget {
  static List<StairedGridTile> pattern = [
    StairedGridTile(0.5, 1),
    StairedGridTile(0.5, 3 / 4),
    StairedGridTile(1.0, 10 / 4),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: GridView.custom(
        scrollDirection: Axis.vertical,
        gridDelegate: SliverStairedGridDelegate(
          mainAxisSpacing: 24,
          crossAxisSpacing: 48,
          startCrossAxisDirectionReversed: true,
          pattern: pattern,
        ),
        childrenDelegate: SliverChildBuilderDelegate((context, index) {
          final tile = pattern[index % pattern.length];
          return ImageTile(
            index: index,
            width: (tile.aspectRatio * 200).ceil(),
            height: 200,
          );
        }),
      ),
    );
  }
}
