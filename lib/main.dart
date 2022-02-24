import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const CITY_NAMES = {
  '北京': ['东城区', '西城区', '海淀区', '朝阳区', '石景山区', '顺义区'],
  '上海': ['黄浦区', '徐汇区', '长宁区', '静安区', '普陀区', '闸北区'],
  '广州': ['越秀', '海珠', '荔湾', '天河', '白云', '黄埔', '南沙'],
  '深圳': ['南山', '福田', '罗湖', '盐田', '龙岗', '宝安', '龙华'],
  '杭州': ['上城区', '下城区', '江干区', '拱墅区', '西湖区', '滨江区'],
  '苏州': ['姑苏区', '吴中区', '相城区', '高新区', '虎丘区', '工业园区', '吴江区'],
};

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listener',
      home: Scaffold(
        appBar: AppBar(title: Text('列表展开与收起')),
        body: Container(
          child: ListView(children: _buildList()),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  List<Widget> _buildList() {
    List<Widget> widgets = [];
    CITY_NAMES.keys.forEach((key) {
      widgets.add(_item(key, CITY_NAMES[key]));
    });
    return widgets;
  }

  Widget _item(String city, List<String>? subCities) {
    List<Widget> list =
        subCities?.map((subCity) => _buildSub(subCity))?.toList() ?? [];
    return ExpansionTile(
      title: Text(
        city,
        style: TextStyle(color: Colors.black54, fontSize: 20),
      ),
      children: list,
    );
  }

  Widget _buildSub(String subCity) {
    // 可以设置撑满宽度的盒子 称之为百分百布局
    return FractionallySizedBox(
      // 宽度因子 1为百分百撑满
      widthFactor: 1,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        child: Text(subCity),
      ),
    );
  }
}
