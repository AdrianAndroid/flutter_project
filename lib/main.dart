import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_project/widget/list_item.dart';

// Flutter 给列表增加下拉刷新和上滑加载更多功能
// https://www.jb51.net/article/213385.htm

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // App名字
      title: 'EasyRefresh',
      // App主题
      theme: ThemeData(primarySwatch: Colors.orange),
      // 主页
      home: _Example(),
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
    );
  }
}

class _Example extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExampleState();
}

class _ExampleState extends State<_Example> {
  late EasyRefreshController _controller;
  late ScrollController _scrollController;

  // 条目总数
  int _count = 20;

  // 反向
  bool _reverse = false;

  // 方向
  Axis _direction = Axis.vertical;

  // Header浮动
  bool _headerFloat = false;

  // 无限加载
  bool _enableInfinitedLoad = true;

  // 控制结束
  bool _enableControlFinish = false;

  // 任务独立
  bool _taskIndependence = false;

  // 震动
  bool _vibration = true;

  // 是否开启刷新
  bool _enableRefresh = true;

  // 是否开启加载
  bool _enableLoad = true;

  // 顶部回弹
  bool _topBouncing = true;

  // 底部回弹
  bool _bottomBouncing = true;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基本使用'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return _buildModalMenu();
                  },
                );
              },
              icon: Icon(Icons.menu)),
        ],
      ),
      body: Center(),
    );
  }

  _buildModalMenu() {
    return StatefulBuilder(builder: (context, state) {
      return EasyRefresh.custom(slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            // 列表方向
            ListItem(
              title: "direction",
              describe: 'listDirection',
              rightWidget: Container(
                child: Row(
                  children: [
                    Text('vertical'),
                    Radio(
                      value: Axis.vertical,
                      groupValue: _direction,
                      onChanged: (axis) {
                        setState(() {
                          _direction = Axis.vertical;
                        });
                        state(() {});
                      },
                    ),
                    Text('horizontal'),
                    Radio(
                      groupValue: _direction,
                      value: Axis.horizontal,
                      onChanged: (axis) {
                        setState(() {
                          _direction = Axis.horizontal;
                        });
                        state(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
            // 反向
            ListItem(
              title: "reverse",
              describe: "listReverse",
              rightWidget: Center(
                child: Switch(
                  value: _reverse,
                  onChanged: (reverse) {
                    setState(() {
                      _reverse = reverse;
                    });
                    state(() {});
                  },
                ),
              ),
            ),
            // 无限加载
            ListItem(
              title: 'infiniteLoad',
              describe: 'infiniteLoadDescribe',
              rightWidget: Center(
                child: Switch(
                  value: _enableInfinitedLoad,
                  onChanged: (infinite) {
                    setState(() {
                      _enableInfinitedLoad = infinite;
                    });
                    state(() {});
                    _controller.resetLoadState();
                  },
                ),
              ),
            ),
            // 控制结束
            ListItem(
              title: 'controlFinish',
              describe: 'controlFinishDescribe',
              rightWidget: Center(
                child: Switch(
                  value: _enableControlFinish,
                  onChanged: (control) {
                    setState(() {
                      _enableControlFinish = control;
                    });
                    state(() {});
                  },
                ),
              ),
            ),
            // 任务独立
            ListItem(
              title: 'taskIndependence',
              describe: 'taskIndependenceDescribe',
              rightWidget: Center(
                child: Switch(
                  value: _taskIndependence,
                  onChanged: (independence) {
                    setState(() {
                      _taskIndependence = independence;
                    });
                    state(() {});
                  },
                ),
              ),
            ),
            // Header浮动
            ListItem(
              title: 'headerFloat',
              describe: 'headerFloatDescribe',
              rightWidget: Center(
                child: Switch(
                  value: _headerFloat,
                  onChanged: (float) {
                    setState(() {
                      _headerFloat = float;
                    });
                    state(() {});
                  },
                ),
              ),
            ),
            // 震动
            ListItem(
              title: 'vibration',
              describe: 'vibrationDescribe',
              rightWidget: Center(
                child: Switch(
                  value: _vibration,
                  onChanged: (vibration) {
                    setState(() {
                      _vibration = vibration;
                    });
                    state(() {});
                  },
                ),
              ),
            ),
            // 刷新开关
            ListItem(
              title: 'refreshSwitch',
              describe: 'refreshSwitchDescribe',
              rightWidget: Center(
                child: Switch(
                  value: _enableRefresh,
                  onChanged: (refresh) {
                    setState(() {
                      _enableRefresh = refresh;
                      if (!_topBouncing) {
                        _topBouncing = true;
                      }
                      state(() {});
                    });
                  },
                ),
              ),
            ),
            // 加载开关
            ListItem(
              title: 'loadSwitch',
              describe: 'loadSwitchDescribe',
              rightWidget: Center(
                child: Switch(
                  value: _enableLoad,
                  onChanged: (load) {
                    setState(() {
                      _enableLoad = load;
                      if (!_bottomBouncing) {
                        _bottomBouncing = true;
                      }
                      state(() {});
                    });
                  },
                ),
              ),
            ),
            // 顶部回弹
            ListItem(
              title: 'topBouncing',
              describe: 'topBouncingDescribe',
              rightWidget: Center(
                child: Switch(
                    value: _topBouncing,
                    onChanged: _enableRefresh
                        ? null
                        : (bouncing) {
                            setState(() {
                              _topBouncing = bouncing;
                            });
                            state(() {});
                          }),
              ),
            ),
            // 底部回弹
            ListItem(
              title: 'bottomBouncing',
              describe: 'bottomBouncingDescribe',
              rightWidget: Center(
                child: Switch(
                  value: _bottomBouncing,
                  onChanged: _enableLoad
                      ? null
                      : (bouncing) {
                          setState(() {
                            _bottomBouncing = bouncing;
                          });
                          state(() {});
                        },
                ),
              ),
            ),
            SafeArea(child: SizedBox()),
          ]),
        ),
      ]);
    });
  }
}
