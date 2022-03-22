import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class City {
  final name;
  final List<Region> regions;

  City(this.name, this.regions);
}

class Region {
  final name;
  final List<Street> streets;

  Region(this.name, this.streets);
}

class Street {
  final String name;

  Street(this.name);
}

const CITY_NAMES = {
  '北京': {
    '东城区': ['1111', '2222', '3333', '4444'],
    '西城区': ['1111', '2222', '3333', '4444'],
    '海淀区': ['1111', '2222', '3333', '4444'],
    '朝阳区': ['1111', '2222', '3333', '4444'],
    '石景山区': ['1111', '2222', '3333', '4444'],
    '顺义区': ['1111', '2222', '3333', '4444']
  },
  '上海': {
    '黄浦区': ['1111', '2222', '3333', '4444'],
    '徐汇区': ['1111', '2222', '3333', '4444'],
    '长宁区': ['1111', '2222', '3333', '4444'],
    '静安区': ['1111', '2222', '3333', '4444'],
    '普陀区': ['1111', '2222', '3333', '4444'],
    '闸北区': ['1111', '2222', '3333', '4444']
  },
  '广州': {
    '越秀': ['1111', '2222', '3333', '4444'],
    '海珠': ['1111', '2222', '3333', '4444'],
    '荔湾': ['1111', '2222', '3333', '4444'],
    '天河': ['1111', '2222', '3333', '4444'],
    '白云': ['1111', '2222', '3333', '4444'],
    '黄埔': ['1111', '2222', '3333', '4444'],
    '南沙': ['1111', '2222', '3333', '4444']
  },
  '深圳': {
    '南山': ['1111', '2222', '3333', '4444'],
    '福田': ['1111', '2222', '3333', '4444'],
    '罗湖': ['1111', '2222', '3333', '4444'],
    '盐田': ['1111', '2222', '3333', '4444'],
    '龙岗': ['1111', '2222', '3333', '4444'],
    '宝安': ['1111', '2222', '3333', '4444'],
    '龙华': ['1111', '2222', '3333', '4444']
  },
  '杭州': {
    '上城区': ['1111', '2222', '3333', '4444'],
    '下城区': ['1111', '2222', '3333', '4444'],
    '江干区': ['1111', '2222', '3333', '4444'],
    '拱墅区': ['1111', '2222', '3333', '4444'],
    '西湖区': ['1111', '2222', '3333', '4444'],
    '滨江区': ['1111', '2222', '3333', '4444']
  },
  '苏州': {
    '姑苏区': ['1111', '2222', '3333', '4444'],
    '吴中区': ['1111', '2222', '3333', '4444'],
    '相城区': ['1111', '2222', '3333', '4444'],
    '高新区': ['1111', '2222', '3333', '4444'],
    '虎丘区': ['1111', '2222', '3333', '4444'],
    '工业园区': ['1111', '2222', '3333', '4444'],
    '吴江区': ['1111', '2222', '3333', '4444']
  },
};

void main() => runApp(Demo());

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listener',
      home: Scaffold(
        appBar: AppBar(title: Text('列表展开与收起')),
        body: MyApp(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<City> citys = [];

  _buildCity() {
    citys.add(
      City(
        '北京',
        [
          Region(
            '东城区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '西城区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '海淀区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '朝阳区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '石景山区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '顺义区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
        ],
      ),
    );

    citys.add(
      City(
        '上海',
        [
          Region(
            '黄浦区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '徐汇区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '长宁区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '静安区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '普陀区区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '闸北区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
        ],
      ),
    );

    citys.add(
      City(
        '广州',
        [
          Region(
            '越秀',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '海珠',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '荔湾',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '天河',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '白云区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '黄埔',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '南沙',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
        ],
      ),
    );

    citys.add(
      City(
        '深圳',
        [
          Region(
            '南山',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '福田',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '罗湖',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '盐田',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '龙岗区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '宝安区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '龙华',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
        ],
      ),
    );

    citys.add(
      City(
        '杭州',
        [
          Region(
            '上城区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '下城区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '江干区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '拱墅区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '西湖区区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '滨江区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
        ],
      ),
    );

    citys.add(
      City(
        '苏州',
        [
          Region(
            '姑苏区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '吴中区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '相城区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '高新区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '虎丘区区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '工业园',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
          Region(
            '吴江区',
            [Street('1111'), Street('2222'), Street('3333'), Street('4444')],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    _buildCity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return Container(
      padding: EdgeInsets.only(top: 12),
      child: ListView(children: _buildCities()),
    );
  }

  List<Widget> _buildCities() {
    return citys
        .map((City city) => Container(
              //padding: EdgeInsets.only(left: 12, right: 12, top: 12),
              margin: EdgeInsets.only(left: 12, right: 12, bottom: 12),
              color: Colors.grey,
              child: ExpansionTile(
                title: Text(
                  city.name,
                  style: TextStyle(
                    color: Color(0xff242833),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                tilePadding: EdgeInsets.all(0),
                // childrenPadding: EdgeInsets.only(top: 100, bottom: 10),
                children: city.regions
                    .map((region) => _buildRegions(region))
                    .toList(),
              ),
            ))
        .toList();
  }

  Widget _buildRegions(Region region) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, bottom: 12),
      color: Colors.green,
      child: ExpansionTile(
        tilePadding: EdgeInsets.all(0),
        title: Text(
          region.name,
          style: TextStyle(
            color: Color(0xff242833),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        children:
            region.streets.map((street) => _buildSub(street.name)).toList(),
      ),
    );
  }

  Widget _buildSub(String subCity) {
    // 可以设置撑满宽度的盒子 称之为百分百布局
    return FractionallySizedBox(
      // 宽度因子 1为百分百撑满
      widthFactor: 1,
      child: Container(
        color: Colors.blue,
        margin: EdgeInsets.only(left: 12, right: 12, bottom: 8),
        child: Text(
          subCity,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
