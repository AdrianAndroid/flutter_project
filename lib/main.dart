import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart'
    as extended;
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_project/widget/sample_list_item.dart';

main() {
  runApp(MaterialApp(
    title: 'EasyRefresh',
    theme: ThemeData(primarySwatch: Colors.orange),
    home: NestedScrollViewPage(),
  ));
}

/// NestedScrollView示例页面
class NestedScrollViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NestedScrollViewPageState();
}

class NestedScrollViewPageState extends State<NestedScrollViewPage>
    with SingleTickerProviderStateMixin {
  // Tab控制器
  late TabController _tabController;
  int _tabIndex = 0;

  // 列表
  int _listCount = 20;

  // 表格
  int _gridCount = 30;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: extended.NestedScrollView(
        pinnedHeaderSliverHeightBuilder: () {
          return MediaQuery.of(context).padding.top + kToolbarHeight;
        },
        innerScrollPositionKeyBuilder: () {
          if (_tabController.index == 0) {
            return Key('Tab0');
          } else {
            return Key('Tab1');
          }
        },
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text('NestedScrollView'),
              centerTitle: true,
              expandedHeight: 190.0,
              flexibleSpace: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Container(),
              ),
              floating: false,
              pinned: true,
            ),
          ];
        },
        body: Column(
          children: [
            PreferredSize(
              child: Card(
                color: Theme.of(context).primaryColor,
                elevation: 0.0,
                margin: EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                ),
                child: TabBar(
                  controller: _tabController,
                  onTap: (index) {
                    setState(() {
                      _tabIndex = index;
                    });
                  },
                  tabs: [
                    Tab(text: 'List'),
                    Tab(text: 'Grid'),
                  ],
                ),
              ),
              preferredSize: Size(double.infinity, 46.0),
            ),
            Expanded(
              child: IndexedStack(
                index: _tabIndex,
                children: [
                  extended.NestedScrollViewInnerScrollPositionKeyWidget(
                    Key('Tab0'),
                    EasyRefresh(
                      child: ListView.builder(
                        padding: EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          return SampleListItem();
                        },
                        itemCount: _listCount,
                      ),
                      onRefresh: () async {
                        await Future.delayed(Duration(seconds: 2), () {
                          if (mounted) {
                            setState(() {
                              _listCount = 20;
                            });
                          }
                        });
                      },
                      onLoad: () async {
                        await Future.delayed(Duration(seconds: 2), () {
                          if (mounted) {
                            setState(() {
                              _listCount += 10;
                            });
                          }
                        });
                      },
                    ),
                  ),
                  extended.NestedScrollViewInnerScrollPositionKeyWidget(
                    Key('Tab1'),
                    EasyRefresh(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 6 / 7,
                        ),
                        itemBuilder: (context, index) {
                          return SampleListItem(direction: Axis.horizontal);
                        },
                      ),
                      onRefresh: () async {
                        await Future.delayed(Duration(seconds: 2), () {
                          if (mounted) {
                            setState(() {
                              _gridCount = 30;
                            });
                          }
                        });
                      },
                      onLoad: () async {
                        await Future.delayed(Duration(seconds: 2), () {
                          if (mounted) {
                            setState(() {
                              _gridCount += 10;
                            });
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
