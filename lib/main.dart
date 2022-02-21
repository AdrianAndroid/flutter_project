import 'package:flutter/material.dart';

// Directionality
// 用于确定文本和文字方向
// 继承关系： Object > Diagnosticable > DiagnosticableTree > Widget > ProxyWidget
// > InheritedWidget > Directionality

void main() => runApp(OrgApp());

class OrgApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextDirection textDirection = TextDirection.ltr;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: Scaffold(
        appBar: AppBar(title: Text('StreamSubscription')),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          textDirection = TextDirection.ltr;
                        });
                      },
                      child: Text('ltr')),
                  ElevatedButton(
                      onPressed: () {
                        textDirection = TextDirection.rtl;
                      },
                      child: Text('rtl')),
                ],
              ),
              Container(
                color: Colors.yellow,
                width: double.infinity,
                child: Directionality(
                  textDirection: textDirection,
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      "演示Directionality",
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
