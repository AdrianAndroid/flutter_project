import 'package:flutter/material.dart';

// 在Flutter中创建有意思的滚动效果 - Sliver系列
// https://www.jianshu.com/p/5aeeb7ea776b

// Flutter中常用的Sliver
// Sliver名称	                功能	                          对应的可滚动组件
// SliverList	                列表	                          ListView
// SliverFixedExtentList	    高度固定的列表	                ListView，指定itemExtent时
// SliverAnimatedList	        添加/删除列表项可以执行动画	      AnimatedList
// SliverGrid	                网格	                          GridView
// SliverPrototypeExtentList	根据原型生成高度固定的列表	      ListView，指定prototypeItem 时
// SliverFillViewport	        包含多给子组件，每个都可以填满屏幕	PageView

// 它们的子组件必须是Sliver
// Sliver名称	                      对应 RenderBox
// SliverPadding	                  Padding
// SliverVisibility、SliverOpacity	Visibility、Opacity
// SliverFadeTransition	            FadeTransition
// SliverLayoutBuilder	            LayoutBuilder

// 还有一些其它常用的Sliver
// Sliver名称	            说明
// SliverAppBar	          对应 AppBar，主要是为了在 CustomScrollView 中使用。
// SliverToBoxAdapter	    一个适配器，可以将 RenderBox 适配为 Sliver，后面介绍。
// SliverPersistentHeader	滑动到顶部时可以固定住，后面介绍。

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: Scaffold(
        appBar: AppBar(title: Text("SliverList学习")),
        body: SliverListFul(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SliverListFul extends StatefulWidget {
  @override
  // State<StatefulWidget> createState() => SliverListFulState();
  State<StatefulWidget> createState() => SliverListFulState();
}

class SliverListFulState extends State<SliverListFul> {
  @override
  Widget build(BuildContext context) {
    return _buildSliverToBoxAdapter();
  }

  Widget buildTwoSliverList() {
    // SliverFixedExtentList 是一个 Sliver，它可以生成高度相同的列表项。
    // 再次提醒，如果列表项高度相同，我们应该优先使用SliverFixedExtentList
    // 和 SliverPrototypeExtentList，如果不同，使用 SliverList.
    var listView = SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(title: Text('$index')),
        childCount: 10,
      ),
      itemExtent: 56,
    );
    return CustomScrollView(
      slivers: [
        listView,
        listView,
      ],
    );
  }

  /// 上下并列的ListView
  Widget buildTwoListView() {
    var listView = ListView.builder(
      itemBuilder: (_, index) => ListTile(title: Text('$index')),
      itemCount: 20,
    );
    return Column(
      children: [
        Expanded(child: listView),
        Divider(),
        Expanded(child: listView),
      ],
    );
  }

  Widget buildSliver() {
    return CustomScrollView(
      slivers: [
        // AppBar, 包含一个导航栏
        SliverAppBar(
          pinned: true, // 滑动至顶端时会固定住
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('Demo'),
            background: Image.asset('assets/sea.jpeg', fit: BoxFit.cover),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(8.0),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Grid按两列显示
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                alignment: Alignment.center,
                color: Colors.cyan[100 * (index % 9)],
                child: Text('grid item $index'),
              ),
              childCount: 20,
            ),
          ),
        ),
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Container(
              alignment: Alignment.center,
              color: Colors.lightBlue[100 * (index % 9)],
              child: Text('list item $index'),
            ),
            childCount: 20,
          ),
          itemExtent: 50.0,
        ),
      ],
    );
  }

  Widget _buildSliverToBoxAdapter() {
    var listView = SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(title: Text('$index')),
        childCount: 20,
      ),
      itemExtent: 56,
    );

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 300,
            child: PageView(children: [Text('1'), Text('2')]),
          ),
        ),
        listView
      ],
    );
  }
}
