// flutter 小数向上向下取整
// https://www.jianshu.com/p/ce19c2f6c55b

main() {
  run(func: () {
    var a = 6 / 5; // a = 1.2
    print('a = $a');
  });

  run(func: () {
    var a = 6 ~/ 5;
    print('a = $a');
  });

  run(
      title: '向上取整(返回double)',
      func: () {
        var num = 10 / 3;
        var upperNum = num.ceilToDouble();
        print('upperNum = $upperNum');
      });

  run(
      title: '向上取整（返回int）',
      func: () {
        var num = 10 / 3;
        var upperNum = num.ceil();
        print('upperNum = $upperNum');
      });

  run(
      title: '向下取整（返回double）',
      func: () {
        var num = 10 / 3;
        var downNum = num.truncateToDouble();
        print('downNum = $downNum');
      });

  run(
      title: '向下取整(返回int)',
      func: () {
        var num = 10 / 3;
        var downNum = num.truncate();
        print('downNum = $downNum');
      });

  run(
      title: '四舍五入取整（返回double）',
      func: () {
        var num = 10 / 3;
        var downNum = num.roundToDouble();
        print('downNum = $downNum');
      });

  run(
      title: '死者入伍取整(返回int)',
      func: () {
        var num = 10 / 3;
        var downNum = num.round();
        print('downNum = $downNum');
      });

  run(
      title: '控制小数点精度',
      func: () {
        // toStringAsFixed() 会进行四舍五入
        var a = 10 / 3;
        print('a = $a');
        var b = a.toStringAsFixed(2);
        print('b = $b');
        var c = a.toStringAsFixed(5);
        print('c = $c');
      });
}

void run({String title = '', Function? func}) {
  print('****>>>$title');
  func?.call();
  print('----分割线----');
}
