import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Flutter TextButton删除填充和内部填充 [英] Flutter TextButton Remove Padding and
// Inner Padding
// https://www.it1352.com/2255140.html


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
            SizedBox(height: 10),
            _buildButton3(),
            SizedBox(height: 5),
            _buildButton4(context),
            SizedBox(height: 5),
            _buttonButton5(context),
            SizedBox(height: 5),
            _buttonButton6(),
            SizedBox(height: 5),
            _buttonButton7(),
          ],
        ),
      ),
    );
  }

  _buttonButton7() => TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size(50, 30),
          alignment: Alignment.centerLeft,
        ),
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              Icons.backpack,
              size: 18,
            ),
            Text('Hello World!'),
            Text(' Other'),
          ],
        ),
      );

  _buttonButton6() => OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.only(top: 0, bottom: 0, right: 5, left: 5),
          side: BorderSide(
            width: 0.5,
            color: Colors.black54,
          ),
          primary: Colors.white.withOpacity(0.9),
        ),
        child: Text("Hello World!", style: TextStyle(color: Colors.black87)),
      );

  _buttonButton5(BuildContext context) => ButtonTheme(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        height: 10,
        minWidth: 15,
        padding: EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5),
        child: FlatButton(
          color: Colors.white.withOpacity(0.9),
          onPressed: () {},
          child: Text('Hello World'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: BorderSide(
              color: Colors.black87,
              width: 0.5,
            ),
          ),
        ),
      );

  _buildButton4(BuildContext context) => TextButton.icon(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(0),
          backgroundColor: Colors.black26,
        ),
        onPressed: () {},
        icon: Icon(Icons.share, color: Theme.of(context).primaryColor),
        label: Text('Hello World!'),
      );

  _buildButton2() => Container(
        alignment: Alignment.topLeft,
        // padding: EdgeInsets.all(1),
        // margin:new EdgeInsets.only(right:1.0),
        decoration: BoxDecoration(
          color: Colors.green,
          //每条列表项底部加一个边框
          border: Border(
            bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9)),
          ),
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
            child: TextButton(
              // color: Colors.blueGrey,
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "A. 海洋生态系统",
                  style: TextStyle(fontSize: 22.0, color: Colors.black),
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
