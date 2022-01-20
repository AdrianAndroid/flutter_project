import 'package:flutter/material.dart';

class InheritedTestModel {
  final int count;

  const InheritedTestModel(this.count);
}

class InheritedContext extends InheritedWidget {
  // 数据
  final InheritedTestModel inheritedTestModel;

  // 点击+号的方法
  final Function() increment;

  // 点击-号的方法
  final Function() reduce;

  InheritedContext({
    Key? key,
    required this.inheritedTestModel,
    required this.increment,
    required this.reduce,
    required Widget child,
  }) : super(key: key, child: child);

  static InheritedContext? of(BuildContext context, {bool rebuild = true}) {
    if (rebuild) {
      return context.dependOnInheritedWidgetOfExactType<InheritedContext>();
    } else {
      final w = context
          .getElementForInheritedWidgetOfExactType<InheritedContext>()
          ?.widget;
      if (w is InheritedContext) {
        return w;
      } else {
        return context.dependOnInheritedWidgetOfExactType<InheritedContext>();
      }
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedContext oldWidget) {
    return inheritedTestModel != oldWidget.inheritedTestModel;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to Flutter",
      home: Scaffold(
        appBar: AppBar(title: Text('Hello')),
        body: InheritedWidgetTestContainer(),
      ),
    );
  }
}

class TestWidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 去InheritedContext里面取值,重新构建的时候
    final inheritedContext = InheritedContext.of(context);
    final inheritedTestModel = inheritedContext?.inheritedTestModel;
    print('TestWidgetA 中的count的值：${inheritedTestModel?.count}');
    return Padding(
      padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: RaisedButton(
        onPressed: inheritedContext?.increment,
        textColor: Colors.black,
        child: new Text('+'),
      ),
    );
  }
}

class TestWidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inheritedContext = InheritedContext.of(context);
    final inheritedTestModel = inheritedContext?.inheritedTestModel;
    print('TestWidgetB 中count的值:${inheritedTestModel?.count}');
    return Padding(
      padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: Text(
        '当前count:${inheritedTestModel?.count}',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}

class TestWidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inheritedContext = InheritedContext.of(context);
    final inheritedTestModel = inheritedContext?.inheritedTestModel;
    print('TestWidgetC 中count的值：${inheritedTestModel?.count}');
    return Padding(
      padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: RaisedButton(
        textColor: Colors.black,
        child: Text('-'),
        onPressed: inheritedContext?.reduce,
      ),
    );
  }
}

class InheritedWidgetTestContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InheritedWidgetTestContainerState();
}

class _InheritedWidgetTestContainerState
    extends State<InheritedWidgetTestContainer> {
  late InheritedTestModel inheritedTestModel;

  @override
  void initState() {
    inheritedTestModel = InheritedTestModel(0);
    super.initState();
  }

  _incrementCount() {
    setState(() {
      inheritedTestModel = InheritedTestModel(inheritedTestModel.count + 1);
    });
  }

  _reduceCount() {
    setState(() {
      inheritedTestModel = InheritedTestModel(inheritedTestModel.count - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('_InheritedWidgetTestContainerState build(BuildContext...');
    return InheritedContext(
      inheritedTestModel: inheritedTestModel,
      increment: _incrementCount,
      reduce: _reduceCount,
      child: Scaffold(
        appBar: AppBar(title: Text('InheritedWidgetTest')),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
              child: Text(
                '我们常使用的\nTheme.of(context).textTheme\nMediaQuery.of'
                '(context).size等\n就是通过InheritedWidget实现的',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            TestWidgetA(),
            TestWidgetB(),
            TestWidgetC(),
          ],
        ),
      ),
    );
  }
}
