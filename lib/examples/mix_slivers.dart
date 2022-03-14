import 'package:flutter/material.dart';
import 'package:flutter_project/common.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class MixSliversExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'List Exammple',
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.orange,
          title: Text('SliverAppBar'),
          automaticallyImplyLeading: false,
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: Container(height: 50, color: Colors.red),
        ),
        _StickHeaderList(index: 0),
        _StickHeaderList(index: 1),
        _StickHeaderList(index: 2),
        _StickHeaderList(index: 3),
      ],
    );
  }
}

class _StickHeaderList extends StatelessWidget {
  final int index;

  const _StickHeaderList({Key? key, required this.index}) : super(key: key);

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
