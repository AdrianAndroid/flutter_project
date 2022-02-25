import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/banner.dart';

//https://www.wanandroid.com/banner/json

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banner',
      home: Scaffold(
        appBar: AppBar(title: Text('Banner')),
        body: Container(child: BannerPage()),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BannerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BannerPage();
}

class _BannerPage extends State<BannerPage> {
  List<BannerItem> datas = [];

  @override
  void initState() {
    getHomeData();
    super.initState();
  }

  getHomeData() async {
    datas.addAll([
      BannerItem.defaultBannerItem(
        'https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png',
        '一起来做个App吧',
      ),
      BannerItem.defaultBannerItem(
        'https://www.wanandroid.com/blogimgs/62c1bd68-b5f3-4a3c-a649-7ca8c7dfabe6.png',
        '我们新增了一个常用导航Tab~',
      ),
      BannerItem.defaultBannerItem(
        'https://www.wanandroid.com/blogimgs/90c6cc12-742e-4c9f-b318-b912f163b8d0.png',
        '"flutter 中文社区',
      ),
    ]);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          BannerWidget(
            180.0,
            datas,
            bannerPress: (pos, item) {
              print('bannerPress pos=>$pos, item=$item');
            },
          ),
        ],
      ),
    );
  }
}
