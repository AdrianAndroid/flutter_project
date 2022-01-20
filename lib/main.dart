import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class TestProviderModel with ChangeNotifier, DiagnosticableTreeMixin {
  int _number = 0;

  int get number => _number;

  set number(int value) {
    _number = value;
    notifyListeners();
  }

  void addNumber() {
    _number++;
    notifyListeners();
  }
}

class UserModel {
  String name;
  String userID;
  bool isAuthor;
  bool isVIP;

  UserModel(this.name, this.userID, this.isAuthor, this.isVIP);
}

class UserProviderModel with ChangeNotifier, DiagnosticableTreeMixin {
  UserModel _user;

  UserProviderModel(this._user);

  set user(UserModel value) {
    _user = value;
    notifyListeners();
  }
}

void main() {
  List<SingleChildWidget> providerList = [
    ChangeNotifierProvider(create: (_) => TestProviderModel()),
    ChangeNotifierProvider(
      create: (_) => UserProviderModel(UserModel("cy", "1", true, true)),
    )
  ];

  runApp(
    MultiProvider(
      providers: providerList,
      child: TestProvider(),
    ),
  );
}

class TestProvider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestProviderState();
}

class _TestProviderState extends State<TestProvider> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('测试provider')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChildOne(),
              ChildTwo(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            context.read<TestProviderModel>().addNumber();
          },
        ),
      ),
    );
  }
}

class ChildOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChildOneState();
}

class ChildTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChildTwoState();
}

class _ChildOneState extends State<ChildOne> {
  @override
  Widget build(BuildContext context) {
    print('1build');
    return Container(
      child: Text('1number = ${context.watch<TestProviderModel>()._number}'),
    );
  }
}

class _ChildTwoState extends State<ChildTwo> {
  @override
  Widget build(BuildContext context) {
    print('2build');
    return Container(
      child: Consumer2<TestProviderModel, UserProviderModel>(
        builder: (context, testProvider, userProvider, child) {
          return Text(
              'testProviderNumber:${testProvider.number}\n用户:${userProvider._user.name}');
        },
      ),
    );
  }
}
