import 'package:flutter/material.dart';

// Flutter（72）：Sliver组件之SliverList
// https://www.jianshu.com/p/4b4b0b6f38b5

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: SliverListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SliverListPage extends StatelessWidget {
  final _tip = '''
1.SliverList介绍
CustomScrollView+SliverList组合使用其实就相当于是个ListView
2.SliverList属性
- delegate：SliverChildDelegate 系统提供个两个已经实现好的代理：SliverChildListDelegate/SliverChildBuilderDelegate
  ''';

  _mySliverAppBar() {
    return SliverAppBar(
      title: Text('SliverList'),
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1113%2F092919113248%2F1Z929113248-8-1200.jpg',
          fit: BoxFit.cover,
        ),
        collapseMode: CollapseMode.parallax,
      ),
    );
  }

  _mySliverChildListDelegate() {
    return SliverChildListDelegate([
      Container(
        height: 80,
        color: Colors.primaries[0],
      ),
      Container(
        height: 80,
        color: Colors.primaries[1],
      ),
      Container(
        height: 80,
        color: Colors.primaries[2],
      ),
      Container(
        height: 80,
        color: Colors.primaries[3],
      ),
      Container(
        height: 80,
        color: Colors.primaries[4],
      ),
      Container(
        height: 80,
        color: Colors.primaries[5],
      ),
      Container(
        height: 80,
        color: Colors.primaries[6],
      ),
      Container(
        height: 80,
        color: Colors.primaries[7],
      ),
      Container(
        height: 80,
        color: Colors.primaries[8],
      ),
    ]);
  }

  _mySliverChildBuilderDelegate() {
    return SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Container(
          height: 80,
          color: Colors.primaries[index % 11],
        );
      },
      childCount: 30,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _mySliverAppBar(),
        SliverList(
          delegate: _mySliverChildBuilderDelegate(),
        ),
      ],
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
