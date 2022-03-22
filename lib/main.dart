import 'package:flutter/material.dart';

// https://www.jianshu.com/p/46cf3de34e72
// 找一个文档
// 通过LayoutBuilder组件可以获取父组件的约束尺寸

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('LayoutBuilder')),
        body: LayoutBuilderRoute(),
      ),
    );
  }
}

class ResponsiveColumn extends StatelessWidget {
  final List<Widget> children;

  const ResponsiveColumn({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 通过LayoutBuilder拿到父组件传递的约束，然后判断maxWidth是否小于200
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 200) {
          // 最大宽度小于200， 显示单列
          return Column(children: children, mainAxisSize: MainAxisSize.min);
        } else {
          // 大于200， 显示双列
          var _children = <Widget>[];
          for (var i = 0; i < children.length; i += 2) {
            if (i + 1 < children.length) {
              _children.add(
                Row(
                  children: [children[i], children[i + 1]],
                  mainAxisSize: MainAxisSize.min,
                ),
              );
            } else {
              _children.add(children[i]);
            }
          }
          return Column(
            children: _children,
            mainAxisSize: MainAxisSize.min,
          );
        }
      },
    );
  }
}

class LayoutBuilderRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _children = List.filled(6, Text('A'));
    // Column在本示例中在水平方向的最大宽度为屏幕的宽度
    return Column(
      children: [
        // 限制宽度为190，小于200
        SizedBox(width: 190, child: ResponsiveColumn(children: _children)),
        ResponsiveColumn(children: _children),
        LayoutLogPrint(child: Text('xx'))
      ],
    );
  }
}

class LayoutLogPrint<T> extends StatelessWidget {
  const LayoutLogPrint({Key? key, this.tag, required this.child})
      : super(key: key); //指定日志tag

  final Widget child;
  final T? tag;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      // assert在编译release版本时会被去除
      assert((){
        print('${tag ?? key ?? child} : $constraints');
        return true;
      }());
      return child;
    });
  }


}
