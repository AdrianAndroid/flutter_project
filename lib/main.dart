import 'package:flutter/material.dart';

// 一个加载普通widget的Sliver组件，如果是滑动的组件不推荐使用这个，而是使用Sliver滑动组件

void main() {
  runApp(MaterialApp(
    title: 'SliverToAdapter',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       primarySwatch: Colors.orange,
  //       visualDensity: VisualDensity.adaptivePlatformDensity,
  //     ),
  //     home: Scaffold(
  //       appBar: AppBar(title: Text('AppBar')),
  //       body: Center(child: Text('Hello World!')),
  //     ),
  //   );
  // }

  _mySlierAppBar() {
    return SliverAppBar(
      title: Text('SliverToBoxAdapter'),
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          'https://img-blog.csdnimg.cn/dfef599be4604e63834ef522aa2b732b.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6LW15YGlemo=,size_20,color_FFFFFF,t_70,g_se,x_16',
          fit: BoxFit.cover,
        ),
        collapseMode: CollapseMode.parallax,
      ),
    );
  }

  _mySliverChildBuilderDelegate() {
    return SliverChildBuilderDelegate(
      (context, index) {
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
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          _mySlierAppBar(),
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              color: Colors.blue,
            ),
          ),
          SliverList(delegate: _mySliverChildBuilderDelegate()),
        ],
      ),
    );
  }
}
