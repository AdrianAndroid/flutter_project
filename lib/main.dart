import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// 6.11 自定义 Sliver
// https://book.flutterchina.club/chapter6/sliver.html

// Sliver布局协议
// 1。Viewport将当前布局和配置信息通过SliverConstraints传递给Sliver
// 2。Sliver确定自身的位置、绘制等信息，保存在geometry中（一个SliverGeometry类型的对象）
// 3。Viewport读取geometry中的信息来对Sliver进行布局和绘制

/*
class SliverConstraints extends Constraints {
    //主轴方向
    AxisDirection? axisDirection;
    //Sliver 沿着主轴从列表的哪个方向插入？枚举类型，正向或反向
    GrowthDirection? growthDirection;
    //用户滑动方向
    ScrollDirection? userScrollDirection;
    //当前Sliver理论上（可能会固定在顶部）已经滑出可视区域的总偏移
    double? scrollOffset;
    //当前Sliver之前的Sliver占据的总高度，因为列表是懒加载，如果不能预估时，该值为double.infinity
    double? precedingScrollExtent;
    //上一个 sliver 覆盖当前 sliver 的大小，通常在 sliver 是 pinned/floating
    //或者处于列表头尾时有效，我们在后面的小节中会有相关的例子。
    double? overlap;
    //当前Sliver在Viewport中的最大可以绘制的区域。
    //绘制如果超过该区域会比较低效（因为不会显示）
    double? remainingPaintExtent;
    //纵轴的长度；如果列表滚动方向是垂直方向，则表示列表宽度。
    double? crossAxisExtent;
    //纵轴方向
    AxisDirection? crossAxisDirection;
    //Viewport在主轴方向的长度；如果列表滚动方向是垂直方向，则表示列表高度。
    double? viewportMainAxisExtent;
    //Viewport 预渲染区域的起点[-Viewport.cacheExtent, 0]
    double? cacheOrigin;
    //Viewport加载区域的长度，范围:
    //[viewportMainAxisExtent,viewportMainAxisExtent + Viewport.cacheExtent*2]
    double? remainingCacheExtent;
}

const SliverGeometry({
  //Sliver在主轴方向预估长度，大多数情况是固定值，用于计算sliverConstraints.scrollOffset
  this.scrollExtent = 0.0,
  this.paintExtent = 0.0, // 可视区域中的绘制长度
  this.paintOrigin = 0.0, // 绘制的坐标原点，相对于自身布局位置
  //在 Viewport中占用的长度；如果列表滚动方向是垂直方向，则表示列表高度。
  //范围[0,paintExtent]
  double? layoutExtent,
  this.maxPaintExtent = 0.0,//最大绘制长度
  this.maxScrollObstructionExtent = 0.0,
  double? hitTestExtent, // 点击测试的范围
  bool? visible,// 是否显示
  //是否会溢出Viewport，如果为true，Viewport便会裁剪
  this.hasVisualOverflow = false,
  //scrollExtent的修正值：layoutExtent变化后，为了防止sliver突然跳动（应用新的layoutExtent）
  //可以先进行修正，具体的作用在后面 SliverFlexibleHeader 示例中会介绍。
  this.scrollOffsetCorrection,
  double? cacheExtent, // 在预渲染区域中占据的长度
})
*/

// Sliver布局模型和盒布局模型
// 两者布局流程基本相同：父组件告诉子组件约束信息>子组件根据父组件的约束确定自生大小>父组件获得子组件大小调整其位置。不同是：
// 1。父组件传递个子组件的约束信息不同。盒模型传递的是BoxConstraints，而Sliver的是通过SliverConstraints.
// 2。描述子组件布局信息的对象不同。盒模型的布局信息通过Size和offset描述，而Sliver的是通过SliverGeometry描述
// 3。布局的起点不同。Sliver布局的起点一般是Viewport，而盒模型布局的起点可以是任意的组件

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: Scaffold(
        appBar: AppBar(title: Text("SliverList学习")),
        body: SliverFlexibleHeaderDemo(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SliverFlexibleHeaderDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SliverFlexibleHeaderDemoState();
}

class SliverFlexibleHeaderDemoState extends State<SliverFlexibleHeaderDemo> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // 为了能使CustomScrollView拉到顶部时还能继续往下拉，必须让physics支持弹性效果
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: [
        // 我们需要实现的SliverFlexibleHeader组件
        SliverFlexibleHeader(
          visibleExtent: 200, //初始状态在列表中占用的布局高度
          // 为了能根据下啦状态变化来定制显示的布局，我们通过一个builder来动态构建布局
          builder: (context, availableHeight /*, direction*/) {
            return GestureDetector(
              onTap: () => print('tap'),
              child: Image(
                image: AssetImage("assets/sea.jpeg"),
                width: 50.0,
                height: availableHeight,
                alignment: Alignment.bottomCenter,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        buildSliverList(30),
      ],
    );
  }

  // 构建固定高度的SliverList，count为列表项属相
  Widget buildSliverList([int count = 5]) {
    return SliverFixedExtentList(
      itemExtent: 50,
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ListTile(title: Text('$index'));
        },
        childCount: count,
      ),
    );
  }

  // 构建 header
  Widget buildHeader(int i) {
    return Container(
      color: Colors.lightBlue.shade200,
      alignment: Alignment.centerLeft,
      child: Text("PersistentHeader $i"),
    );
  }
}

typedef SliverFlexibleHeaderBuilder = Widget Function(
  BuildContext context,
  double maxExtent,
  //ScrollDirection direction,
);

class SliverFlexibleHeader extends StatelessWidget {
  const SliverFlexibleHeader({
    Key? key,
    this.visibleExtent = 0,
    required this.builder,
  }) : super(key: key);

  final SliverFlexibleHeaderBuilder builder;
  final double visibleExtent;

  @override
  Widget build(BuildContext context) {
    return _SliverFlexibleHeader(
      visibleExtent: visibleExtent,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return builder(context, constraints.maxHeight);
        },
      ),
    );
  }
}

class _SliverFlexibleHeader extends SingleChildRenderObjectWidget {
  const _SliverFlexibleHeader({
    Key? key,
    required Widget child,
    this.visibleExtent = 0,
  }) : super(key: key, child: child);
  final double visibleExtent;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _FlexibleHeaderRenderSliver(visibleExtent);
  }

  @override
  void updateRenderObject(
      BuildContext context, _FlexibleHeaderRenderSliver renderObject) {
    renderObject..visibleExtent = visibleExtent;
  }
}

class _FlexibleHeaderRenderSliver extends RenderSliverSingleBoxAdapter {
  _FlexibleHeaderRenderSliver(double visibleExtent)
      : _visibleExtent = visibleExtent;

  double _lastOverScroll = 0;
  double _lastScrollOffset = 0;
  late double _visibleExtent = 0;

  set visibleExtent(double value) {
    // 可视长度发生变化，更新状态并重新布局
    if (_visibleExtent != value) {
      _lastOverScroll = 0;
      _visibleExtent = value;
      markNeedsLayout();
    }
  }

  @override
  void performLayout() {
    // 滑动距离大于_visibleExtent时则表示子节点已经在屏幕之外了
    if (child == null || (constraints.scrollOffset > _visibleExtent)) {
      geometry = SliverGeometry(scrollExtent: _visibleExtent);
      return;
    }

    // 测试overlap,下拉过程中overlap会一直变化.
    double overScroll = constraints.overlap < 0 ? constraints.overlap.abs() : 0;
    var scrollOffset = constraints.scrollOffset;

    // 在Viewport中顶部的可视空间为该 Sliver 可绘制的最大区域。
    // 1. 如果Sliver已经滑出可视区域则 constraints.scrollOffset 会大于 _visibleExtent，
    //    这种情况我们在一开始就判断过了。
    // 2. 如果我们下拉超出了边界，此时 overScroll>0，scrollOffset 值为0，所以最终的绘制区域为
    //    _visibleExtent + overScroll.
    double paintExtent = _visibleExtent + overScroll - constraints.scrollOffset;
    // 绘制高度不超过最大可绘制空间
    paintExtent = min(paintExtent, constraints.remainingPaintExtent);

    //对子组件进行布局，关于 layout 详细过程我们将在本书后面布局原理相关章节详细介绍，现在只需知道
    //子组件通过 LayoutBuilder可以拿到这里我们传递的约束对象（ExtraInfoBoxConstraints）
    child!.layout(
      constraints.asBoxConstraints(maxExtent: paintExtent),
      parentUsesSize: false,
    );

    //最大为_visibleExtent，最小为 0
    double layoutExtent = min(_visibleExtent, paintExtent);

    //设置geometry，Viewport 在布局时会用到
    geometry = SliverGeometry(
      scrollExtent: layoutExtent,
      paintOrigin: -overScroll,
      paintExtent: paintExtent,
      maxPaintExtent: paintExtent,
      layoutExtent: layoutExtent,
    );
  }
}
