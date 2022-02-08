// String createOrderMessage() {
//   var order = fetchUserOrder();
//   return 'Your order is : $order';
// }
// Future<String> fetchUserOrder() =>
//     // Imagine that this function is more complex and slow.
//     Future.delayed(const Duration(seconds: 2), () => 'Large Latte');

Future<void> fetchUserOrder2() {
  // Imagine that this function is fetching user info from another service or
  // database
  return Future.delayed(Duration(seconds: 2), () => print('Large Latte'));
}

// 这种用法其实是错误的。
main() {
  print('Future main start...');
  var f = fetchUserOrder2();
  // print('Future result = $f'); // 使用返回值，就阻塞了
  print('Future main end...');
}
