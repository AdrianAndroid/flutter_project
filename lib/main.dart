import 'package:flutter/material.dart';

// Flutter 基础布局Widgets之ConstrainedBox详解
// https://www.jianshu.com/p/951047be0e55
//
// constraints 其类型为BoxConstraints, 一些基本的约束
// [RenderBox]布局的不可变布局约束
// 如果且仅当以下所有关系成立时，[Size]才会遵从[BoxConstraints]:
// [minWidth]<=[Size.width]<=[maxWidth]
// [minHeight]<=[Size.height]<=[maxHeight]
// 约束本身必须满足这些关系：
// 0.0<=[minWidth]<=[maxWidth]<=[double.infinity]
// 0.0<=[minHeight]<=[maxHeight]<=[double.infinity]
// [double.infinity]是每个约束的合法值(比如想要获取最大的扩展宽度，可以将宽度值设为double.infinity)

// const BoxConstraints({
//   this.minWidth = 0.0,
//   this.maxWidth = double.infinity,
//   this.minHeight = 0.0,
//   this.maxHeight = double.infinity,
// })
// minWidth 满足约束条件的最小宽度
// maxWidth 满足约束条件的最大宽度； 可能是[double.infinity](1.0/1.0)
// minHeight 满足约束条件的最小宽度
// maxHeight 满足约束条件的最大宽度；可能是[double.infinity](1.0/1.0)
// child受约束的子child

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
      home: ConstrainedBoxLearn(),
    );
  }
}

class ConstrainedBoxLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ConstrainedBox')),
      body: Center(
        child: Container(
          child: Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(border: Border.all()),
            // 利用UnconstrainedBox消除之前限制
            child: UnconstrainedBox(
              // 对child进行约束
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 30,
                  minWidth: 30,
                  maxHeight: 150,
                  maxWidth: 150,
                ),
                child: Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.purple,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
