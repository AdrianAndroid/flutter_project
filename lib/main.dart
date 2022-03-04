import 'package:flutter/material.dart';

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
        appBar: AppBar(title: Text('AppBar')),
        body: Column(
          children: [
            _buildButton2(),
            _buildButton3(),
          ],
        ),
      ),
    );
  }

  _buildButton2() => Container(
        alignment: Alignment.topLeft,
        // padding: EdgeInsets.all(1),
        // margin:new EdgeInsets.only(right:1.0),
        decoration: BoxDecoration(
          color: Colors.green,
          //每条列表项底部加一个边框
          border:
              Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
        ),
        child: FlatButton(
          // padding: new EdgeInsets.only(right: 200),
          color: Colors.blueGrey,
          child: Text(
            "A. 海洋生态系统",
            style: TextStyle(fontSize: 22.0, color: Colors.white),
          ),
          onPressed: () {},
        ),
      );

  _buildButton3() => Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              color: Colors.blueGrey,
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "A. 海洋生态系统",
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
              ),
              onPressed: () {},
            ),
          )
        ],
      );
}
