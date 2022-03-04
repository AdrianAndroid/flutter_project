import 'package:flutter/cupertino.dart';
import 'package:flutter_project/common.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class QuiltedPage extends StatelessWidget {
  static const List<QuiltedGridTile> pattern = [
    QuiltedGridTile(2, 2),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 2),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: pattern,
      ),
      childrenDelegate: SliverChildBuilderDelegate((context, index) {
        final tile = pattern[index % pattern.length];
        return ImageTile(
          index: index,
          width: tile.crossAxisCount * 100,
          height: tile.mainAxisCount * 100,
        );
      }),
    );
  }
}
