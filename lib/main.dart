import 'package:flutter/material.dart';
import 'package:flutter_project/localizations_const.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LOCAL_TYPE local_type = LOCAL_TYPE.CH;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: Scaffold(
        appBar: AppBar(
          title: Text('多语言/国际化'),
          centerTitle: true,
          backgroundColor: Colors.green,
          brightness: Brightness.dark,
          //automaticallyImplyLeading: false,
          leading: Icon(Icons.add),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  local_type = toggleLocal(local_type);
                });
              },
              icon: Icon(Icons.toggle_on),
            ),
          ],
        ),
        body: Center(
          child: Text(getLocalName(local_type)),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
