import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_project/widget/sample_list_item.dart';

main() {
  runApp(MaterialApp(
    title: 'EasyRefresh',
    theme: ThemeData(primarySwatch: Colors.orange),
    home: FirstRefreshPage(),
  ));
}

/// 首次刷新示例
class FirstRefreshPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FirstRefreshPageState();
}

class FirstRefreshPageState extends State<FirstRefreshPage> {
  // 总数
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('firstRefresh'),
        backgroundColor: Colors.white,
      ),
      body: EasyRefresh.custom(
        firstRefresh: true,
        firstRefreshWidget: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: SizedBox(
              height: 200,
              width: 300,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      child: SpinKitHourGlass(
                        color: Theme.of(context).primaryColor,
                        size: 25.0,
                      ),
                    ),
                    Container(
                      child: Text('loading'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => SampleListItem(),
              childCount: _count,
            ),
          )
        ],
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            if (mounted) {
              setState(() {
                _count = 20;
              });
            }
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            if (mounted) {
              setState(() {
                _count += 20;
              });
            }
          });
        },
      ),
    );
  }
}
