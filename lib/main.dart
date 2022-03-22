import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ListTileDemo(),
    );
  }
}

class ListTileDemo extends StatefulWidget {
  @override
  State<ListTileDemo> createState() => _ListTileDemoState();
}

class _ListTileDemoState extends State<ListTileDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AppBar')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ListTile(
                title: Text('Horse'),
                subtitle: Text('A strong animal'),
                dense: true,
                // 使文本变小
                leading: Icon(Icons.search),
                // 前边的图标
                trailing: Icon(Icons.keyboard_arrow_right),
                contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                // 两边间距
                selected: true,
                // 选中状态
                onTap: () {},
                // 点击事件
                enabled: true, // 是否禁止点击事件
              ),
              color: Colors.green,
            ),
            Container(
              child: ListTile(title: Text('Horse')),
              color: Colors.grey,
            ),
            Column(
              children: ListTile.divideTiles(
                tiles: [
                  ListTile(title: Text('Horse')),
                  ListTile(title: Text('Cow')),
                  ListTile(title: Text('Camel')),
                  ListTile(title: Text('Sheep')),
                  ListTile(title: Text('Goat')),
                ],
                context: context,
              ).toList(),
            ),
            Container(
              color: Colors.lightBlue,
              child: ListTile(
                title: Container(
                  child: Text('北京'),
                  color: Colors.red,
                  margin: EdgeInsets.zero,
                ),
                contentPadding: EdgeInsets.all(0),
              ),
            ),
            Container(
              width: double.infinity,
              child: SafeArea(child: Text('Hello World!')),
              color: Colors.deepPurpleAccent,
            ),
          ],
        ),
      ),
    );
  }
}
