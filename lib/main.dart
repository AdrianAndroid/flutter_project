import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

// class Home {
//   final String city = "Portlan";
//
//   Future<String> get fetchAddress {
//     final address = Future.delayed(Duration(seconds: 2), () {
//       return '1234 North Commercial Ave.';
//     });
//     return address;
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: Text('Material App Bar')),
        body: HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureProvider(
        create: (context) => Future.delayed(Duration(seconds: 2), ()=>'1234 '
            'North Commercial Ave.'),
        initialData: '数据正在初始化...',
        child: ChildBody(),
      ),
    );
  }
}

class ChildBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('${context.watch<String>()}'));
  }
}
