// 这歌是在网络上找的一个例子
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// https://blog.csdn.net/qq939782569/article/details/111035348
// 参考链接
//https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png
//https://www.wanandroid.com/blogimgs/90c6cc12-742e-4c9f-b318-b912f163b8d0.png
//https://www.wanandroid.com/blogimgs/ab17e8f9-6b79-450b-8079-0f2287eb6f0f.png
//https://www.wanandroid.com/blogimgs/fb0ea461-e00a-482b-814f-4faca5761427.png
//https://www.wanandroid.com/blogimgs/62c1bd68-b5f3-4a3c-a649-7ca8c7dfabe6.png
//https://www.wanandroid.com/blogimgs/00f83f1d-3c50-439f-b705-54a49fc3d90d.jpg

const MAX_COUNT = 0x7fffffff;

// Item的点击事件
typedef void OnBannerItemClick(int position, BannerItem entity);

// 自定义ViewPager的每个页面显示
typedef Widget CustomBuild(int position, BannerItem entity);

class BannerWidget extends StatefulWidget {
  final double height;
  final List<BannerItem> datas;
  int duration;
  double pointRadius;
  Color selectedColor;
  Color unSelectedColor;
  Color textBackgroundColor;
  bool isHorizontal;

  OnBannerItemClick? bannerPress;
  CustomBuild? build;

  BannerWidget(
    this.height,
    this.datas, {
    Key? key,
    this.duration = 5000,
    this.pointRadius = 3.0,
    this.selectedColor = Colors.red,
    this.unSelectedColor = Colors.white,
    this.textBackgroundColor = const Color(0x99000000),
    this.isHorizontal = true,
    this.bannerPress,
    this.build,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => BannerState();
}

class BannerState extends State<BannerWidget> {
  Timer? timer;
  int selectedIndex = 0;
  PageController? controller;

  @override
  void initState() {
    double current = widget.datas.length > 0
        ? (MAX_COUNT / 2) - ((MAX_COUNT / 2) % widget.datas.length)
        : 0.0;
    controller = PageController(initialPage: current.toInt());
    _initPageAutoScroll();
    super.initState();
  }

  _initPageAutoScroll() {
    start();
  }

  @override
  void didUpdateWidget(covariant BannerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  start() {
    stop();
    timer = Timer.periodic(
      Duration(milliseconds: widget.duration),
      (timer) {
        if (widget.datas.length > 0 &&
            controller != null &&
            controller?.page != null) {
          controller?.animateToPage(
            controller?.page?.toInt() ?? 0 + 1,
            duration: Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        }
      },
    );
  }

  stop() {
    timer?.cancel();
    timer = null;
  }

  @override
  void dispose() {
    stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      color: Colors.black12,
      child: Stack(
        children: [
          getViewPager(),
          Align(
            alignment: Alignment.bottomCenter,
            child: IntrinsicHeight(
              child: Container(
                padding: EdgeInsets.all(6.0),
                color: widget.textBackgroundColor,
                child: getBannerTextInfoWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getViewPager() {
    return PageView.builder(
      itemCount: widget.datas.length > 0 ? MAX_COUNT : 0,
      controller: controller,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            if (widget.bannerPress != null) {
              widget.bannerPress?.call(
                selectedIndex,
                widget.datas[selectedIndex],
              );
            }
          },
          child: widget.build == null
              ? FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image:
                      widget.datas[index % widget.datas.length].itemImagePath,
                )
              : widget.build?.call(
                    index,
                    widget.datas[index % widget.datas.length],
                  ) ??
                  Container(),
        );
      },
    );
  }

  Widget getSelectedIndexTextWidget() {
    return widget.datas.length > 0 && selectedIndex < widget.datas.length
        ? widget.datas[selectedIndex].itemText
        : Text('');
  }

  Widget getBannerTextInfoWidget() {
    if (widget.isHorizontal) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 1, child: getSelectedIndexTextWidget()),
          Expanded(
            flex: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: circle(),
            ),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getSelectedIndexTextWidget(),
          IntrinsicWidth(
            child: Row(
              children: circle(),
            ),
          ),
        ],
      );
    }
  }

  List<Widget> circle() {
    List<Widget> circle = [];
    for (var i = 0; i < widget.datas.length; i++) {
      circle.add(Container(
        margin: EdgeInsets.all(2.0),
        width: widget.pointRadius * 2,
        height: widget.pointRadius * 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selectedIndex == i
              ? widget.selectedColor
              : widget.unSelectedColor,
        ),
      ));
    }
    return circle;
  }

  onPageChanged(index) {
    selectedIndex = index % widget.datas.length;
    setState(() {});
  }
}

class BannerItem {
  final String itemImagePath;
  final Widget itemText;

  BannerItem(this.itemImagePath, this.itemText);

  static BannerItem defaultBannerItem(String image, String text) {
    return BannerItem(
        image,
        Text(
          text,
          softWrap: true,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.0,
            decoration: TextDecoration.none,
          ),
        ));
  }
}
