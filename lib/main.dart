import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

// Flutter（72）：Sliver组件之SliverList
// https://www.jianshu.com/p/4b4b0b6f38b5

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: TestSliverListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TestSliverListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestSliverListPageState();
}

class _TestSliverListPageState extends State<TestSliverListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SliverListView')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ThemeSliverListView(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return AutoScrollTag(
                key: ValueKey(index),
                index: index,
                child: Text('index = $index', key: ValueKey(index)),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ThemeSliverListView extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;

  const ThemeSliverListView({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: ThemeListChildrenDelegate(
        (context, index) => itemBuilder(context, index),
        childCount: itemCount,
        viewport: (int start, int end) {
          print('viewport');
        },
      ),
    );
  }
}

class ThemeListChildrenDelegate extends SliverChildBuilderDelegate {
  final Function(int start, int end)? viewport;

  ThemeListChildrenDelegate(
    IndexedWidgetBuilder builder, {
    int? childCount,
    this.viewport,
  }) : super(builder, childCount: childCount);

  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
    if (viewport != null) {
      viewport?.call(firstIndex, lastIndex);
    }
    super.didFinishLayout(firstIndex, lastIndex);
  }
}
