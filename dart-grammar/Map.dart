import 'dart:math';

main() {
  r('创建Map', () {
    var map1 = {"first": "Dart", 1: true, true: "2"};
    var map2 = const {"first": "Dart", 1: true, true: "2"};
    var map3 = Map()
      ..putIfAbsent('first', () => "Dart")
      ..putIfAbsent(1, () => true)
      ..putIfAbsent(true, () => "2");
  });

  r('常用操作', () {
    // [], length, keys, values
    // containsKey
    // containsValue
    // remove, forEach
    var map1 = {"first": "Dart", 1: true, true: "2"};
    print(map1);

    print(map1["first"]);
    print(map1[true]);
    map1[1] = false;
    print(map1);

    var map2 = const {1: "Dart", 2: "Java"};
    //map2[1] = 'Python'; //Unsupported operation: Cannot set value
    // inunmodifiable Map
    var map3 = Map();
    print(map3);

    var map = {"first": "Dart", "second": "Java", "third": "Python"};
    print(map.length);
    print('map.isEmpty -> ${map.isEmpty}');
    print('map.isNotEmpty -> ${map.isNotEmpty}');

    print(map.keys);
    print(map.values);

    print('map.containsKey(\'first\') -> ${map.containsKey('first')}');
    print('map.containsValue("C") -> ${map.containsValue("C")}');

    map.remove("third");
    print(map);
    map.forEach((key, value) {
      print('key = $key, value = $value');
    });

    var list = ["1", "2", "3"];
    print(list.asMap());
  });

  print('声明');
  r(
    '1. 不指定范型 (普通方式，不指定任何类型，这时testMap中K-V的类型均为dynamic)',
    () {
      // 直接赋值
      var map1 = {'aa': 'aaa', 'bb': 22, 'cc': true};
      var map2 = {'a': 'a2', 'b': 'b1'};
      // 间接赋值
      var map3 = Map();
      map3['aa'] = 'aaa';
      Map map4 = Map();
      map4['a'] = 'aaa';
    },
  );

  r(
    '指定范型 , 如果类型不匹配或者不兼容就会导致程序crash',
    () {
      //直接赋值
      var map1 = {'aa': 'aaa', 'bb': '22', 'cc': '333'};
      Map map2 = {'a': 'a1', 'b': 'b1', 'c': 'c1'};
      //间接赋值
      var map3 = Map();
      map3['aa'] = 'aaa';
      Map map4 = Map();
      map4['a'] = 'a1';
    },
  );

  r(
    '通过赋值的形式',
    () {
      //不使用类型操作符，从另一个map中初始化心的map，此时新的map中含有另一个map中的资源
      Map map1 = {'a': 'a1', 'b': 'b1', 'c': 'c1'};
      Map map2 = Map.castFrom(map1);
      print(map2);

      // 强制使用指定类型初始化map
      // 下面的例子表示testMap1的类型为<num, String>, 初始化Map时castFrom中map的类型
      // 为<int, String>, 如果类型不匹配或者不兼容就会导致程序crash
      Map<int, String> map3 = {1: 'a', 2: 'b', 3: 'c'};
      Map map4 = Map.castFrom(map3);
      print(map4);
      Map map5 = Map.castFrom(map3);
      print(map5);
      Map map6 = Map.castFrom(map3);
      print(map6);
    },
  );

  r(
    '创建不可变的Map',
    () {
      // 在目标的map6创建（复制）新的不可修改map7
      Map map6 = const {'one': 'Android', 'two': 'IOS', 'three': 'flutter'};
      // 根据list所提供的key value 来创建map
      List keys = ['one', 'two'];
      List values = ['Android', 'IOS'];
      Map map9 = Map.fromIterables(keys, values);
      print(map9);
    },
  );

  r(
    '属性',
    () {
      Map<String, int> map6 = {"a": 1, "b": 2};
      r('length', () => print(map6.length));
      r('isNotEmpty', () => print(map6.isNotEmpty));
      r('ieEmpty', () => print(map6.isEmpty));
      r('keys', () => print(map6.keys));
      r('values', () => print(map6.values));
      r('entries', () => print(map6.entries));
    },
  );
  r(
    '方法',
    () {
      r('1。 增，新增一个key-value', () {
        Map<String, int> map7 = {'a': 1, 'b': 2, 'c': 3, 'd': 4, 'e': 5};
        map7['f'] = 6; // 新增一个不存在的key
        print(map7);
      });
      r('2。 改，修改一个key的value', () {
        Map<String, int> map8 = {'a': 1, 'b': 2, 'c': 3, 'd': 4, 'e': 5};
        map8['a'] = 11;
        print(map8);
        r('update() 指定key的value做出修改', () {
          Map<String, int> map23 = {'a': 1, 'b': 2, 'c': 3};
          int result3 = map23.update('a', (value) => value * 2); //
          print(result3);
          // int result3_1 = map23.update('e', (value) => value + 2);
          // print(result3_1);//Invalid argument (key): Key not in map.: "e"
          int result4 = map23.update(
            'e',
            (value) => value * 2,
            ifAbsent: () => 10,
          );
          print(result4);
          print(map23);
        });
        r(
          'updateAll()根据参数函数的规则，批量修改map',
          () {
            Map<String, int> map24 = {'a': 1, 'b': 2, 'c': 3};
            map24.updateAll((key, value) => value * 2);
            print(map24);

            Map<String, int> map25 = {'a': 1, 'b': 2, 'c': 3};
            map25.updateAll((key, value) {
              if (key == 'a') return 10;
              if (key == 'b') return 20;
              return value * 2;
            });
            print(map25);
          },
        );
      });
      r(
        '3. 删',
        () {
          r('remove()删除一个key', () {
            Map<String, int> map9 = {'a': 1, 'b': 2, 'c': 3, 'd': 4, 'e': 5};
            map9.remove('b');
            print(map9);
          });
          r('removeWhere()根据条件批量删除', () {
            Map<String, int> map10 = {'a': 1, 'b': 2, 'c': 3, 'd': 4, 'e': 5};
            map10.removeWhere((key, value) => value > 3); //删除掉，符合参数函数的keyvalue对
            print(map10);
          });
        },
      );

      r(
        '4、查',
        () {
          r('containsKey()是否包含key', () {
            Map<String, int> map11 = {"a": 1, "b": 2, "c": 3, "d": 4, "e": 5};
            print(map11.containsKey('a')); // true是否包含key
            print(map11.containsKey('aa')); // false是否包含key
          });
          r('containsValue()是否包含value值', () {
            Map<String, int> map17 = {"a": 1, "b": 2, "c": 3};
            print(map17.containsValue(1)); //true
            print(map17.containsValue(4)); //false
          });
          r('forEach()遍历', () {
            Map<String, int> map12 = {"a": 1, "b": 2, "c": 3, "d": 4, "e": 5};

            map12.forEach((String key, int value) {
              print("$key $value");
            });
          });
          r('遍历时修改value值', () {
            Map<String, int> map13 = {'a': 1, 'b': 2, 'c': 3};
            map13.forEach((key, value) {
              print('$key  $value');
              map13['c'] = 4;
            });
          });
          r('注意：遍历时，新增或删除key  都会报错', () {
            Map<String, int> map14 = {"a": 1, "b": 2, "c": 3};

            map14.forEach((String key, int value) {
              print("$key $value");
              //map14["d"] = 4; // 报错
              //map14.remove("a"); // 报错
            });
          });
        },
      );
    },
  );

  r('其他', () {
    r('map() 遍历每个元素 根据参数函数，对keyvalue做出修改，可转换成其他泛型的Map', () {
      Map<String, int> map19 = {"a": 1, "b": 2, "c": 3};

      Map<int, String> map20 = map19.map((String key, int value) {
        return new MapEntry(value, key);
      });

      print(map20); //{1: a, 2: b, 3: c}
    });
    r('clear() 清空map', () {
      Map<String, int> map15 = {'a': 1, 'b': 2, 'c': 3};
      map15.clear();
      print(map15);
    });
    r('addAll() 整体合并另一个map 泛型要一致', () {
      Map<String, int> map16 = {"a": 1, "b": 2, "c": 3};
      Map<String, int> other = {"a": 1, "c": 4, "d": 7};
      map16.addAll(other); //key相同时value值后者覆盖前者，前者不存在时则添加进来
      print(map16); //{a: 1, b: 2, c: 4, d: 7}
    });
    r('addEntries() 合并两个map 如果key有重复，被合并的map的value覆盖前者', () {
      Map<String, int> map26 = {"a": 1, "b": 2, "c": 3};
      Map<String, int> map27 = {"a": 1, "b": 4, "d": 3, "e": 5};
      map26.addEntries(map27.entries);
      print(map26); //{a: 1, b: 4, c: 3, d: 3, e: 5}
    });
    r('putIfAbsent() 存在key就获取值，不存在则添加到map 然后返回值', () {
      Map<String, int> map18 = {"a": 1, "b": 2, "c": 3};
      int result = map18.putIfAbsent("a", () => (2)); //存在
      print(result); //1 获取key的值
      print(map18); //{a: 1, b: 2, c: 3} map不变
      int result2 = map18.putIfAbsent("d", () => (2)); //不存在
      print(result2); //2获取新的key的value
      print(map18); //{a: 1, b: 2, c: 3, d: 2} map改变
    });
    r('cast() 泛型类型提升为其父祖类', () {
      Map<String, int> map21 = {'a': 1, 'b': 2, 'c': 3};
      Map<Object, Object> map22 = map21.cast();
      map22['d'] = 33;
      print(map22);
    });
    r('where()，过滤集合中的值，并返回一个集合', () {
      // var whereList = testList.where((num) => num > 2).toList();
      // print(whereList); // [3, 4]。如果不用toList()则返回(3, 4)
    });
    r('any()，every()，判断集合中的值是否符合条件，并返回bool', () {
      //print(testList.any((num) => num > 2)); // true
    });
  });

  testPic();
}

void r(String title, Function f) {
  print(title);
  f.call();
  //print('----分割线----');
}

class Pic {
  final Map<String, String> multiLangText;

  Pic(this.multiLangText);
}

void testPic() {
  List<Pic> pics = [
    Pic({'default': '分类one'}),
    Pic({'default': '分类two'}),
    Pic({'default': '分类three'}),
    Pic({'default': '分类four'})
  ];

  for (int i = 0; i < pics.length; i++) {
    Pic pic = pics.elementAt(i);
    print(pic.multiLangText);
    print(pic.multiLangText['default']);
  }
}
