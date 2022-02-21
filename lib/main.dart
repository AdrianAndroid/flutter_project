import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: Scaffold(
        appBar: AppBar(title: Text('StreamSubscription')),
        body: Center(
          child: Text('看源码文件夹'),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  _buildButton(String title, VoidCallback onPress) {
    return ElevatedButton(onPressed: onPress, child: Text(title));
  }
}
