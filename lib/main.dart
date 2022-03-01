import 'package:flutter/material.dart';

// Flutter实战*第二版
// https://www.woolha.com/tutorials/flutter-using-futurebuilder-widget-examples
// https://zhuanlan.zhihu.com/p/140235529
// -->WillPopScope用于处理是否离开当前页面，在Flutter中有多种方式可以离开当前页面，
// 比如AppBar、CupertinoNavigationBar上面的返回按钮，点击将会回到前一个页面，
// 在Android手机上点击实体（虚拟）返回按钮，也将会回到前一个页面，此功能对于iOS程序员来说
// 可能特别容易忽略。
// -->以下集中情况我们会用到WillPopScope
// 1. 需要询问用户是否退出。
// 2. App中有多个Navigator，想要的是让其中一个 Navigator 退出，而不是直接让在 Widget tree
// 底层的 Navigator退出。

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: Scaffold(
        body: SliverListDemo(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SliverListDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliverListDemoState();
}

class _SliverListDemoState extends State<SliverListDemo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SliverList简单样例")),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: 80,
                color: Colors.primaries[0],
                child: Text('SliverChildListDelegate_0'),
              ),
              Container(
                height: 80,
                color: Colors.primaries[1],
                child: Text('SliverChildListDelegate_1'),
              ),
              Container(
                height: 80,
                color: Colors.primaries[2],
                child: Text('SliverChildListDelegate_2'),
              ),
              Container(
                height: 80,
                color: Colors.primaries[3],
                child: Text('SliverChildListDelegate_3'),
              ),
              Container(
                height: 80,
                color: Colors.primaries[4],
                child: Text('SliverChildListDelegate_4'),
              ),
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(),
              // 行数
              childCount: 20,
              //是否保存行的状态，默认是true
              addAutomaticKeepAlives: true,
            ),
          ),
        ],
      ),
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
        child: ThemeSliverListView(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Text('index = $index', key: ValueKey(index));
          },
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
