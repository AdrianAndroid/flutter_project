main() {
  demo1();
  demo2();
}

void demo2() {
  // [Dart学习] Dart数组List的相关方法总结
  // https://www.cnblogs.com/yiweiyihang/p/11805204.html
  print('===》一、初始化List');
  r(
    t: '非固定长度List',
    f: () {
      var testList = List.empty(); //List.filled(0, '');
      print(testList.length);
    },
  );
  r(
      t: '固定长度List',
      f: () {
        var testList2 = List.filled(2, null, growable: false);
        print(testList2.length);
      });
  r(
      t: '元素类型固定',
      f: () {
        var testList3 = <String>[];
        testList3.add("哈哈哈哈");
        //testList3.add(1);
      });
  r(
      t: '直接赋值',
      f: () {
        var testList = [123, 2312];
        print(testList.length);
        var testList5 = [true, '嘎嘎嘎', 1];
        testList5.add(1.6); //可以添加
      });
  print('===》二、常用字段');
  r(
      t: 'length属性，返回队列长度',
      f: () {
        var testList6 = [1, "2", 3, 34532, 555];
        //length属性，返回队列长度
        print(testList6.length);
      });
  r(
      t: 'isEmpty属性，返回列表是否为空',
      f: () {
        var testList6 = [1, "2", 3, 34532, 555];
        //isEmpty属性，返回列表是否为空
        print(testList6.isEmpty);
      });
  r(
      t: 'isNotEmpty属性，返回列表是否有元素',
      f: () {
        var testList6 = [1, "2", 3, 34532, 555];
        //isNotEmpty属性，返回列表是否有元素
        print(testList6.isNotEmpty);
      });
  r(
      t: 'first获取List中的第一个元素',
      f: () {
        var testList6 = [1, "2", 3, 34532, 555];
        //获取List中的第一个元素
        print("获取list中的第一个元素${testList6.first}");
      });
  r(
      t: 'last获取List中的最后一个元素',
      f: () {
        //获取List中最后一个元素
        var testList = []
          ..add(1)
          ..add(2)
          ..add(3)
          ..add(4); //[1,2,3,4];
        testList.add(14);
        testList.add('111');
        print(testList.last);
      });
  r(
      t: '[index] 获取List中某个位置上的元素（index为位置索引）',
      f: () {
        //获取List中某个位置上的元素
        var testList = <Object>[1, 2, 3, 4];
        testList.add(14);
        testList.add('111');
        print(testList[2]);
      });

  var testList6 = [1,"2",3,34532,555];
  print('===》三、数组List 增、删、改、查');
  print('===》四、其它操作方法');
  r(t: '排序', f: () {
    testList6.sort((a,b)=>a.toString().length.compareTo(b.toString().length));
    print('根据字符的长度排序：$testList6');
  });
  r(t: '将List倒序排列之后赋给一个新的list，', f: () {
    // 将List倒序排列之后赋值给一个新的list
    var testList8 = testList6.reversed;
    print('倒序排列List--->$testList8');
  });
  r(t: '根据position将list转换为对应的map Map<int,Element>', f: () {
    //根据position将list转换为对应的map Map<int,Element>
    //也就是[0:element ......]
    var testMap = testList6.asMap();
    print("testMap ====> $testMap");
  });
  r(t: '将List列表中的顺序打乱', f: () {
    //将List列表中的顺序打乱
    //可以传入一个Random对象作为可选参数
    print(testList6);
    testList6.shuffle();
    print("shuffle ===> $testList6");
  });
  r(t: '对列表中的数据做指定的操作', f: () {
    //对列表中的数据做指定的操作
    //下面的操作是在列表开始的时候加上“哈哈哈”这个字符串然后将后面的元素都拼接起来
    print(testList6);
    String str = testList6.fold("哈哈哈",(pre,item) => pre + item.toString() );
    print("test fold ====> $str");
  });
  r(t: 'List循环输出数据', f: () {
    //List循环输出数据
    testList6.forEach((item) => print(item));
  });
  r(t: '将List作为Iterator进行使用', f: () {
    //将List作为Iterator进行使用
    print(testList6);
    var testIterator = testList6.iterator;
    while(testIterator.moveNext()){
      print("testIterator: ${testIterator.current}");//输出当前值
    }
  });
  r(t: '使用join中的指定的字符串分隔List中的每个元素，并将其作为字符串返回', f: () {
    //使用join中的指定的字符串分隔List中的每个元素，并将其作为字符串返回
    //通过源码可以看出，首先会将List作为Iterator来使用
    //如果Iterator中没有元素，就直接返回一个空的字符串，注意不是null，而是 ""
    //接着判断join()中的参数如果为空或者为 ""，直接将Iterator中的元素拼接然后返回
    //如果join()中有参数，就是用join中的参数作为分隔符拼接Iterator中的元素然后返回
    String testJoin1 = testList6.join();
    String testJoin2 = testList6.join(",");
    String testJoin3 = testList6.join("哒哒哒");
    print("join中无参数：${testJoin1}");
    print("使用,作为分隔符${testJoin2}");
    print("想要在最后一个元素之前的元素后面都添加一个字符串然后返回${testJoin3}");
  });
  r(t: '下面的map方法和Map没有任何关系,执行结果和match更像', f: () {
    //下面的map方法和Map没有任何关系,执行结果和match更像
    //这个方法的执行逻辑是将List中的每个元素拿出来和map(f)中传入的f函数条件进行比较
    //如果符合条件就会返回true，否则就会返回false
    //同时返回的数据也是实现了Iterable的接口,注意是Iterable而不一定是List
    var testMap1 = testList6.map((item) => item.toString().length == 2);
    print("\ntestMap1:${testMap1}");
    print("testMap1: ${testMap1.runtimeType} \n");
  });
  r(t: '这个方法可以用，但是不知道具体的应用实例', f: () {
    //这个方法可以用，但是不知道具体的应用实例
    //这个方法首先会传入列表的第一个和第二个数据，对这两个数据进行传入的函数操作，然后会将函数的返回值作为下一次操作的第一个参数
    // print("${testList6}");
    // var testReduce = testList6.reduce((value,element) => checkReduce(value.toString(), element.toString()));
    // print("\ntestReduce ${testReduce} type is ${testReduce.runtimeType}\n");
  });
  r(t: '跳过前面多少个元素，返回一个SubListIterable，和subList的操作相似', f: () {
    //跳过前面多少个元素，返回一个SubListIterable，和subList的操作相似
    print(testList6);
    var testSkip = testList6.skip(2);
    print("\ntestSkip: ${testSkip}, and type is ${testSkip.runtimeType}\n");
  });
  r(t: '跳过列表中满足条件的前面的元素，从第一个元素开始查找，一直查找到不满足条件的元素为止', f: () {
    //跳过列表中满足条件的前面的元素，从第一个元素开始查找，一直查找到不满足条件的元素为止
    //条件由传入的函数参数决定
    testList6.insert(0, "呸呸呸");
    var testSkipWhile = testList6.skipWhile((item) => item.toString().length == 3);
    print("\ntestSkipWhile:${testSkipWhile},and type is ${testSkipWhile.runtimeType}\n");
  });
  r(t: '注意Set为没有顺序且不可重复的列表，数据转换到set之后圆List中的重复的数据会被删掉', f: () {
    //注意Set为没有顺序且不可重复的列表，数据转换到set之后圆List中的重复的数据会被删掉
    print(testList6);
    Set testSet1 = testList6.toSet();
    print("\ntestSet1:${testSet1} and type is ${testSet1.runtimeType}\n");
  });
}

void demo1() {
  print('List([int length]) 创建一个空数组或者 length 长度的数组');
  print(
      'List.filled(int length,E fill,{bool growable:false}) 创建一个list，每个元素共享相同的值，growable 表示是 list 长度是否可变，默认 false 固定长度');
  r(f: () {
    List a = List.filled(10, 1);
    print(a.toString());
  });

  print('List.from(iterable elements,{bool growable:true})');
  r(f: () {
    List a = List.from([1, "2", 3, 4]);
    print(a);
  });

  print('List.generate(int length, E generator(int index) 创建一个元素，每个位置创建一个新对象');
  r(f: () {
    List a = List.generate(10, (index) => index + 1);
    print(a);
  });

  print('List.unmodifiable(Iterable elements) 创建一个不可修改的 List');
  print('first List 中第一个元素');
  print('last List 中最后一个元素');
  print('length List 的长度');
  print('reversed 返回翻转 List 后的值，不改变原 List');
  print('add() 向数组中添加一个元素');
  print('addAll() 向数组中添加一个带有 Iterable 接口的类');
  r(f: () {
    List a = List.from([1, "2", 3, 4]);
    a.addAll([5, 6]);
    print(a);
  });

  print('asMap() 返回一个不可修改的 Map,keys 为 List 顺序');
  r(f: () {
    List a = List.from([1, "2", 3, 4]);
    Map b = a.asMap();
    print('b = $b');
    print('a = $a');
  });

  print('cast() 如果 List 中所有类型满足 R,正常工作并返回 List，如果有一个不满足，将会抛出错误');
  r(f: () {
    List a = List.from([1, "2", 3, 4]);
    print(a.cast<int>());
  });

  print('clear() 删除所有元素');
  print('fillRange(int start,int end,[E fillValue]) 在选择的范围插入一个新的元素');
  r(f: () {
    List a = [1, 2, 3, 4];
    print(a.getRange(1, 3)); // (2,3)
    print(a); // [1,2,3,4]
  });

  print('indexOf() 找到第一个满足条件的下标');
  r(f: () {
    List a = [1, 2, 3, 4];
    print(a.indexOf(3));
  });

  print('indexWhere(bool test(E element),[int start=0]) 迭代 list，返回第一个满足条件的下标');
  r(f: () {
    List a = [1, 2, 3, 4];
    print(a.indexWhere((element) => element % 2 == 0));
  });

  print('insert(int index,E element) 在 index 处插入一个元素');
  r(f: () {
    List a = [1, 2, 3, 4];
    a.insert(2, 'jsshou');
    print(a); // [1,2,jsshou,4]
  });

  print('insertAll(int index,iterable iterable) 在 index 处插入一个数组');
  r(f: () {
    List a = [1, 2, 3, 4];
    a.insertAll(2, ['jsshou', 'good']);
    print(a);
  });

  print('lastIndexOf(E element, [ int start ]) 类似 indexOf，迭代从后往前');
  print(
      'lastIndexWhere(bool test(E element), [ int start ]) 类似 indexWhere，迭代从后往前');
  print('remove(Object value) 删除第一个匹配到的 value');
  r(f: () {
    List a = [1, 2, 3, 4, 3];
    a.remove(3);
    print(a);
  });

  print('removeAt(int index) 删除 index 处的数据');
  r(f: () {
    List a = [1, 2, 3, 4, 3];
    a.removeAt(3);
    print(a);
  });

  print('removeLast() 删除最后一个数据');
  print('removeRange(int start,int end) 删除 start 到 end 处的数据');
  r(f: () {
    List a = [1, 2, 3, 4, 3];
    a.removeRange(2, 3);
    print(a); // [1,2,4,3]
  });

  print('removeWhere() 迭代数据，删除回调中返回 true 的数据');
  r(f: () {
    List a = [1, 2, 3, 4, 3];
    a.removeWhere((element) => element % 2 == 0);
    print(a);
  });

  print('replaceRange(int start,int end,iterable replacement) 删除 start 到 end '
      '的数据插入 replacement');
  r(f: () {
    List a = [1, 2, 3, 4, 3];
    a.replaceRange(2, 4, [10, 11, 12, 13]);
    print(a); // [1,2,10,11,12,13,3]
  });

  print('retainWhere(bool test(E element)) 删除不满足条件的数据');
  r(f: () {
    List a = [1, 2, 3, 4, 3];
    a.retainWhere((element) => element % 2 == 0);
    print(a);
  });

  print(
      'setAll(int index,iterable iterable) 从 index 开始插入一个 iterable 数据（对比insertAll)');
  print('它与 insertAll 的区别是 insertAll 不会删除原数组的值，setAll 会删除插入处一个或多个值');
  r(f: () {
    List a = [1, 2, 3, 4, 5];
    a.setAll(2, ['jsshou', 'good']);
    print(a);
  });

  print(
      'setRange(int start,int end,Iterable iterable,[int skipCount=0]) 从原数组 start 处开始到 end 结束替换一个 iterable，可选参数 skipCount 表示从 iterable 第 skipCount 处开始复制');
  r(f: () {
    List<int> list1 = [1, 2, 3, 4];
    List<int> list2 = [5, 6, 7, 8, 9];
    list1.setRange(1, 3, list2, 2);
    print(list1.join(',')); // 1,7,8,4
  });

  print('shuffle([Random random]) 随机排列 list');
  print('sort(int compare(E a,E b)) 排序,类似 js 中的 sort');
  r(f: () {
    List<int> list = [1, 2, 3, 4, 9, 8, 7, 6];
    list.sort((a, b) => a - b);
    print(list);
    //时间排序
    List list2 = [
      {'createTime': '2020-09-03 15:03'},
      {'createTime': '2020-09-03 18:00'}
    ];
    list2.sort(
        (left, right) => right['createTime'].compareTo(left['createTime']));
    print(list2);
  });

  print('sublist(int start,[int end]) 提取 list 数据');
  r(f: () {
    List<int> list = [1, 2, 3, 4, 9, 8, 7, 6];
    print(list.sublist(2, 5));
  });

  print('contains(Object element) 比较原数组中是否包含 element');
  r(f: () {
    List<int> list = [1, 2, 3, 4];
    List<int> list2 = [1, 2, 3, 4];
    print(list.contains(1)); // true
    print(list2.contains(5)); // false
  });

  print('elementAt(int index) 返回 index 处的数据');
  r(f: () {
    List<int> list = [1, 2, 3, 4];
    print(list.elementAt(2)); // 3
  });

  print('every(bool test(E element)) list 每一项是否满足条件');
  r(f: () {
    List<int> list = [1, 2, 3, 4];
    List<int> list1 = [0, 2, 4, 6];
    print(list.every((element) => element % 2 == 0));
    print(list1.every((element) => element % 2 == 0));
  });

  print('expand(Iterable f(E element)) 展开 list (类似 js 中的 flat)');
  r(f: () {
    var pairs = [
      [1, 2],
      [3, 4]
    ];
    var flattened = pairs.expand((element) => element).toList();
    print(flattened);

    var input = [1, 2, 3];
    var duplicated = input.expand((i) => [i, i]).toList();
    print(duplicated);
  });

  print(
      'firstWhere(bool test(E element),{E orElse()}) 迭代元素返回第一个满足 test，如果没有，返回 orElse 调用结果');
  var list = [1, 2, 2, 4];
  var res = list.firstWhere((element) => element == 2);
  print(res);

  print(
      'fold(T initialValue,T combine(T previousValue,E element)) 把 initialValue 作为初始值，迭代原数组，返回新的 value，类似 js 中的 reduce，eg:');
  r(f: () {
    list.fold<int>(10, (previousValue, element) => element);
  });

  print('followedBy(iterable other) 将 other 数据添加到原数组，返回 Iterable 类型');
  r(f: () {
    List a = List.from([1, 2, 3, 4]);
    Iterable b = a.followedBy([5, 6, 7, 8]);
    print(b);
  });

  print('forEach(void f(E element)) 迭代数组');
  r(f: () {
    List list = [1, 2, 3, 4];
    list.forEach((element) {
      print(element);
    });
  });

  print('join([String separator=' ']) 把数组转成字符串中间用 separator 隔开');
  r(f: () {
    var list = [1, 2, 2, 4];
    var res = list.lastWhere((element) => element == 2);
    print(res);
  });

  print('map(T f(E e)) 迭代数组并返回一个新的数组，新数组长度跟原数组长度一样');
  r(f: () {
    var list = [1, 2, 2, 4];
    var res = list.map((e) => e * 2);
    print(res);
  });

  print('noSuchMethod(Invocation invocation) 访问不存在的方法或属性调用');
  print(
      'reduce(E combine(E value,E element)) value 为初始值为原始数组第一项，后面是 combine返回的项');
  r(f: () {
    List a = List.from([1, 2, 3, 4]);
    var b = a.reduce((a, b) {
      print(a.toString() + ',' + b.toString());
      return a + b;
    });
    print(b);
  });

  print(
      'singleWhere(bool test(E element),{E orElse()}) 检查元素以查看是否 test(element)返回');
  print(
      'true。如果只满足一个元素 test，则返回该元素。如果找到多个匹配元素，则抛出 StateError。如果未找到匹配元素，则返回结果 ');
  print('orElse。如果 orElse 省略，则默认为抛出 StateError');
  print('skip(int count) 返回原数组 count 后面的元素');
  r(f: () {
    List a = List.from([1, 2, 3, 4]);
    print(a.skip(2)); // (3,4) //返回Iteralble类型
    print(a); // [1,2,3,4]
  });

  print('skipWhile(bool test(E value))');
  r(f: () {
    List a = List.from([1, 2, 3, 4]);
    print(a.skipWhile((value) {
      print(value);
      if (value == 2) {
        return false;
      }
      return true;
    }));
    print(a);
  });

  print('take(int count)');
  r(f: () {
    List a = List.from([1, 2, 3, 4]);
    print(a.take(2)); // (1,2)
  });

  print(
      'takeWhile(bool test(E value)) 遍历迭代器，直到找到 test 返回为 false 的元素，停止遍历返回找到的 iterable');
  r(f: () {
    List a = List.from([1, 2, 3, 4]);
    print(a.takeWhile((value) => value != 2));
  });

  print('toList({bool growable:true}) 将 Iterable 类转为 List');
  print('toSet() 将 Iterable 类及其子类转为 Set');
  print('toString()');
  print('where(bool test(E element)) 遍历元素，返回所有满足条件的元素,类似 js 中的 filter');
  r(f: () {
    List a = List.from([1, 2, 3, 4]);
    print(a.where((element) => element != 2)); //[1,3,4]
  });

  print('whereType() 找到原 list 中带有 T 类型的元素');
  r(f: () {
    List a = List.from([1, "2", 3, 4]);
    print(a.whereType<String>()); // (2)
  });

  r(f: () {
    int column = 4;
    List<int> list = [0, 1, 2, 3, 4, 5, 6];
    print(list);
    int groups = (list.length / column).ceil();
    print(groups);
    print(
      List.generate(
        groups,
        (cols) => List.generate(
          column,
          (rows) {
            return cols * 4 + rows;
          },
        ),
      ),
    );
  });
}

void r({String t = '', Function? f}) {
  print("--$t>------>-----");
  try {
    f?.call();
  } catch (e) {
    print(e);
  }
  print('');
  // print('---------分割线---------\n');
}
