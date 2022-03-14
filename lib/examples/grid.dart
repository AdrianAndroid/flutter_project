import 'package:flutter/material.dart';
import 'package:flutter_project/common.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class GridExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Grid Example',
      slivers: [
        _StickyHeaderGrid(index: 0),
        _StickyHeaderGrid(index: 1),
        _StickyHeaderGrid(index: 2),
        _StickyHeaderGrid(index: 3),
      ],
    );
  }
}

class _StickyHeaderGrid extends StatelessWidget {
  final int index;

  const _StickyHeaderGrid({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Header(index: index),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => GridTile(
            child: Card(
              child: Container(color: Colors.green),
            ),
            footer: Container(
              color: Colors.white.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Grid tile #$index',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          childCount: 9,
        ),
      ),
    );
  }
}
