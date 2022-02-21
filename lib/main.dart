import 'package:flutter/material.dart';

// https://www.jianshu.com/p/46cf3de34e72
// 找一个文档
// 通过LayoutBuilder组件可以获取父组件的约束尺寸

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyPageState();
  }
}

class MyPageState extends State<MyPage> {
  String _url = 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg'
      '.jj20.com%2Fup%2Fallimg%2Ftp09%2F210611094Q512b-0-lp.jpg';
  bool _normal = true;

  @override
  Widget build(BuildContext context) {
    print('页面重绘了.........');
    // 整个页面使用ChangeNotifier来包裹
    return Scaffold(
      appBar: AppBar(title: Text('Overlay')),
      body: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _normal = true;
                    });
                  },
                  child: Text('Normal')),
              SizedBox(width: 20),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _normal = false;
                    });
                  },
                  child: Text('LayoutBuilder')),
            ],
          ),
          _normal ? _normalWidget : _layoutbuilderWidget
        ],
      ),
    );
  }

  Widget get _normalWidget => Center(
        child: Container(
          child: Column(
            children: [
              Image.network(_url, fit: BoxFit.fill, height: 100),
              Text("图片"),
            ],
          ),
        ),
      );

  Widget get _layoutbuilderWidget =>
      LayoutBuilder(builder: (context, constraints) {
        return Container(
          child: Column(
            children: [
              Image.network(
                _url,
                fit: BoxFit.fill,
                height: 100,
                width: constraints.maxWidth,
              ),
              Text('图片'),
            ],
          ),
        );
      });

  @override
  void initState() {
    super.initState();
  }
}
