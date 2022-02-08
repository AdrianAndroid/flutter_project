String createOrderMessage() {
  var order = fetchUserOrder();
  return 'Your order is : $order';
}
Future<String> fetchUserOrder() =>
    // Imagine that this function is more complex and slow.
    Future.delayed(const Duration(seconds: 2), () => 'Large Latte');

// 这种用法其实是错误的。
Future<void> main() async {
  print('Fetching user order...');
  print(createOrderMessage());
}
