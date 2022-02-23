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
        body: _Drag(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _Drag extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DragState();
  }
}

class _DragState extends State<_Drag> with SingleTickerProviderStateMixin {
  double _top = 0.0; // 距顶部的偏移
  double _left = 0.0; // 距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            // 手指按下时会触发此回调
            onPanDown: (DragDownDetails e) {
              // 打印手指按下的未知（相对于屏幕）
              print('用户手指按下：${e.globalPosition}');
            },
            // 手指滑动时会触发此回调
            onPanUpdate: (DragUpdateDetails e) {
              // 用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e) {
              // 打印滑动结束时x，y轴上的速度
              print(e.velocity);
            },
          ),
        ),
      ],
    );
  }
}

// DragDownDetails.globalPosition
// // 当用户按下时，此属性为用户按下的位置相对于屏幕（而非父组件）原点（左上角）的偏移
// DragDownDetails.delta
// // 当用户在屏幕上滑动时，会触发多次Update⌚️，delta指一次Update事件的滑动的偏移量
// DragDownDetails.velocity
// // 该属性代表用户抬起手指时的滑动速度（包含x、y两个轴的），示例中并没有处理手指抬起的速度，常见的效果是根据用户抬起手指时的速度做一个减速动画
