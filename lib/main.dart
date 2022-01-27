import 'package:flutter/material.dart';

// Flutter实战*第二版
// https://book.flutterchina.club/chapter7/futurebuilder_and_streambuilder.html#_7-6-1-futurebuilder

void main() {
  runApp(
    MaterialApp(
      home: FutureBuilderPage(),
    ),
  );
}

class FutureBuilderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FutureBuilderState();
}

class FutureBuilderState extends State<FutureBuilderPage> {
  String title = 'FutureBuilder使用';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            title = title + '.';
            print(title);
          });
        },
        child: Icon(Icons.title),
      ),
      body: Center(
        child: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                print('ConnectionState.done');
                break;
              case ConnectionState.active:
                print('ConnectionState.active');
                break;
              case ConnectionState.waiting:
                print('ConnectionState.waiting');
                break;
              case ConnectionState.none:
                print('ConnectionState.none');
                break;
            }
            // 请求已结束
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                // 请求失败
                return Text("Error: ${snapshot.error}");
              } else {
                // 请求成功，显示数据
                return Text("Contents: ${snapshot.data}");
              }
            } else {
              // 请求未结束，显示loading
              return CircularProgressIndicator();
            }
          },
          future: mockNetworkData(),
        ),
      ),
    );
  }

  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => '我是从互联网上获取的数据');
  }
}
