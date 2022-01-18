import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// name                     description
// Provider                 The most basic form of provider. It takes a value and exposes it, whatever the value is.
// ListenableProvider       A specific provider for Listenable object. ListenableProvider will listen to the object and ask widgets which depend on it to rebuild whenever the listener is called.
// ChangeNotifierProvider   A specification of ListenableProvider for ChangeNofifier. It will automatically call ChangeNotifier.dispose when needed.
// ValueListenerProvider    Listen to a ValueListenable and only expose ValueListenable.value.
// StreamProvider           Listen to a Stream and expose the latest value emitted.
// FutureProvider           Takes a Future and updates dependents when the future completes.

void main() {
  // runApp(
  //     ChangeNotifierProvider(
  //       create: (context) => Counter(),
  //       child: TestSTL(),
  //     ),
  // );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>Counter()),
        //Provider(create: (context)=>Counter2()),
        ListenableProvider(create: (contxt)=>Counter2()),
      ],
      child: TestSTL(),
    ),
  );
}

class TestSTL extends StatefulWidget{
  @override
  _TestSTLState createState() => _TestSTLState();
}

class _TestSTLState extends State<TestSTL> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "hello",
      home: Scaffold(
        appBar: AppBar(title: Text("Hi~")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You have pushed the  button this many times:'),
              Consumer<Counter>(
                builder: (context, counter, child) => Text(
                  '${counter.count}',
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
              Text('You have pushed the  button this many times:'),
              Consumer<Counter2>(
                builder: (context, cc, child) => Text(
                  '${context.watch<Counter2>().num}',
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<Counter>(context, listen: false).addCount();
            Provider.of<Counter2>(context, listen: false).addNum();
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class Counter extends ChangeNotifier {
  // 这里也可以使用with来进行实现
  int _count = 0; //数值计算
  int get count => _count;

  addCount() {
    _count++;
    notifyListeners();
  }
}

class Counter2 extends ChangeNotifier {
  int  num = 13;
  addNum() {
    ++num;
    notifyListeners();
  }
}