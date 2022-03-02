import 'package:flutter/material.dart';
import 'constants.dart';

// 在Flutter中创建有意思的滚动效果 - Sliver系列
// https://www.jianshu.com/p/5aeeb7ea776b

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: CustomIconsDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CustomIconsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('自定义Icon')),
      body: GridView.builder(
        itemCount: iconList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemBuilder: (context, index) {
          return Center(
            child: Icon(
              iconList[index],
              size: 30,
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }
}
