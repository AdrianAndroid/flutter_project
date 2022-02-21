import 'dart:async';

import 'package:flutter/material.dart';

//  Wrap({
//     Key key,
//     this.direction = Axis.horizontal,   //排列方向，默认水平方向排列
//     this.alignment = WrapAlignment.start,  //子控件在主轴上的对齐方式
//     this.spacing = 0.0,  //主轴上子控件中间的间距
//     this.runAlignment = WrapAlignment.start,  //子控件在交叉轴上的对齐方式
//     this.runSpacing = 0.0,  //交叉轴上子控件之间的间距
//     this.crossAxisAlignment = WrapCrossAlignment.start,   //交叉轴上子控件的对齐方式
//     this.textDirection,   //textDirection水平方向上子控件的起始位置
//     this.verticalDirection = VerticalDirection.down,  //垂直方向上子控件的其实位置
//     List<Widget> children = const <Widget>[],   //要显示的子控件集合
//   })

// https://www.jianshu.com/p/5ffb4c9030d6
// 构建
void demo1() {
  var stream = Stream.fromIterable([1, 2, 3, 4]);
  StreamSubscription<int> streamSubscription = stream.listen((event) {
    print('event -> $event');
  });
  print(streamSubscription);
}

// isPaused -> bool
void demo2() {
  var stream = Stream.fromIterable([1, 2, 3, 4]);
  StreamSubscription<int> streamSubscription = stream.listen((event) {
    print('event -> $event');
  });
  print(streamSubscription.isPaused); // false
  streamSubscription.pause();
  print(streamSubscription.isPaused); // true
  streamSubscription.cancel();
}

// onDone
void demo3() {
  var stream = Stream.fromIterable([1, 2, 3, 4]);
  StreamSubscription<int> streamSubscription = stream.listen((event) {
    print('Stream -- listen -- $event');
  });
  streamSubscription.onData((data) {
    print('StreamSubscription -- onData -- $data');
  });
  // streamSubscription.cancel();
}

// onDone
void onDone() {
  var stream = Stream.fromIterable([1, 2, 3, 4]);
  StreamSubscription<int> streamSubscription = stream.listen(null);
  streamSubscription.onData((data) {
    print("StreamSubscription -- onData -- $data");
  });
  streamSubscription.onDone(() {
    print("StreamSubscription -- onDone");
  });
}

// onError
void onError() {
  var stream = Stream.error("对不起，出错了"); // 出发点
  StreamSubscription streamSubscription = stream.listen(null); // 监听
  streamSubscription.onData((data) {
    // 返回数据
    print("StreamSubscription -- onData");
  });
  streamSubscription.onDone(() {
    print("StreamSubscription -- onDone");
  });
  streamSubscription.onError((e) {
    print('StreamSubscription -- onError -- $e');
  });
}

// cancel() -> Future<void>
void cancel() {
  var stream = Stream.fromIterable([1, 2, 3, 4]);
  StreamSubscription<int> streamSubscription = stream.listen(null);
  streamSubscription.onData((data) {
    print('StreamSubscription -- onData -- $data');
  });
  streamSubscription.cancel();
}

// pause是对Stream的订阅者进行暂停
// resume是对暂停的订阅者纪念性恢复
void pauseAndResume() {
  var stream = Stream.fromIterable([1, 2, 3, 4]);
  StreamSubscription<int> streamSubscription = stream.listen(null);
  streamSubscription.onData((data) {
    print("StreamSubscription -- onData -- $data");
  });
  print('---->streamSubscription.pause();');
  streamSubscription.pause();
  print('---->print(streamSubscription.isPaused); ');
  print(streamSubscription.isPaused); // true
  print('---->streamSubscription.resume();');
  streamSubscription.resume();
  print('---->print(streamSubscription.isPaused);');
  print(streamSubscription.isPaused); // false
}

// 如果实现pasue的Future方法，则StreamSubscription将撤销暂停，在Future完成时再恢复StreamSubscription
void pauseAndResume1() {
  var stream = Stream.fromIterable([1, 2, 3, 4]);
  StreamSubscription<int> streamSubscription = stream.listen(null);
  streamSubscription.onData((data) {
    print('StreamSubscription -- onData -- $data');
  });
  streamSubscription.pause(Future(() {
    print('pause -- future -- 完成');
  }));
}

void pauseAndResume2() {
  var stream = Stream.fromIterable([1, 2, 3, 4]);
  StreamSubscription<int> streamSubscription = stream.listen((event) {});
  streamSubscription.onData((data) {
    print("StreamSubscripton -- onData -- $data");
  });
  streamSubscription.pause();
  Future(() {
    print("pause -- future - 完成");
  }).whenComplete(() => streamSubscription.resume());
}

void asFuture() {
  var stream = Stream.fromIterable([1, 2, 3, 4]);
  StreamSubscription streamSubscription = stream.listen((event) {});
  streamSubscription.onData((data) {
    print("StreamSubscripton -- onData -- $data");
  });
  streamSubscription.onDone(() {
    print("--onDone--");
  });
  streamSubscription.asFuture(Future(() {
    return "onDone & onError 合集";
  })).then((value) {
    print("asFuture -- $value");
  }).catchError((e) {
    print("sFuture --catchError -- $e");
  });
}

// onError取代
void asFuture2() {
  var stream = Stream.error("对不起我错了");
  StreamSubscription streamSubscription = stream.listen((event) {});
  streamSubscription.onData((data) {
    print("StreamSubscription -- onData -- $data");
  });
  streamSubscription.onError((e) {
    print("--onError-- $e");
  });
  streamSubscription.asFuture(Future(() {
    return "onDone & onError 合集";
  }).then((value) {
    print("asFuture -- $value");
  }).catchError((e) {
    print("asFuture --catchError -- $e");
  }));
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: Scaffold(
        appBar: AppBar(title: Text('StreamSubscription')),
        body: SingleChildScrollView(
          child: Wrap(
            spacing: 10,
            children: [
              _buildButton('listen监听', demo1),
              _buildButton('isPaused -> bool', demo2),
              _buildButton('onData', demo3),
              _buildButton('onDone', onDone),
              _buildButton('onError', onError),
              _buildButton('onError', onError),
              _buildButton('cancel', cancel),
              _buildButton('pauseAndResume', pauseAndResume),
              _buildButton('pauseAndResume1', pauseAndResume1),
              _buildButton('pauseAndResume2', pauseAndResume2),
              _buildButton('asFuture', asFuture),
              _buildButton('asFuture2', asFuture2),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  _buildButton(String title, VoidCallback onPress) {
    return ElevatedButton(onPressed: onPress, child: Text(title));
  }
}
