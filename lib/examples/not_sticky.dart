import 'package:flutter/material.dart';
import 'package:flutter_project/common.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class NotStickyExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Not Sticky Example',
      slivers: [
        _NotStickyList(index: 0),
        _NotStickyList(index: 1),
        _NotStickyList(index: 2),
        _NotStickyList(index: 3),
      ],
    );
  }
}

class _NotStickyList extends StatelessWidget {
  final int index;

  const _NotStickyList({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Header(index: index),
      sticky: false,
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ListTile(
            leading: CircleAvatar(
              child: Text('index'),
            ),
            title: Text('List tile #$index'),
          ),
          childCount: 6,
        ),
      ),
    );
  }
}
