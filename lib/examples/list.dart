import 'package:flutter/material.dart';
import 'package:flutter_project/common.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class ListExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(title: 'List Example', slivers: [
      _StickyHeaderList(index: 0),
      _StickyHeaderList(index: 1),
      _StickyHeaderList(index: 2),
      _StickyHeaderList(index: 3),
    ]);
  }
}

class _StickyHeaderList extends StatelessWidget {
  final int index;

  const _StickyHeaderList({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Header(index: index),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(
                  leading: CircleAvatar(child: Text('$index')),
                  title: Text('List tile #$index'),
                ),
            childCount: 6),
      ),
    );
  }
}
