import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      home: MyPage(),
    );
  }
}

class CounterProvider with ChangeNotifier {
  int _count = 0;
  int _count1 = 100;

  int get value => _count;

  int get value1 => _count1;

  void increment() {
    _count++;
    notifyListeners();
  }

  void increment1() {
    _count1++;
    notifyListeners();
  }
}

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyPageState();
  }
}

class MyPageState extends State<MyPage> {
  // 初始化CounterProvider
  CounterProvider _counterProvider = new CounterProvider();

  @override
  Widget build(BuildContext context) {
    print('页面重绘了.........');
    // 整个页面使用ChangeNotifier来包裹
    return ChangeNotifierProvider(
      create: (context) => _counterProvider,
      // child里面的内容不会因为数据的改变而重绘
      child: Scaffold(
        appBar: AppBar(title: Text('my page')),
        body: Center(
          // 使用Consumer来获取provider
          child: Column(
            children: [
              // 使用Consumer来获取CounterProvider,为Text提供数据
              Consumer<CounterProvider>(
                builder: (
                  BuildContext context,
                  CounterProvider counterProvider,
                  Widget? child,
                ) {
                  print('Text1 重绘制了......');
                  return Text(
                    // 获取数据
                    'Text1 : ${counterProvider.value}',
                    style: TextStyle(fontSize: 20),
                  );
                },
              ),
              // 使用Consumer来获取CounterProvider,为Text提供数据
              Consumer(
                builder: (
                  BuildContext context,
                  CounterProvider counterProvider,
                  Widget? child,
                ) {
                  print('Text2重绘制了......');
                  return Text(
                    'Text2 : ${counterProvider.value1}',
                    style: TextStyle(fontSize: 20),
                  );
                },
              ),
              RaisedButton(
                onPressed: () {
                  print('Button 1 被点击了......');
                  _counterProvider.increment();
                },
                child: Text('Button1'),
              ),
              RaisedButton(
                onPressed: () {
                  print('Button 2 被点击了.....');
                  _counterProvider.increment1();
                },
                child: Text('Button2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
