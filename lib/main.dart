import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// push / pushNamed
// // 效果相同， 一个直接压入，一个通过路由押入
// pushReplacement / pushReplacementNamed
// //
// popAndPushNamed

const ROUTE_ROOT = '/';
const ROUTE_A = '/A';
const ROUTE_B = '/B';
const ROUTE_C = '/C';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: ROUTE_R OOT,
      // routes: {
      //   ROUTE_A: (context) => Apage(),
      //   ROUTE_B: (context) => Bpage(),
      //   ROUTE_C: (context) => Cpage(),
      // },
      home: RootPage(),
    );
  }
}

List<Widget> commonWidgets(BuildContext context, List<Widget> mylist) {
  List<Widget> list = [
    ElevatedButton(
        onPressed: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          } else {
            print('不能pop');
          }
        },
        child: Text('pop')),
    ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Apage(),
          ));
        },
        child: Text('跳转到A')),
    ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Bpage(),
          ));
        },
        child: Text('跳转到B')),
    ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Cpage(),
          ));
        },
        child: Text('跳转到C')),
    ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Cpage()));
          // Navigator.of(context).pushReplacementNamed(ROUTE_A);
          // Navigator.of(context).popAndPushNamed(ROUTE_A);
        },
        child: Text('Replacement C')),
    ElevatedButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => Cpage()),
            (route) => route == null,
          );
        },
        child: Text('移除全部')),
    ElevatedButton(
        onPressed: () {
          // "/"及为RootPage, 标记后，移除到路由停止移除
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => Cpage()),
            (route) => route.settings.name == '/',
          );
          // Navigator.pushAndRemoveUntil(context,
          //     MaterialPageRoute(builder: (_) => Cpage()),
          //     ModalRoute.withName('/'));

          // Navigator.of(context).pushNamedAndRemoveUntil("/C", (Route router) => router.settings.name == "/");
          // 或
          // Navigator.of(context).pushNamedAndRemoveUntil("/C", ModalRoute.withName("/"));
        },
        child: Text('移除到RootPage停止')),
    ElevatedButton(
        onPressed: () {
          Navigator.of(context).popUntil((route) => route.settings.name == '/');
          // Navigator.of(context).popUntil(ModalRoute.withName('/'));
          // Navigator.of(context).popUntil((route) => route.isFirst);
        },
        child: Text('pop Until')),
  ];
  mylist.forEach((element) {
    list.add(element);
  });
  return list;
}

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  @override
  void initState() {
    print("----->initState  ${widget.toString()}");
    super.initState();
  }

  @override
  void dispose() {
    print("=====>dispose ${widget.toString()}");
    super.dispose();
  }
}

// 1。做好朋友圈展示面(丰富的兴趣爱好)
// 2。不要害怕失败，啥也不要管，就看对方是否给你窗口，省的消耗经历
// 3。
class RootPage extends StatefulWidget {
  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends BaseState<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RootPage')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: commonWidgets(context, [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 1000),
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation,
                          child: Cpage(),
                        );
                      },
                    ),
                  );
                },
                child: Text('跳转到C动画')),
          ]),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////
//Apage///////////////////////////////////////////
//////////////////////////////////////////////////
class Apage extends StatefulWidget {
  @override
  State<Apage> createState() => _ApageState();
}

class _ApageState extends BaseState<Apage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apage'),
        leading: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_left)),
      ),
      body: Column(
        children: commonWidgets(context, [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('pop'),
          ),
        ]),
      ),
    );
  }
}

//////////////////////////////////////////////////
//Bpage///////////////////////////////////////////
//////////////////////////////////////////////////
class Bpage extends StatefulWidget {
  @override
  State<Bpage> createState() => _BpageState();
}

class _BpageState extends BaseState<Bpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bpage')),
      body: Column(
        children: commonWidgets(context, []),
      ),
    );
  }
}

//////////////////////////////////////////////////
//Cpage///////////////////////////////////////////
//////////////////////////////////////////////////
class Cpage extends StatefulWidget {
  @override
  State<Cpage> createState() => _CpageState();
}

// 抱着了解不同的人,熟悉不同的人
// 和女生做朋友，扩展朋友圈
// 锻炼聊天的能力
// 锻炼社交直觉
class _CpageState extends BaseState<Cpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cpage')),
      body: Column(
        children: commonWidgets(context, []),
      ),
    );
  }
}
