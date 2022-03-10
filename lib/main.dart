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
  @override
  Widget build(BuildContext context) {
    print('页面重绘了.........');
    // 整个页面使用ChangeNotifier来包裹
    return Scaffold(
      appBar: AppBar(title: Text('Overlay')),
      body: Column(
        children: [
          RoundLinearProgressIndicator(3/9),
        ],
      ),
    );
  }
}

class RoundLinearProgressIndicator extends StatelessWidget {
  final double percent;
  final Color progressColor;
  final Color backgroundColor;
  final int height;
  final int radius;

  RoundLinearProgressIndicator(
    this.percent, {
    this.progressColor = Colors.red,
    this.backgroundColor = Colors.red,
    this.height = 14,
    this.radius = 7,
  });

  @override
  Widget build(BuildContext context) {
    double temp = percent;
    if (temp > 1) {
      temp = 1;
    } else if (percent < 0) {
      temp = 0;
    }
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          child: Stack(
            children: [
              Container(
                width: constraints.maxWidth,
                height: height.toDouble(),
                decoration: BoxDecoration(
                  color: backgroundColor.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(radius.toDouble()), //圆角度
                ),
              ),
              Positioned(
                left: 0,
                child: Container(
                  width: constraints.maxWidth * temp,
                  height: height.toDouble(),
                  decoration: BoxDecoration(
                    color: progressColor,
                    borderRadius: BorderRadius.circular(radius.toDouble()), //圆角度
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
