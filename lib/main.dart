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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('normal')),
              TextButton(onPressed: () {}, child: Text('normal')),
              OutlinedButton(onPressed: () {}, child: Text('normal')),
              IconButton(onPressed: () {}, icon: Icon(Icons.thumb_up)),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.send),
                label: Text('发送'),
              ),
              OutlineButton.icon(
                icon: Icon(Icons.add),
                label: Text("添加"),
                onPressed: () {},
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text('添加'),
              ),
              TextButton.icon(
                icon: Icon(Icons.info),
                label: Text("详情"),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
