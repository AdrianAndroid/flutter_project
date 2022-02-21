import 'package:flutter/material.dart';

// 通过addPostFrameCallback可以做一些安全的操作，在有些时候是很有用的，
// 它会在当前Frame绘制完成后进行回调，并且只会回调一次，如果要再次监听需要再设置

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
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      print('MyPage addPostFrameCallback timeStamp:$timeStamp');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('页面重绘了.........');
    // 整个页面使用ChangeNotifier来包裹
    return Scaffold(
      appBar: AppBar(title: Text('Overlay')),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SecondPage();
                }));
              },
              child: Text('Second Page')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ThirdPage();
                }));
              },
              child: Text('Third Page')),
        ],
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      print('SecondPage addPostFrameCallback timeStamp=$timeStamp');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SecondPage')),
      body: Center(
        child: Text('Second Page'),
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      print('ThirdPage addPostFrameCallback timeStamp=$timeStamp');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Third Page')),
      body: Center(child: Text('Third Page')),
    );
  }
}
