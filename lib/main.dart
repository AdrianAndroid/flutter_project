import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

// Flutter: 倒计时组件
// https://blog.csdn.net/BunnyCoffer/article/details/119955233

void main() {
  runApp(MyApp());
}

//1. 会不会分享她的生活 2。分享想法感受
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
        body: DownTimeWidget(
          clors: Colors.red,
          time: 5000,
          width: 50,
          strokeWidth: 5.0,
          textStyle: TextStyle(
              color: Colors.black,
              fontSize: 8.0,
              decoration: TextDecoration.none),
          endListener: () {
            print('endListener');
            // showNextPage();
          },
        ),
      ),
    );
  }
}

void test() {
  DownTimeWidget(
    clors: Colors.red,
    time: 5000,
    width: 50,
    strokeWidth: 5.0,
    textStyle: TextStyle(
        color: Colors.black, fontSize: 8.0, decoration: TextDecoration.none),
    endListener: () {
      // showNextPage();
    },
  );
}

/// 倒计时
typedef DownTimeEndListener = void Function();

class DownTimeWidget extends StatefulWidget {
  Color clors;
  double width;
  double strokeWidth;
  int time;
  TextStyle textStyle;
  DownTimeEndListener? endListener;

  DownTimeWidget(
      {Key? key,
      this.clors = Colors.red,
      this.width = 50,
      this.strokeWidth = 5.0,
      this.time = 5000,
      this.textStyle = const TextStyle(
        color: Colors.black,
        fontSize: 8.0,
        decoration: TextDecoration.none,
      ),
      this.endListener})
      : super();

  @override
  _DownTimeWidgetState createState() => _DownTimeWidgetState();
}

class _DownTimeWidgetState extends State<DownTimeWidget>
    with TickerProviderStateMixin {
  late int _time;
  late AnimationController controller;
  late CurvedAnimation curvedAnimation;
  late Tween<double> animationTween;
  late Animation<double> animation;
  late double angle;

  @override
  void initState() {
    super.initState();
    _time = widget.time ~/ 1000;
    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.time),
    );
    curvedAnimation = new CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    );
    animationTween = new Tween(begin: 0.0, end: 360.0);
    animation = animationTween.animate(curvedAnimation);

    animation.addStatusListener((status) {
      //动画播放完成
      if (status == AnimationStatus.completed) {
        widget.endListener?.call();
      }
    });

    animation.addListener(() {
      angle = animation.value;
      setState(() {});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.width / 2),
          color: Colors.white),
      child: Stack(
        children: [
          Center(
            child: DownTimeText(
              time: _time,
              textStyle: widget.textStyle,
            ),
          ),
          CustomPaint(
            painter: new DrawArcPainter(
              colors: widget.clors,
              angle: angle,
              width: widget.width,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    // animation.removeListener(null);
    super.dispose();
  }
}

///进度条
class DrawArcPainter extends CustomPainter {
  DrawArcPainter({
    this.colors = Colors.red,
    this.angle = 0,
    this.width = 0,
    this.mStrokeWidth = 0,
  });

  Color colors;

  double mStrokeWidth;

  double width;

  double angle;

  double angleToRadian(double angle) => angle * (pi / 180.0);

  double radianToAngle(double radian) => radian * (180.0 / pi);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = colors == null ? Colors.red : colors
      ..strokeWidth = mStrokeWidth == null ? 2.0 : mStrokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Rect rect = new Rect.fromLTWH(0.0, 0.0, width, width);
    canvas.drawArc(rect, 0.0, angleToRadian(angle), false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

///时间
class DownTimeText extends StatefulWidget {
  int time;
  TextStyle textStyle;

  DownTimeText({
    Key? key,
    this.time = 0,
    this.textStyle = const TextStyle(),
  }) : super(key: key);

  @override
  _DownTimeTextState createState() => _DownTimeTextState();
}

class _DownTimeTextState extends State<DownTimeText> {
  late int _time;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _time = widget.time;
    startDownTimer();
  }

  ///倒计时
  void startDownTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (time) {
      if (_time == null || _time == 0) {
        setState(() {});
        timer.cancel();
        return;
      }
      _time--;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "倒计时:$_time",
      style: widget.textStyle,
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
