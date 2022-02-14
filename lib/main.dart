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
                //Toast.show(context: context, message: '弹出了Toast！！！');
                showWeixinButtonView();
              },
              child: Text('第一个点击'),
            ),
          ],
        ),
      ),
    );
  }

  OverlayEntry? weixinOverlayEntry;

  /// 展示微信下拉的弹窗
  void showWeixinButtonView() {
    weixinOverlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: 10,
          right: 20,
          height: 320,
          width: 200,
          child: SafeArea(
            child: Material(
              color: Colors.black,
              child: Column(
                children: [
                  _ExpandedItem('发起群聊', () {
                    weixinOverlayEntry?.remove();
                  }),
                  _ExpandedItem('添加朋友', () {
                    weixinOverlayEntry?.remove();
                  }),
                  _ExpandedItem('扫一扫', () {
                    weixinOverlayEntry?.remove();
                  }),
                  _ExpandedItem('首付款', () {
                    weixinOverlayEntry?.remove();
                  }),
                  _ExpandedItem('帮助与反馈', () {
                    weixinOverlayEntry?.remove();
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
    Overlay.of(context)?.insert(weixinOverlayEntry!);
  }

  _ExpandedItem(String title, GestureTapCallback callback) => GestureDetector(
        onTap: callback,
        child: Expanded(
          child: ListTile(
            leading: Icon(Icons.add, color: Colors.white),
            title: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
}
