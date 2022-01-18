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
      home: MyHomePage(),
    );
  }
}

class Counter extends ChangeNotifier {
  // 这里也可以使用with来进行实现
  int _count = 0; //数值计算
  int get count => _count;

  addCount() {
    _count++;
    notifyListeners();
  }
}

Counter _counter = Counter();

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _counter.addListener(() {
      // 数值改变的监听
      print('YM--->新数值:${_counter.count}');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _counter.dispose(); //移除监听
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello')),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                // disposediao
                _counter.dispose();// dispose之后就不能收到
                print('YM->dispose()');
              },
              child: Text('dispose'),
            ),
            RaisedButton(
              onPressed: () {
                _counter.addCount();
              },
              child: Text('计数'),
            ),
          ],
        ),
      ),
    );
  }
}
