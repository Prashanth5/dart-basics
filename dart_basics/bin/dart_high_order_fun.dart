// https://medium.com/flutter-community/higher-order-functions-recursion-in-dart-functional-programming-part-5-4237bc114005#28b7
void main(List<String> args) {
  final sampleData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
  final listofMap = [
    {'one': 1, 'two': 2},
    {'three': 3, 'four': 4},
    {'five': 5, 'six': 6}
  ];
  // listFilterWhere(sampleData);
  // listWithMap(sampleData);
  // listWithMap2(listofMap);
  listtoReduce(sampleData);
}

void listFilterWhere(List<int> intList) {
  var ele = intList.where((element) => element.isEven).toList();
  print(ele);
  var ele2 = intList.where((element) => predicateFunction(element)).toList();
  print(ele2);
}

bool predicateFunction(dynamic value) {
  return value is int;
}

void listWithMap(List<int> intList) {
  var result = intList.map((e) => e / 2).toList();
  print(result);
}

void listWithMap2(List<Map<String, dynamic>> intList) {
  var result = intList.map((e) => print(e));
  print(result);
}

void listtoReduce(List<int> items) {
  var result = items.reduce((value, element) => element);
  print(result);
}

void listReduceFold(List<int> value) {}
