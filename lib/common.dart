import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final List<Widget> slivers;
  final bool reverse;

  const AppScaffold({
    Key? key,
    required this.title,
    required this.slivers,
    this.reverse = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultStickyHeaderController(
      child: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: CustomScrollView(
          slivers: slivers,
          reverse: reverse,
        ),
        floatingActionButton: _FloatingActionButton(),
      ),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.adjust),
      backgroundColor: Colors.green,
      onPressed: () {
        final double offset =
            DefaultStickyHeaderController.of(context)!.stickyHeaderScrollOffset;
        PrimaryScrollController.of(context)?.animateTo(offset,
            duration: Duration(milliseconds: 300), curve: Curves.easeIn);
      },
    );
  }
}

class Header extends StatelessWidget {
  final String? title;
  final int index;
  final Color color;

  const Header({
    Key? key,
    this.title,
    required this.index,
    this.color = Colors.lightBlue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: color,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: Text(
        title ?? 'Header #$index',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
