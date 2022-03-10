// Dart基础第一篇:Dart的集合的循环遍历
// https://blog.csdn.net/u013600907/article/details/99677896

main() {
  print('循环遍历大全');

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
  Map map = {
    'name': 'mrwang',
    'money': 'null'
  };
  map.forEach((key, value) {
    print('$key -> $value');
  });
  print('----分割线----');
}
