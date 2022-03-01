import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_project/widget/sample_list_item.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

main() {
  runApp(MaterialApp(
    title: 'EasyRefresh',
    theme: ThemeData(primarySwatch: Colors.orange),
    home: SwiperPage(),
  ));
}

/// Swiper示例
class SwiperPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SwiperPageState();
}

class SwiperPageState extends State<SwiperPage> {
  // 条目总数
  int _count = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh.builder(
        builder: (context, physics, header, footer) {
          return CustomScrollView(
            physics: physics,
            slivers: [
              SliverAppBar(
                expandedHeight: 100.0,
                pinned: true,
                backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  title: Text('Swiper'),
                ),
              ),
              header!,
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      height: 210.0,
                      child: ScrollNotificationInterceptor(
                        child: Swiper(
                          itemBuilder: (context, index) {
                            return SampleListItem(direction: Axis.horizontal);
                          },
                          itemCount: 5,
                          viewportFraction: 0.8,
                          scale: 0.9,
                          autoplay: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => SampleListItem(),
                  childCount: _count,
                ),
              ),
              footer!,
            ],
          );
        },
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            if (mounted) {
              _count = 20;
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
