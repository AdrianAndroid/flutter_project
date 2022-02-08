Future<void> printOrderMessage() async {
  print('Awaiting user order...');
  var order = await fetchUserOrder();
  print('Your order is: $order');
}

Future<String> fetchUserOrder() {
  // Imagine that this function is more complex and slow.
  return Future.delayed(Duration(seconds: 4), () => 'Large Latte');
}

Future<void> main() async {
  countSeconds(4);
  print('printOrderMessage start ...');
  await printOrderMessage(); // 这个是阻塞的
  print('printOrderMessage end ...');
}

void countSeconds(int s) {
  for (var i = 1; i <= s; i++) {
    print('countSecond $i start ...');
    Future.delayed(Duration(seconds: 1), () => print(i));
    print('countSecond $i end ...');
  }
}
