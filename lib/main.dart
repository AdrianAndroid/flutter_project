import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listener',
      home: Scaffold(
        appBar: AppBar(title: Text('Listener')),
        body: MyHomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

// MyHomePage
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _PointerMoveIndicatorState();
}

class _PointerMoveIndicatorState extends State<MyHomePage> {
  PointerEvent? _event;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildListener1(),
        SizedBox(height: 20),
        _buildListener2(),
      ],
    );
  }

  _buildListener1() => Listener(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 300.0,
          height: 150.0,
          child: Text(
            '${_event?.localPosition ?? ''}',
            style: TextStyle(color: Colors.white),
          ),
        ),
        onPointerDown: (PointerDownEvent event) => setState(() {
          print('onPointerDown $event');
          _event = event;
        }),
        onPointerMove: (PointerMoveEvent event) => setState(() {
          print('onPointerMove $event');
          _event = event;
        }),
        onPointerUp: (PointerUpEvent event) => setState(() {
          print('onPointerUp $event');
          _event = event;
        }),
      );

  _buildListener2() => Listener(
        child: IgnorePointer(
          child: Container(
            alignment: Alignment.center,
            color: Colors.green,
            width: 200.0,
            height: 50.0,
            child: Text(
              '${_event?.localPosition ?? ''}',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        onPointerDown: (PointerDownEvent event) => setState(() {
          print('onPointerDown $event');
          _event = event;
        }),
        onPointerMove: (PointerMoveEvent event) => setState(() {
          print('onPointerMove $event');
          _event = event;
        }),
        onPointerUp: (PointerUpEvent event) => setState(() {
          print('onPointerUp $event');
          _event = event;
        }),
      );
}
