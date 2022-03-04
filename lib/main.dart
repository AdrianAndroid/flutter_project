import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/banner.dart';

//https://www.wanandroid.com/banner/json

//https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png
//https://www.wanandroid.com/blogimgs/90c6cc12-742e-4c9f-b318-b912f163b8d0.png
//https://www.wanandroid.com/blogimgs/ab17e8f9-6b79-450b-8079-0f2287eb6f0f.png
//https://www.wanandroid.com/blogimgs/fb0ea461-e00a-482b-814f-4faca5761427.png
//https://www.wanandroid.com/blogimgs/62c1bd68-b5f3-4a3c-a649-7ca8c7dfabe6.png
//https://www.wanandroid.com/blogimgs/00f83f1d-3c50-439f-b705-54a49fc3d90d.jpg

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banner',
      home: Scaffold(
        appBar: AppBar(title: Text('Banner')),
        body: Container(child: GradienCircularProgressRoute()),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GradienCircularProgressRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GradienCircularProgressRouteState();
}

class GradienCircularProgressRouteState
    extends State<GradienCircularProgressRoute> {
  @override
  Widget build(BuildContext context) => CustomPaint(painter: MyPainter(50.0));
}

class MyPainter extends CustomPainter {
  final double radius;

  MyPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    // 根据半径计算大小
    size = Size.fromRadius(radius);
    var paint = Paint() //创建一个画笔并配置其属性
      ..isAntiAlias = true //是否抗锯齿
      ..style = PaintingStyle.fill //画笔样式：填充
      ..color = Colors.blue //画笔颜色
      ..strokeWidth = 3.0; // 画笔的宽度

    // 画一个实心圆
    Rect rect = Rect.fromCircle(
      center: size.center(Offset.zero),
      radius: radius,
    );
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant MyPainter oldDelegate) {
    if (oldDelegate.radius != radius) {
      return true;
    }
    return false;
  }
}
