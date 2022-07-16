Future<void> main(List<String> args) async {
  print('User Order:');
  print(await createOrderMessage().whenComplete(
    () => print('The order is received'),
  ));
}

Future<String> createOrderMessage() async {
  var order = await fetchUserMessage();
  return 'Your order is $order';
}

Future<String> fetchUserMessage() {
  return Future.delayed(Duration(seconds: 5), (() {
    return 'Large Latte';
  }));
}
