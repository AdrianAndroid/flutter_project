// Dart基础第一篇:Dart的集合的循环遍历
// https://blog.csdn.net/u013600907/article/details/99677896

// dart 遍历数组_Dart 中常用的数组操作方法总结
// https://blog.csdn.net/weixin_42198780/article/details/111898832

void run(String title, Function func) {
  print('+++++ $title');
  func.call();
  print('----分割线----');
}

main() {
  print('循环遍历大全');

  learnFirst();
  learnSecond();
  learnThird();
}

void learnFirst() {
  List list = ['香蕉', '苹果', '🍐'];

  /// 遍历list的三种方法
  // 第一种 for循环
  print('第一种 for循环');
  for (int i = 0; i < list.length; i++) {
    print(list[i]);
  }
  print('----分割线----');

  // 第二种 foreach
  print('第二种 foreach');
  for (var value in list) {
    print(value);
  }
  print('----分割线----');

  // 第三种 函数foreach
  print('第三种 函数foreach');
  list.forEach((element) {
    print(element);
  });
  print('----分割线----');

  list = []; // 新创建一个list
  list.add(1);
  list.add(2);
  list.add(3);
  list.add(4);
  list.add(5);

  // 处理list中的每个元素
  print('处理list中的每个元素');
  List list2 = [];
  for (int i = 0; i < list.length; i++) {
    list2.add(list[i] * 2);
  }
  print('----分割线----');

  // 更简单的方法
  print('更简单的方法');
  var newList = list.map((e) => e * 2);
  print(newList.toList());
  print('----分割线----');

  // 只要list中大于2的数据 可以用where
  print('只要list中大于2的数据 可以用where');
  var newList2 = list.where((element) => element > 2);
  print(newList2.toList());
  print('----分割线----');

  // 判断只要集合中有满足条件的 返回true
  print('判断只要集合中有满足条件的 返回true');
  var newList3 = list.any((element) => element < 4);
  print(newList3);
  print('----分割线----');

  // every判断集合中所有的值都要满足条件 返回true 否则返回false
  print('every判断集合中所有的值都要满足条件 返回true 否则返回false');
  var newList4 = list.every((element) => element < 3);
  print(newList4);
  print('----分割线----');

  // 循环set的方法
  print('循环set的方法');
  var set = Set();
  set.addAll(list);
  print('----分割线----');

  // dark是支持箭头函数的 这句代码
  // set.forEach((value){
  //      print(value);
  // });
  print('dark是支持箭头函数的');
  set.forEach((element) => print(element));
  set.forEach(print);
  print('----分割线----');

  // 循环Map
  Map map = {'name': 'mrwang', 'money': 'null'};
  map.forEach((key, value) {
    print('$key -> $value');
  });
  print('----分割线----');
}

void learnSecond() {
  List students = [
    {'name': 'tom', 'age': 16},
    {'name': 'jack', 'age': 18},
    {'name': 'lucy', 'age': 20},
  ];
  List<int> numbers = [2, 8, 5, 1, 7, 3];
  run('遍历一个数组', () {
    students.forEach((element) {
      print(element);
    });
  });

  run('遍历一个Map', () {
    Map tom = {'name': 'tom', 'age': 16};
    tom.forEach((key, value) {
      print('$key - $value');
    });
  });

  run('遍历已知数组里的每一项', () {
    var messages =
        students.map((student) => 'Hello ' + student['name']).toList();
    print(messages);
  });

  run('判断数组是否包含某个元素', () {
    print(numbers.contains(5));
  });

  run('排序', () {
    numbers.sort((num1, num2) => num1 - num2);
    print(numbers);
  });

  run('reduce() 将数组中的每一个值与前面返回的值相加，最后返回相加的总和', () {
    // 2+8+5+1+7+3 = 26
    var sum = numbers.reduce((value, element) => value + element);
    print(sum);
  });

  run('fold()用法跟reduce()基本一样，只不过是可以提供一个初始值', () {
    var sum2 = numbers.fold<int>(10, (curr, next) => curr + next);
    print(sum2);
  });

  run('every() 判断数组中的所有项是否均达到了某个条件', () {
    var isAgeOver20 = students.every((element) {
      var b = element['age'] > 18;
      print(element);
      return b;
    });
    print(isAgeOver20);
  });

  run('where 返回数组中满足给定条件的元素集合', () {
    var ageOver16 = students.where((element) => element['age'] > 16);
    print(ageOver16);
  });
  run('firstWhere 返回数组中满足给定条件的第一个元素', () {
    var ageFirstOver16 = students.firstWhere(
      (element) => element['age'] > 16,
      orElse: () => null,
    );
    print(ageFirstOver16);
  });
  run('singleWhere 返回数组中满足给定条件的唯一一个元素, 若有多个元素满足抛异常', () {
    var ageUnder20 = students.singleWhere(
      (element) => element['age'] < 16,
      orElse: () => null,
    );
    print(ageUnder20);
  });

  // take skip
  List arr = [1, 3, 5, 2, 7, 9];
  run('take() 从数组里取n个元素', () {
    print(arr.take(3).toList());
  });
  run('skip() 跳过数组中的n个元素', () {
    print(arr.skip(4).toList());
    print(arr.take(3).skip(2).take(1).toList());
  });

  run('List.from(arr) 克隆一个数组', () {
    var cloneArr = List.from(arr);
    print(cloneArr);
  });

  run('expand()', () {
    var arr1 = [
      [2, 5],
      [7],
      [11, 12]
    ];
    var flattened = arr1.expand((element) => element).toList();
    print(flattened);

    var arr2 = [2, 5, 8];
    var computed = arr2.expand((element) => [element * 8].toList());
    print(computed);
  });
}

void learnThird() {
  List MyList = ['苹果', '栗子', '小苹果'];
  for (var i = 0; i < MyList.length; i++) {
    print(MyList[i]);
  }

  // for in  循环空数组是不会报错的~
  MyList = ['苹果', '栗子', '小苹果'];
  for (var item in MyList) {
    print(item); //item表示每一项的内容哈
  }

  MyList = ['苹果', '栗子', '小苹果'];
  MyList.forEach((value) {
    print(value);
  });

  // map主要用于修改原数组；对原数组进行一些操作(对原数组进行修改)
  MyList = [1, 2, 5, 10];
  var newList = MyList.map((value) {
    return value * 2;
  });
  print(newList); //(2, 4, 10, 20)

  // where查找符合条件的数组 (主要用于筛选)
  MyList = [1, 2, 4, 5, 7, 10];
  newList = MyList.where((value) {
    return value > 5;
  });
  print(newList); //(7, 10)

  // 判断数组中是否有满足条件的数据  返回的是布尔值
  List myList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var f = myList.any((value) {
    return value > 9; //只要集合中有满足条件的就会true
  });
  print(f); //true

  // 判断数组中是每一个值是否满足条件   返回的是布尔值
  myList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  f = myList.every((element) => element > 7);
  print(f);

  // 这样的写法跟上面的写法是等价的
  myList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  f = myList.every((element) {
    return element > 7;
  });
  print(f);
}
