Future<void> printOrderMessage() async {
  try {
    print('Awaiting user orer..');
    var order = await fetchUserOrder();
  } catch (err) {
    print('Caught error: $err');
  }
}

Future<String> fetchUserOrder() {
  // Imagine that this function is more complex.
  var str = Future.delayed(
      Duration(seconds: 4),
      () => throw 'Cannot locate '
          'user order');
  return str;
}

// Handling errors
Future<void> main() async {
  await printOrderMessage();
}
