// 声明
void test1() {
  var now = new DateTime.now();
  print(now);
  var d = new DateTime(2019, 1, 10, 9, 3);
  print(d);
}

// 创建事件UTC
void test2() {
  var d = DateTime.utc(2019, 10, 10, 9, 30);
  print(d);
}

// 解析时间ISO 8601
void test3() {
  var d1 = DateTime.parse('2018-10-10 09:30:30Z');
  print(d1);
  var d2 = DateTime.parse('2018-10-10 09:30:30+0800');
  print(d2);
}

// 时间增减量
void test4() {
  var d1 = DateTime.now();
  print(d1);
  print(d1.add(Duration(minutes: 5))); // 加5分钟
  print(d1.add(Duration(minutes: -5))); // 减5分钟
}

// 时间比较
void test5() {
  var d1 = DateTime(2018, 10, 1);
  var d2 = DateTime(2018, 10, 10);
  print(d1.isAfter(d2)); //是否在d2之后
  print(d1.isBefore(d2)); //是否在d2之前
  var d3 = DateTime.now();
  var d4 = d3.add(Duration(milliseconds: 30));
  print(d3.isAtSameMomentAs(d4)); //是否相同
}

// 时间差
void test6() {
  var d1 = DateTime(2018, 10, 1);
  var d2 = DateTime(2018, 10, 10);
  var differrence = d1.difference(d2);
  print([differrence.inDays, differrence.inHours]); //d1与d2相差的天数与小时
}

void test7() {
  var now = DateTime.now();
  print(now.millisecondsSinceEpoch);// 单位毫秒，13位时间戳
  print(now.microsecondsSinceEpoch);// 单位微秒，16位时间戳
}

void main() {
  //test1(); // 声明
  //test2(); // 创建事件UTC
  //test3(); // 解析时间ISO 8601
  //test4(); //时间增减
  // test5();//时间比较
  // test6();//时间差
  test7();//时间戳
}
