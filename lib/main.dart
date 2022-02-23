import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const ROUTE_ROOT = '/';
const ROUTE_A = '/A';
const ROUTE_B = '/B';
const ROUTE_C = '/C';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: ROUTE_R OOT,
      // routes: {
      //   ROUTE_A: (context) => Apage(),
      //   ROUTE_B: (context) => Bpage(),
      //   ROUTE_C: (context) => Cpage(),
      // },
      home: RootPage(),
    );
  }
}

// 1。做好朋友圈展示面
// 2。
// 3。
class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RootPage')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Apage(),
                  ));
                },
                child: Text('跳转到A')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Bpage(),
                  ));
                },
                child: Text('跳转到B')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Cpage(),
                  ));
                },
                child: Text('跳转到C')),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////
//Apage///////////////////////////////////////////
//////////////////////////////////////////////////
class Apage extends StatefulWidget {
  @override
  State<Apage> createState() => _ApageState();
}

class _ApageState extends State<Apage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apage'),
      ),
    );
  }
}

//////////////////////////////////////////////////
//Bpage///////////////////////////////////////////
//////////////////////////////////////////////////
class Bpage extends StatefulWidget {
  @override
  State<Bpage> createState() => _BpageState();
}

class _BpageState extends State<Bpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bpage')),
    );
  }
}

//////////////////////////////////////////////////
//Cpage///////////////////////////////////////////
//////////////////////////////////////////////////
class Cpage extends StatefulWidget {
  @override
  State<Cpage> createState() => _CpageState();
}

class _CpageState extends State<Cpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cpage')),
    );
  }
}
