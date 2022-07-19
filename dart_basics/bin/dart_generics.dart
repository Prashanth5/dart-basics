//https://www.codevscolor.com/dart-generics
void main(List<String> args) async {
  // genericCollection<int>();
  // genericCollection<String>();
  // genericCollection<dynamic>();
  // print(genericOperation(10, 20));
  // print(genericOperation(10.34, 20.3));
  // print(genericOperation1(10));
  // print(genericOperation1(10.23));
  // print(genericOperation2(true));
  // print(genericOperation2('String'));

  // print(await getMessage());
  // Future.delayed(Duration(seconds: 2), () => 12).then((value) => print(value));

  var mc = MyClass<String>(['ONe', 'two', 'three', 'four']);
  mc.printList();
  var mcInt = MyClass<int>([12, 23, 34, 56, 66]);
  mcInt.printList();
  var mcMap = MyClass<Map>([
    {'1': 'one', '2': 'two', '3': 'three'}
  ]);
  mcMap.printList();
}

void genericCollection<T>() {
  List<T> list = [];
  Map<String, T> map = {};
  Set<T> set = {};

  print('list: ${list.runtimeType}');
  print('map: ${map.runtimeType}');
  print('set: ${set.runtimeType}');
}

num genericOperation<T extends num>(T a, T b) {
  return a + b;
}

T genericOperation1<T extends Object>(T value) {
  return value;
}

T genericOperation2<T>(T value) {
  return value;
}

Future<String> getMessage() async {
  var completed = await Future.delayed(
    Duration(seconds: 5),
    () {
      return true;
    },
  );

  // await Future.delayed(Duration(seconds: 5)).then((value) => 'Completed');
  if (completed) {
    return 'Completed';
  }
  return 'Not Done';
}

class MyClass<T> {
  List<T> _list = [];
  List<T> list = [];
  MyClass(this.list) {
    _list = list;
  }
  void printList() {
    print(_list);
  }
}
