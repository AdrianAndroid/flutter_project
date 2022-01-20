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
                  Builder(builder: (context) {
                    var cart = context.watch<CartModel>();
                    return Text("Hello cart => ${cart.totalPrice}");
                  }),
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
