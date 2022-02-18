import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final String URI_MUSIC = "/subPage/music";
final String URI_CHAT = "/subPage/chat";
final String URI_BUY = "/subPage/buy";
final String URI_VIDEO = "/subPage/video";

// 属性介绍
// CupertinoTabScafold 属性
//// tabBar---->@required底部选项卡
//// tabBuilder---->页面构造器
//// controller---->控制器，控制默认选项卡被选中
//// backgroundColor---->背景色，没啥效果
//// resizeToAvoidBottomInset---->是否调整自身大小来避免底部嵌入，默认为true。例如键盘谈起输入时防止输入框和键盘重叠遮挡
// CupertinoTabView
//// builder---->构造器，为不同选项卡提供不同的页面
//// navigatorKey---->导航key
//// defaultTitle---->默认title
//// routes---->路由
//// onGenerateRoute---->拦截路由
//// onUnknownRoute---->未知路由
//// navigatorObservers---->const <NavigatorObserver>[]为CupertinoTabView创建的导航提供观察者List

void main() {
  runApp(
    MaterialApp(
      home: FMCupertinoTabScaffoldVC(),
    ),
  );
}

class FMCupertinoTabScaffoldVC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FMCupertinoTabScaffoldState();
  }
}

class FMCupertinoTabScaffoldState extends State<FMCupertinoTabScaffoldVC> {
  @override
  Widget build(BuildContext context) {
    print('FMCupertinoTabScaffoldState build($context)');
    return CupertinoTabScaffold(
      tabBar: _cupertinoTabBar(), //选项卡
      controller: CupertinoTabController(initialIndex: 2),
      backgroundColor: Colors.yellow,
      tabBuilder: (context, index) {
        // print('tabBuilder: (context=>$context, index=>$index)');
        return CupertinoTabView(
          // 路由设置
          routes: {
            URI_MUSIC: (context) {
              print('routes -> URI_MUSIC');
              return FMMusicPage();
            },
            URI_CHAT: (context) {
              print('routes -> URI_CHAT');
              return FMChatPage();
            },
            URI_BUY: (context) {
              print('routes -> URI_BUY');
              return FMBuyPage();
            },
            URI_VIDEO: (context) {
              print('routes -> URI_VIDEO');
              return FMVideoPage();
            },
          },
          // 构建函数， 为每个选项卡提供不同页面
          builder: (context) {
            switch (index) {
              case 0:
                print('builder FMMusicPage');
                return FMMusicPage(count: index);
              case 1:
                print('builder FMChatPage');
                return FMChatPage(count: index);
              case 2:
                print('builder FMBuyPage');
                return FMBuyPage(count: index);
              case 3:
                print('builder FMVideoPage');
                return FMVideoPage(count: index);
              default:
                print('builder Container');
                return Container();
            }
          },
        );
      },
    );
  }

  CupertinoTabBar _cupertinoTabBar() {
    return CupertinoTabBar(
      // 点击回调
      onTap: (index) {
        print("tab Index = $index");
      },
      // currentIndex: 2, // 设置默认选中位置
      backgroundColor: Colors.lightBlueAccent,
      //tabbar背景色
      activeColor: Colors.white,
      //图标高亮颜色
      inactiveColor: Colors.grey,
      //图标未选中颜色
      iconSize: 25,
      //图标大小
      // 边框
      border: Border(
        top: BorderSide(width: 3, color: Colors.red),
      ),
      items: [
        _bottomNavigationBarItem(Icons.add, '第零个'),
        _bottomNavigationBarItem(Icons.add, '第一个'),
        _bottomNavigationBarItem(Icons.add, '第二个'),
        _bottomNavigationBarItem(Icons.add, '第三个'),
      ],
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
    IconData activeIcon,
    String title,
  ) {
    print('_bottomNavigationBarItem activeIcon title=$title');
    return BottomNavigationBarItem(
      icon: Icon(Icons.ac_unit), // 图标
      activeIcon: Icon(activeIcon), // 高亮图标
      title: Text("$title"), // 标题
      // 背景色，仅在BottomNavigationBar中生效，在ios风格组件中无效
      backgroundColor: Colors.yellow,
    );
  }
}

// 子选项卡页面
class FMMusicPage extends StatelessWidget {
  const FMMusicPage({Key? key, this.count = 0}) : super(key: key);
  final int count;

  @override
  Widget build(BuildContext context) {
    print('class FMMusicPage extends StatelessWidget count=$count');
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('音乐'),
      ),
      child: Center(child: Text('音乐')),
    );
  }
}

class FMChatPage extends StatelessWidget {
  const FMChatPage({Key? key, this.count = 2}) : super(key: key);
  final int count;

  @override
  Widget build(BuildContext context) {
    print('class FMChatPage extends StatelessWidget count=$count');
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Chat'),
      ),
      child: Center(
        child: CupertinoButton(
          child: Text('点我Push音乐页面'),
          onPressed: () {
            Navigator.pushNamed(context, URI_CHAT);
          },
        ),
      ),
    );
  }
}

class FMBuyPage extends StatelessWidget {
  const FMBuyPage({Key? key, this.count = 2}) : super(key: key);
  final int count;

  @override
  Widget build(BuildContext context) {
    print('class FMBuyPage extends StatelessWidget count=$count');
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('购物'),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            Navigator.pushNamed(context, URI_BUY);
          },
          child: Text('点我 Push 聊天页面'),
        ),
      ),
    );
  }
}

class FMVideoPage extends StatelessWidget {
  const FMVideoPage({Key? key, this.count = 3}) : super(key: key);
  final int count;

  @override
  Widget build(BuildContext context) {
    print('class FMVideoPage extends StatelessWidget count=$count');
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('视频'),
      ),
      child: Center(
        child: CupertinoButton(
          child: Text('点我 Push 购物页面'),
          onPressed: () {
            Navigator.pushNamed(context, URI_VIDEO);
          },
        ),
      ),
    );
  }
}
