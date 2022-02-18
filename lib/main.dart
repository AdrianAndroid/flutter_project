import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// https://www.jianshu.com/p/540dccbd5a51

// 在切换横竖屏时用到 SystemChrome，小菜理解它作为一个全局属性，
// 很像 Android 的 Application，功能很强大。
// setPreferedOrientations
////  在我们日常应用中可能会需要设置横竖屏，或锁定单方向屏幕等不同要求，通过 **setPreferredOrientations** 配合实现；简单可以按
////  portraitUp 上 / portraitDown 下 / landscapeLeft 右 / landscapeRight 左 ** 来区分；
////  Tips：landscapeLeft 是以 portraitUp 顺时针旋转 90 度；landscapeRight 是以逆时针旋转 90度，故是视觉相反。**

// Tips
//// portraitDown属性请注意，多方向时一般不会有效果，系统默认不会颠倒
//// 多方向设置时初始化方向分两种情况：
////// 第一种：当前重力感应方向不再设置多方向列表中，初始方向为列表第一个设置方法
////// 第二种：当前重力感应方向在设置多方向列表中，无论顺序第几位，默认均展示当前重力感应方向（非portraitDown）

void test() {
  // 竖直上
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // 竖直下
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);
  // 水平左
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  // 水平右
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);

  // 竖直方向
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // 水平方向
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  // 多方向
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);
}

// setEnabledSystemOverlays
////   **setEnabledSystemUIOverlays** 是指定在应用程序运行时可见的系统叠加，主要对状态栏的操作，读起来比较拗口，但是看测试用例就很明了；参数分 **top 顶部 / bottom 底部** 两种；
//// 1. SystemUiOverlay.top   默认隐藏底部虚拟状态栏(需手机支持虚拟状态栏设备)，即三大金刚键；获取焦点后展示状态栏，展示大小为去掉状态栏时整体大小；
//// 2. SystemUiOverlay.bottom   默认隐藏顶部虚拟状态栏，获取焦点后展示状态栏，展示大小为去掉状态栏时整体大小；
//// 3. 两者皆有   即默认情况，顶部底部状态栏均展示；
void test2() {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.top, SystemUiOverlay.bottom]);
}

// setSystemUIOverlayStyle
//// 1. systemNavigationBarColor 该属性仅用于 **Android** 设备且 **SDK >= O** 时，底部状态栏颜色；
//// 2. systemNavigationBarDividerColor 该属性仅用于 **Android** 设备且 **SDK >= P** 时，底部状态栏与主内容分割线颜色，效果不是很明显；
//// 3. systemNavigationBarIconBrightness   该属性仅用于 **Android** 设备且 **SDK >= O** 时，底部状态栏图标样式，主要是三大按键颜色；
//// 4. statusBarColor   该属性仅用于 **Android** 设备且 **SDK >= M** 时，顶部状态栏颜色；
//// 5. statusBarIconBrightness   该属性仅用于 **Android** 设备且 **SDK >= M** 时，顶部状态栏图标的亮度；但小菜感觉并不明显；
//// 6. statusBarBrightness   该属性仅用于 **iOS** 设备顶部状态栏亮度；

void test3() {
  // 1.
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(systemNavigationBarColor: Colors.pink));
  // 2.
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(systemNavigationBarDividerColor: Colors.yellow));
  // 3.
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(systemNavigationBarIconBrightness: Brightness.dark));
  // 4.
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.red));
  // 5.
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));
  // 6.
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarBrightness: Brightness.light));
}

// setApplicationSwitcherDescription   小菜个人理解该属性显示效果是在应用程序切换器相关的应用程序的当前状态时，但是小菜反复测试并没有实际效果，希望有理解的大神多多指点；
void test5() {
  SystemChrome.setApplicationSwitcherDescription(
          const ApplicationSwitcherDescription(
              label: "Demo Flutter", primaryColor: 0xFFE53935))
      .then((value) => runApp(MyApp()));
}

class ColorUtils {
  static Color getRandomColor() {
    return Color.fromARGB(
      255,
      Random.secure().nextInt(200),
      Random.secure().nextInt(200),
      Random.secure().nextInt(200),
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: Scaffold(
        appBar: AppBar(title: Text('SystemChrome')),
        body: OrgPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class OrgPage extends StatefulWidget {
  @override
  State<OrgPage> createState() => _OrgPageState();
}

class _OrgPageState extends State<OrgPage> {
  Brightness? b1 = Brightness.light;
  Brightness? b2 = Brightness.light;
  Brightness? b3 = Brightness.light;

  Brightness _toggleBrigthness(Brightness? brightness) {
    if (brightness == Brightness.dark) {
      print('return light');
      return Brightness.light;
    } else {
      print('return dark');
      return Brightness.dark;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OnePage();
                }));
              },
              child: Text('OnePage'),
            ),
            _buildOrientation(), //单方向
            _buildOrientation2(), //多方向
            _buildBigText('setEnabledSystemUIOverlays'),
            _build1Text1Button('SystemUiOverlay.top', () {
              SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
            }),
            _build1Text1Button('SystemUiOverlay.bottom', () {
              SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
            }),
            _build1Text1Button('两者皆有', () {
              SystemChrome.setEnabledSystemUIOverlays(
                  [SystemUiOverlay.top, SystemUiOverlay.bottom]);
            }),
            _buildBigText('setSystemUIOverlayStyle'),
            _build1Text1Button('systemNavigationBarColor', () {
              SystemChrome.setSystemUIOverlayStyle(
                SystemUiOverlayStyle(
                  systemNavigationBarColor: ColorUtils.getRandomColor(),
                ),
              );
            }),
            _build1Text1Button('systemNavigationBarDividerColor', () {
              SystemChrome.setSystemUIOverlayStyle(
                SystemUiOverlayStyle(
                  systemNavigationBarDividerColor: ColorUtils.getRandomColor(),
                ),
              );
            }),
            _build1Text1Button('systemNavigationBarIconBrightness', () {
              b1 = _toggleBrigthness(b1);
              SystemChrome.setSystemUIOverlayStyle(
                SystemUiOverlayStyle(
                  systemNavigationBarIconBrightness: b1,
                ),
              );
            }),
            _build1Text1Button('statusBarColor', () {
              SystemChrome.setSystemUIOverlayStyle(
                SystemUiOverlayStyle(
                  statusBarColor: ColorUtils.getRandomColor(),
                ),
              );
            }),
            _build1Text1Button('statusBarIconBrightness', () {
              b2 = _toggleBrigthness(b2);
              SystemChrome.setSystemUIOverlayStyle(
                SystemUiOverlayStyle(
                  statusBarIconBrightness: b2,
                ),
              );
            }),
            _build1Text1Button('statusBarBrightness', () {
              b3 = _toggleBrigthness(b3);
              SystemChrome.setSystemUIOverlayStyle(
                SystemUiOverlayStyle(
                  statusBarBrightness: b3,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  _buildBigText(String title) => Text(
        title,
        style: TextStyle(
          color: Colors.red,
          fontSize: 20,
        ),
      );

  _build1Text1Button(String title, VoidCallback onPress) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: onPress,
          child: Text('点击'),
        ),
        Text(title),
      ],
    );
  }

  _buildOrientation() => Row(
        children: [
          Text('单方向 '),
          ElevatedButton(
            onPressed: () {
              // 竖直上
              SystemChrome.setPreferredOrientations(
                  [DeviceOrientation.portraitUp]);
            },
            child: Text('上'),
          ),
          ElevatedButton(
            onPressed: () {
              SystemChrome.setPreferredOrientations(
                  [DeviceOrientation.portraitUp]);
            },
            child: Text('下'),
          ),
          ElevatedButton(
            onPressed: () {
              SystemChrome.setPreferredOrientations(
                  [DeviceOrientation.landscapeLeft]);
            },
            child: Text('左'),
          ),
          ElevatedButton(
            onPressed: () {
              SystemChrome.setPreferredOrientations(
                  [DeviceOrientation.landscapeRight]);
            },
            child: Text('右'),
          ),
        ],
      );

  _buildOrientation2() => Row(
        children: [
          Text('多方向 '),
          ElevatedButton(
            onPressed: () {
              // 竖直上
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown
              ]);
            },
            child: Text('竖直方向'),
          ),
          ElevatedButton(
            onPressed: () {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.landscapeLeft,
                DeviceOrientation.landscapeLeft
              ]);
            },
            child: Text('水平方向'),
          ),
          ElevatedButton(
            onPressed: () {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.landscapeLeft,
                DeviceOrientation.landscapeLeft,
                DeviceOrientation.portraitUp
              ]);
            },
            child: Text('多方向'),
          ),
        ],
      );
}

class OnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OnePage')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TwoPage();
              }));
            },
            child: Text('按钮'),
          ),
        ],
      ),
    );
  }
}

class TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TwoPage')),
      body: Center(
        child: Text('TwoPage'),
      ),
    );
  }
}
