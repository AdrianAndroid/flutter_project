import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plugin1/plugin1.dart';

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
  String title = '';

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
          ElevatedButton(onPressed: initPlatformState, child: Text('获取版本号')),
          Text('版本号：$title'),
          ElevatedButton(onPressed: () {}, child: Text('Third Page')),
        ],
      ),
    );
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await Plugin1.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      title = platformVersion;
    });
  }
}
