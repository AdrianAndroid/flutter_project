import 'package:flutter/material.dart';

class ProviderHome extends StatefulWidget {
  const ProviderHome({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  _ProviderHomeState createState() => _ProviderHomeState();

  void test() {}
}

class _ProviderHomeState extends State<ProviderHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Hello Provider!'),
      ),
    );
  }
}
