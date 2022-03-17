import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const _channel = BasicMessageChannel(
    'com.example.messagechannel/interop',
    StringCodec(),
  );

  String? _platformMessage;

  void _sendMessage() async {
    final String? reply = await _channel.send('Hello World form Dart');
    print('_sendMessage reply = $reply');
  }

  @override
  void initState() {
    super.initState();

    // Receive messages from platform
    // _channel.setMessageHandler((String message) async {
    //   return 'Replay from Dart';
    // });
    _channel.setMessageHandler((message) async {
      print('Received message = $message');
      setState(() {
        _platformMessage = message;
      });
      return 'Reply from Dart';
    });

    _sendMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('$_platformMessage'),
        ],
      ),
    );
  }
}
