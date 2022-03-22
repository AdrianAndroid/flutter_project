import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Listener',
      home: Scaffold(
        appBar: AppBar(title: Text('列表展开与收起')),
        body: MyApp(),
      ),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _panelIndex = -1;

  List dt = [
    {
      "name": "生鲜",
      "id": 0,
      "list": [
        {"name": "水果", "id": 11},
        {"name": "蔬菜", "id": 12},
        {"name": "禽肉蛋", "id": 13},
        {"name": "猪牛羊肉", "id": 14},
        {"name": "海鲜水产", "id": 15},
        {"name": "冷冻食品", "id": 16},
        {"name": "冷冻食品", "id": 17},
      ]
    },
    {
      "name": "食品饮料",
      "id": 1,
      "list": [
        {"name": "食品饮料1", "id": 21},
        {"name": "食品饮料2", "id": 22}
      ]
    },
    {
      "name": "母婴",
      "id": 2,
      "list": [
        {"name": "母婴1", "id": 31},
        {"name": "母婴2", "id": 32}
      ]
    },
    {
      "name": "生活日用",
      "id": 3,
      "list": [
        {"name": "生活日用1", "id": 41},
        {"name": "生活日用2", "id": 42}
      ]
    },
    {
      "name": "酒类",
      "id": 4,
      "list": [
        {"name": "酒类1", "id": 51},
        {"name": "酒类2", "id": 52}
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() => Column(
        children: [
          ExpansionPanelList(
            expansionCallback: (panelIndex, isExpand) {
              print(panelIndex);
              setState(() {
                _panelIndex = _panelIndex == panelIndex ? -1 : panelIndex;
              });
            },
            // 一个集合， 上部分标题， 下部分是list
            children: dt
                .map(
                  (item) => ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(title: Text(item['name']));
                    },
                    body: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 315,
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount: item['list'].length,
                        itemBuilder: (BuildContext context, int position) {
                          return Text(item['list'][position]['name']);
                        },
                      ),
                    ),
                    canTapOnHeader: true,
                    isExpanded: _panelIndex == item['id'],
                  ),
                )
                .toList(),
          ),
        ],
      );
}
