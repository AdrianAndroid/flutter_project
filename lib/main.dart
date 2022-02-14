import 'package:flutter/material.dart';
import 'package:flutter_project/toast.dart';
import 'package:provider/provider.dart';

/// 1. 创建OverlayEntry
/// Overlay entry = new OverlayEntry(builder:(){ /*在这里创建对应的widget*/ })
/// 2. 往Overlay中插入插入OverlayEntry
/// Overlay.of(context).insert(overlayEntry);
/// 3. 调用entry自身的remove()方法，从所在的overlay中移除自己
/// entry.remove()

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
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Toast.show(context: context, message: '弹出了Toast！！！');
              },
              child: Text('第一个点击'),
            ),
          ],
        ),
      ),
    );
  }
}
