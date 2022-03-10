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
        body: Center(
          child: Column(
            children: [
              Text(
                '我是设置透明度下面的Widget...',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 36.0,
                  decoration: TextDecoration.lineThrough,
                  shadows: [
                    Shadow(
                      color: Colors.red,
                      offset: Offset(1, 1),
                      blurRadius: 1.9,
                    ),
                    Shadow(
                      color: Colors.black,
                      offset: Offset(0, 1),
                      blurRadius: 1.9,
                    ),
                    Shadow(
                      color: Colors.blue,
                      offset: Offset(0.5, 0.5),
                      blurRadius: 1.9,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              Opacity(
                opacity: 0.6,
                child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Text(
                        '我是设置透明度上面的Widget...',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 36.0,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
