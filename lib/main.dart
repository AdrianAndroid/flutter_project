import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Item {
  Item(this.price, this.count);

  double price;
  int count;
}

class CartModel extends ChangeNotifier {
  // 用于保存购物车中商品列表
  final List<Item> _items = [];
  // 禁止改变购物车里的商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);
  // 购物车中商品的总价
  double get totalPrice =>
      _items.fold(0, (value, item) => value + item.count + item.price);
  // 将[item]添加到购物车。这里唯一一种可能从外部改变购物车的方法
  void add(Item item) {
    _items.add(item);
    //通知监听器（订阅者），重新构建InheritedProvider,更新状态。
    notifyListeners();
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
        body: ProviderRoute(),
      ),
    );
  }
}
class ProviderRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PreviderRouteState();
}

// 这是一个便捷类，会获得当前context和指定数据类型的Provider
class _Consumer<T> extends StatelessWidget {

  final Widget Function(BuildContext context, T? value) builder;

  const _Consumer({Key? key,required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return builder(
      context, context.watch<T>()
    );
  }
}

class _PreviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) => Center(
        child: ChangeNotifierProvider<CartModel>(
          create: (_) => CartModel(),
          child: Builder(
            builder: (context) {
              return Column(
                children: [
                  Text('Hi~'),
                  // 下面可以做如下优化
                  // 1. 需要显示调用ChangeNotifierProvider.of,
                  //    当APP内部依赖CartModel很多时，这样的代码将会很冗余
                  // 2. 语义不明确：由于ChangeNotifierProvider是订阅者，那么依赖CartModel
                  //    的Widget自然就是订阅者，其实也就是状态的消费者，如果我们用Builder
                  //    来构建，语义就不是很明确；如果我们能使用一个具有明确意义的Widget，比如就叫Consumer
                  //    ，这样最终的代码语义将会很明确，只要看到使用Consumer，我们就知道它是依赖某个跨组件或全局的状态。
                  // Builder(builder: (context) {
                  //   var cart = context.watch<CartModel>();
                  //   return Text("Hello cart => ${cart.totalPrice}");
                  // }),
                  _Consumer<CartModel>(
                    builder: (context, cart) => Text("总价:${cart?.totalPrice}"),
                  ),
                  Builder(builder: (context) {
                    print('ElevatedButton build');
                    return ElevatedButton(
                      onPressed: () {
                        // 给购物车中添加商品，添加后总价会更新
                        Provider.of<CartModel>(context, listen: false)
                            .add(Item(20.0, 1));
                      },
                      child: Text("添加商品"),
                    );
                  }),
                ],
              );
            },
          ),
        ),
      );
}
