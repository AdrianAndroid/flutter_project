import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return StreamPage();
    return MaterialApp(
      title: "Welcome to Flutter",
      home: StreamPage(),
    );
  }
}

class StreamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  late StreamController _streamController;
  int _count = 4;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<int>();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("StreamProvider")),
      // body: Center(child: Text('Hello')),
      body: StreamProvider<int>(
        create: (_) {
          return _streamController.stream as Stream<int>;
        },
        initialData: _count,
        catchError: (BuildContext context, Object? error) {
          // catchError : 异常时调用，返回值与StreamController范型一样
          // 如果catchError不写，当报错时直接爆红出错
          print('哈哈:${error.toString()}');
          return 10000;
        },
        child: MyText(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(_count<8)
            _streamController.sink.add(++_count);
          else
            _streamController.sink.addError('异常啦！');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final count = Provider.of<int>(context);
    return Center(child: Text("$count"));
  }
}
