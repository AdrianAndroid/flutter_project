Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  return 'Your order is : $order';
}
Future<String> fetchUserOrder() =>
    // Imagine that this function is more complex and slow.
    Future.delayed(const Duration(seconds: 2), () => 'Large Latte');

// 这种用法其实是错误的。
Future<void> main() async {
  print('Fetching user order...');
  print(await createOrderMessage());
}

// Key terms
// * async: You can use the async keyword before a function's body to mark it
//          as asynchronous.
// * async  function: An async function is a function labeled with the async
//          keyword.
// * await: You can use the await keyword to get the completed result of an
//          asynchronous expression. The await keyword only works within an
//          async function.
