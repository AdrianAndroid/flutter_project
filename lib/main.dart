import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listener',
      home: Scaffold(
        appBar: AppBar(title: Text('手势检测')),
        body: _Scale(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _Scale extends StatefulWidget {
  const _Scale({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScaleState();
}

class _ScaleState extends State<_Scale> {
  double _width = 200.0; // 通过修改图片宽度来达到缩放效果
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        // 制定宽度，高度自适应
        child: Image.asset("./images/sea.jpg", width: _width),
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            // 缩放倍数在0.8到10之间
            _width = 200 * details.scale.clamp(.8, 10.0);
          });
        },
      ),
    );
  }
}
