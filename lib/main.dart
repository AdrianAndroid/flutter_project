import 'package:flutter/material.dart';

// Flutter实战*第二版
// https://www.woolha.com/tutorials/flutter-using-futurebuilder-widget-examples
// https://zhuanlan.zhihu.com/p/140235529
// -->WillPopScope用于处理是否离开当前页面，在Flutter中有多种方式可以离开当前页面，
// 比如AppBar、CupertinoNavigationBar上面的返回按钮，点击将会回到前一个页面，
// 在Android手机上点击实体（虚拟）返回按钮，也将会回到前一个页面，此功能对于iOS程序员来说
// 可能特别容易忽略。
// -->以下集中情况我们会用到WillPopScope
// 1. 需要询问用户是否退出。
// 2. App中有多个Navigator，想要的是让其中一个 Navigator 退出，而不是直接让在 Widget tree
// 底层的 Navigator退出。

// APP中有多个Navigator
// 在页面底部有一个常驻bar，其上展示内容，这个常驻bar就需要一个自己的Navigator。
// 在使用TabView、BottomNavigationBar、CupertinoTabView这些组件时，希望有多个Tab，但每个Tab中有自己的导航行为，这时需要给每一个Tab加一个Navigator。
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: Scaffold(
        body: MyHomePage(title: 'WillPopScope'),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title = ''}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 使用TabView、BottomNavigationBar、CupertinoTabView这些组件时也是一样的原理，
  // 只需在每一个Tab中加入Navigator，不要忘记指定key。
  GlobalKey<NavigatorState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (_key.currentState?.canPop() == true) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('_key.currentState?.canPop() == true')));
            _key.currentState?.pop();
            return false;
          } else {
            print('return true;');
          }
          return true;
        },
        child: Column(
          children: [
            Expanded(
              child: Navigator(
                key: _key,
                onGenerateRoute: (RouteSettings settings) => MaterialPageRoute(
                  builder: (context) {
                    return OnePage();
                  },
                ),
              ),
            ),
            Container(
              height: 50,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text('底部Bar'),
            ),
          ],
        ),
      ),
    );
  }
}

// 第一个页面
class OnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TwoPage();
            }));
          },
          child: Text('去下一个页面'),
        ),
      ),
    );
  }
}

// 第二个页面
class TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('这是第二个页面'),
        ),
      ),
    );
  }
}
