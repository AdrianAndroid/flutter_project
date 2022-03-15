import 'dart:math';

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
      home: Scaffold(
        appBar: AppBar(title: Text('AppBar')),
        body: _buildWidgets(),
      ),
    );
  }

  _buildWidgets() => Container(
        color: Colors.red,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // clipBehavior 参数
              // none：不裁剪，系统默认值，如果子组件不超出边界，此值没有任何性能消耗。
              // hardEdge：裁剪但不应用抗锯齿，速度比none慢一点，但比其他方式快。
              // antiAlias：裁剪而且抗锯齿，此方式看起来更平滑，比antiAliasWithSaveLayer快，比hardEdge慢，通常用于处理圆形和弧形裁剪。
              // antiAliasWithSaveLayer：裁剪、抗锯齿而且有一个缓冲区，此方式很慢，用到的情况比较少。
              Text('方形裁剪'),
              ClipRect(
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: 0.5,
                  child: Container(
                    height: 150,
                    width: 150,
                    child: Image.asset('assets/lady.png', fit: BoxFit.cover),
                  ),
                ),
              ),
              Text('圆角裁剪'),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 150,
                  width: 150,
                  child: Image.asset('assets/lady.png', fit: BoxFit.cover),
                ),
              ),
              Text('椭圆裁剪'),
              ClipOval(
                child: Container(
                  child: Image.asset('assets/lady.png', fit: BoxFit.cover),
                ),
              ),
              //shape参数是ShapeBorder类型，系统已经定义了很多形状，介绍如下：
              // RoundedRectangleBorder：圆角矩形
              // ContinuousRectangleBorder：直线和圆角平滑连续的过渡，和RoundedRectangleBorder相比，圆角效果会小一些。
              // StadiumBorder：类似于足球场的形状，两端半圆。
              // BeveledRectangleBorder：斜角矩形。效果如图：
              Text('圆形裁剪'),
              ClipPath.shape(
                shape: StadiumBorder(),
                child: Container(
                  height: 150,
                  width: 150,
                  child: Image.asset('assets/lady.png', fit: BoxFit.cover),
                ),
              ),
              Text('三角裁剪'),
              ClipPath(
                clipper: TrianglePath(),
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/lady.png', fit: BoxFit.cover),
                ),
              ),
              Text('五角星裁剪'),
              ClipPath(
                clipper: StarPath(),
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/lady.png', fit: BoxFit.cover),
                ),
              ),
              Text('变换的五角星裁剪'),
              StarClip(),
            ],
          ),
        ),
      );
}

class TrianglePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class StarPath extends CustomClipper<Path> {
  StarPath({this.scale = 2.5});

  final double scale;

  double perDegree = 36;

  /// 角度转弧度公式
  double degree2Radian(double degree) {
    return (pi * degree / 180);
  }

  @override
  Path getClip(Size size) {
    var R = min(size.width / 2, size.height / 2);
    var r = R / scale;
    var x = size.width / 2;
    var y = size.height / 2;

    var path = Path();
    path.moveTo(x, y - R);
    path.lineTo(x - sin(degree2Radian(perDegree)) * r,
        y - cos(degree2Radian(perDegree)) * r);
    path.lineTo(x - sin(degree2Radian(perDegree * 2)) * R,
        y - cos(degree2Radian(perDegree * 2)) * R);
    path.lineTo(x - sin(degree2Radian(perDegree * 3)) * r,
        y - cos(degree2Radian(perDegree * 3)) * r);
    path.lineTo(x - sin(degree2Radian(perDegree * 4)) * R,
        y - cos(degree2Radian(perDegree * 4)) * R);
    path.lineTo(x - sin(degree2Radian(perDegree * 5)) * r,
        y - cos(degree2Radian(perDegree * 5)) * r);
    path.lineTo(x - sin(degree2Radian(perDegree * 6)) * R,
        y - cos(degree2Radian(perDegree * 6)) * R);
    path.lineTo(x - sin(degree2Radian(perDegree * 7)) * r,
        y - cos(degree2Radian(perDegree * 7)) * r);
    path.lineTo(x - sin(degree2Radian(perDegree * 8)) * R,
        y - cos(degree2Radian(perDegree * 8)) * R);
    path.lineTo(x - sin(degree2Radian(perDegree * 9)) * r,
        y - cos(degree2Radian(perDegree * 9)) * r);
    path.lineTo(x - sin(degree2Radian(perDegree * 10)) * R,
        y - cos(degree2Radian(perDegree * 10)) * R);
    return path;
  }

  @override
  bool shouldReclip(StarPath oldClipper) {
    return oldClipper.scale != this.scale;
  }
}

class StarClip extends StatefulWidget {
  @override
  State<StarClip> createState() => _StarClipState();
}

class _StarClipState extends State<StarClip>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _animation = Tween(begin: 1.0, end: 4.0).animate(_controller);
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return ClipPath(
            clipper: StarPath(scale: _animation.value),
            child: Container(
              height: 150,
              width: 150,
              color: Colors.green,
            ),
          );
        });
  }
}
