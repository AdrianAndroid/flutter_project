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
      home: ScaffoldRoute(),
    );
  }
}

class ScaffoldRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectedIndex = 1;
  bool change = true;
  final Widget bottom = BottomAppBar(
    color: Colors.white,
    shape: CircularNotchedRectangle(), //底部导航栏打一个圆形的洞
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.home)),
        SizedBox(), //中间位置空出
        IconButton(onPressed: () {}, icon: Icon(Icons.business)),
      ],
    ),
  );
  Widget? bottomWidget1;

  @override
  void initState() {
    super.initState();
    bottomWidget1 = bottom;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Name"),
        actions: [
          // 导航栏
          IconButton(onPressed: () {
            if (change) {
              bottomWidget1 = bottom;
            } else {
              bottomWidget1 = BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.business),
                    title: Text('Business'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.school),
                    title: Text('Scholl'),
                  ),
                ],
                currentIndex: _selectedIndex,
                fixedColor: Colors.blue,
                onTap: _onItemTapped,
              );
            }
            change = !change;
            setState(() {

            });
          }, icon: Icon(Icons.share))
        ],
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              // 打开抽屉菜单
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.dashboard, color: Colors.white), //自定义图标
          );
        }),
      ),
      drawer: MyDrawer(),
      //抽屉
      bottomNavigationBar: bottomWidget1,
      floatingActionButton: FloatingActionButton(
        // 悬浮按钮
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // 移除抽屉菜单顶部默认六百
        //removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 38.0),
                    child: ClipOval(
                      child: Image.asset('images/avator.jpeg', width: 80),
                    ),
                  ),
                  Text(
                    'Wendux',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView(children: [
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage account'),
                  ),
                ])),
          ],
        ),
      ),
    );
  }
}
