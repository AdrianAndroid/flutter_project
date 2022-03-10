// 九、Dart 算术运算符
// https://juejin.cn/post/6844903683151364104

// 什么是算数运算符
// +	    加法
// -	    减法
// *	    乘法
// /	    除法
// %	    求余
// -expr	取负
// ++	    自增 1
// --	    自减 1
// ~/	    取整除法

void main() {
  r('加法', () {
    int a = 10;
    int b = 12;
    int c = a + b;
    print('$a + $b = $c');
  });

  r('减法', () {
    int a = 20;
    int b = 12;
    int c = a - b;
    print('$a - $b = $c');
  });

  r('乘法', () {
    int a = 3;
    int b = 7;
    int c = a * b;
    print('$a * $b = $c');
  });

  r('除法', () {
    int a = 3;
    int b = 7;
    double c = a / b;
    print('$a / $b = $c');
  });

  r('求余', () {
    int a = 9;
    int b = 6;
    int c = a % b;
    print('$a % $b = $c');
  });

  r('取负', () {
    int a = 10;
    int b = -a;
    print('b = $b');
  });

  r('自增++', () {
    var num = 10;
    num++;
    print('num = $num');
  });

  r('++自增', () {
    var num = 10;
    ++num;
    print('num = $num');
  });

  r('比较下前自增和后自增的区别', () {
    var num1 = 5;
    var value = num1++;
    print('num = $num1, value = $value');
    var num2 = 5;
    value = ++num2;
    print('num = $num2, value = $value');
  });

  r('自减--', () {
    var num = 10;
    num--;
    print('num = $num');
  });

  r('--自减', () {
    var num = 10;
    --num;
    print('num = $num');
  });

  r('取整除法', () {
    int a = 10;
    int b = 3;
    int c = a ~/ b;
    print('$a ~/ $b = $c');
  });
}

void r(String title, Function func) {
  print(title);
  func.call();
  print('----分割线----');
}
