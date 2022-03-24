import 'package:flutter/material.dart';
import 'package:flutter_project/common.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:collection/collection.dart';

class StaggeredPage extends StatelessWidget {
  // static List<GridTile> tiles = [
  //   GridTile(4, 1),
  //   GridTile(2, 1),
  //   GridTile(1, 2),
  //   GridTile(1, 1),
  //   GridTile(2, 2),
  //   GridTile(1, 2),
  //   GridTile(1, 1),
  //   GridTile(3, 1),
  //   GridTile(1, 1),
  //   GridTile(4, 1),
  // ];

  static List<GridTile> tiles = [
    GridTile(2, 1),
    GridTile(1, 1),
    GridTile(1, 3),
    GridTile(1, 1),
    GridTile(1, 1),
    GridTile(1, 1),
    GridTile(1, 1),
    GridTile(1, 1),
    GridTile(1, 1),
    GridTile(1, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: [
          ...tiles.mapIndexed(
            (index, tile) => StaggeredGridTile.fit(
              crossAxisCellCount: tile.crossAxisCount,
              // mainAxisCellCount: tile.mainAxisCount,
              child: ImageTile(
                index: index,
                width: tile.crossAxisCount * 100,
                height: index==0? 50 : tile.mainAxisCount * 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GridTile {
  GridTile(this.crossAxisCount, this.mainAxisCount);

  final int crossAxisCount;
  final int mainAxisCount;
}
