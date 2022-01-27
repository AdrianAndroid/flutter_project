import 'package:flutter/material.dart';
import 'package:flutter_project/http_util.dart';

// 网上找到的一个例子
// https://blog.csdn.net/u011272795/article/details/83010974

void main() {
  runApp(
    MaterialApp(
      home: FutureBuilderPage(),
    ),
  );
}

class FutureBuilderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FutureBuilderState();
}

class FutureBuilderState extends State<FutureBuilderPage> {
  String title = 'FutureBuilder使用';

  Future _getData() async {
    return Http.get(
        path: 'http://api.douban.com/v2/movie/top250', data: {'count': '15'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            title = title + '.';
          });
        },
        child: Icon(Icons.title),
      ),
      body: FutureBuilder(
        builder: _buildFuture,
        future: _getData(),
      ),
    );
  }

  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        print('还没开始网络请求');
        return Text('还没有开始网络请求');
      case ConnectionState.active:
        print('active');
        return Text('ConnectionState.active');
      case ConnectionState.waiting:
        print('waiting');
        return Center(child: CircularProgressIndicator());
      case ConnectionState.done:
        print('done');
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        return _createListView(context, snapshot);
      default:
        return Container();
    }
  }

  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    List movies = [];
    return ListView.builder(
      itemBuilder: (context, index) => _itemBuilder(context, index, movies),
      itemCount: movies.length + 2,
    );
  }

  Widget _itemBuilder(BuildContext context, int index, List movies) {
    if (index.isOdd) {
      return Divider();
    }
    index = index ~/ 2;
    return ListTile(
      title: Text('title $index'),
      leading: Text('year $index'),
      trailing: Text('trailing $index'),
    );
  }
}
