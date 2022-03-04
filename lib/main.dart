import 'dart:core';
import 'dart:math' as math;
import 'package:flutter/material.dart';

// 看这个资料
// Flutter各种虚线实战和虚线边框原理
// https://blog.csdn.net/ZZB_Bin/article/details/112907929

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    // _mywidget = _GridItem2();
  }

  SelectView(String text, String id) {
    return PopupMenuItem(
      value: id,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.message, color: Colors.blue),
          Text(text),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: Scaffold(
        appBar: AppBar(
          title: Text('GridView'),
          actions: [
            // 非隐藏的菜单
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_alarm),
            ),
            // 隐藏的菜单
            PopupMenuButton(
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                SelectView('_GridItem2', '_GridItem2'),
                SelectView('_GridItem3', '_GridItem3'),
                SelectView('_GridItem4', '_GridItem4'),
                SelectView('_GridItem5', '_GridItem5'),
              ],
              onSelected: (String action) {
                switch (action) {
                  case '_GridItem2':
                    setState(() {
                      //_mywidget = _GridItem2();
                    });
                    break;
                  case '_GridItem3':
                    setState(() {
                      //_mywidget = _GridItem3();
                    });
                    break;
                  case '_GridItem4':
                    setState(() {
                      //_mywidget = _GridItem4();
                    });
                    break;
                  case '_GridItem5':
                    setState(() {
                      //_mywidget = _GridItem5();
                    });
                    break;
                }
              },
            ),
          ],
        ),
        body: _renderBody(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  _renderBody() => SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('复制粘贴'),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(
                        color: Colors.black,
                        width: 4,
                        style: BorderStyle.solid,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'CODE:  UJGFKLM',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.copy,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2),
                Text('Hello World!'),
                SizedBox(height: 2),
                Container(
                  color: Colors.grey,
                  width: 100,
                  height: 50,
                  child: DashRect(
                    color: Colors.red,
                    strokeWidth: 2.0,
                    gap: 3.0,
                  ),
                ),
                SizedBox(height: 2),
                Text('Hello World!'),
              ],
            ),
          ),
        ),
      );
}

class DashRect extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  final double gap;

  const DashRect({
    Key? key,
    required this.color,
    required this.strokeWidth,
    required this.gap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DashRectPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double gap;

  DashRectPainter(this.strokeWidth, this.color, this.gap);

  @override
  void paint(Canvas canvas, Size size) {
    Paint dashedPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double x = size.width;
    double y = size.height;

    Path _topPath = getDashedPath(
      a: math.Point(0, 0),
      b: math.Point(x, 0),
      gap: gap,
    );

    Path _rightPath = getDashedPath(
      a: math.Point(0, y),
      b: math.Point(x, y),
      gap: gap,
    );

    Path _bottomPath = getDashedPath(
      a: math.Point(0, y),
      b: math.Point(0.001, y),
      gap: gap,
    );

    Path _leftPath = getDashedPath(
      a: math.Point(0, 0),
      b: math.Point(0.001, y),
      gap: gap,
    );

    canvas.drawPath(_topPath, dashedPaint);
    canvas.drawPath(_rightPath, dashedPaint);
    canvas.drawPath(_bottomPath, dashedPaint);
    canvas.drawPath(_leftPath, dashedPaint);
  }

  Path getDashedPath({
    required math.Point<double> a,
    required math.Point<double> b,
    required gap,
  }) {
    Size size = Size(b.x - a.x, b.y - a.y);
    Path path = Path();
    path.moveTo(a.x, a.y);
    bool shouldDraw = true;
    math.Point currentPoint = math.Point(a.x, a.y);

    num radians = math.atan(size.height / size.width);

    num dx = math.cos(radians) * gap < 0
        ? math.cos(radians) * gap - 1
        : math.cos(radians) * gap;

    num dy = math.sin(radians) * gap < 0
        ? math.sin(radians) * gap * -1
        : math.sin(radians) * gap;
    while (currentPoint.x <= b.x && currentPoint.y <= b.y) {
      shouldDraw
          ? path.lineTo(currentPoint.x.toDouble(), currentPoint.y.toDouble())
          : path.moveTo(currentPoint.x.toDouble(), currentPoint.y.toDouble());
      shouldDraw = !shouldDraw;
      currentPoint = math.Point(
        currentPoint.x + dx,
        currentPoint.y + dy,
      );
    }
    return path;
  }

  @override
  bool shouldRepaint(covariant DashRectPainter oldDelegate) => true;
}
