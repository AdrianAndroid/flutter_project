import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Commodity {
  final String name;
  final bool isSelected;

  Commodity(this.name, this.isSelected);
}

class CommodityProvider with ChangeNotifier {
  List<Commodity> _commodityList =
      List.generate(10, (index) => Commodity('Commodity Name_$index', false));

  get commodityList => _commodityList;

  get length => _commodityList.length;

  addToCart(int index) {
    Commodity commodity = commodityList[index];
    commodityList[index] = Commodity(commodity.name, !commodity.isSelected);
    notifyListeners();
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Selector')),
        body: Center(child: Text('Hello World!')),
      ),
    );
  }
}

class CommodityListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CommodityProvider(),
      // A 是我们从顶层获取的Provider的类型
      // B 是我们关心的具体类型，也就是获取到的Provider中真正对我们有用的类型，需要在Selector中返回该类型，这个Selector
      //    的刷新范围也从整个Provider编程了S.
      child: ListView.builder(
        itemCount: provi,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
