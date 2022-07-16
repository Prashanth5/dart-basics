import 'dart:developer';

//https://api.dart.dev/stable/2.17.5/dart-core/List-class.html
void main() {
  listAsMap([23, 34, 45, 67, 88]);
}

void creatingList() {
  List list = [1, 2, 3, 4, 5, 6];
  list.forEach((element) {
    print(element);
  });
}

void createList() {
  var list = List.filled(10, 0, growable: true);
  list.forEach((element) {
    print(element);
  });
  log('cant add additional items to the list as it is fixed');
}

void createListWithSpreadOp() {
  var listofitems = [123];
  List list = [1, ...listofitems];
  list.forEach((element) {
    print(element);
  });
}

void fixedList() {
  List? fixedList = List.filled(5, null, growable: false);
  fixedList[0] = 'hi';
  fixedList[1] = 'how';
  fixedList[2] = 'r u';
  print(fixedList);

  /*
  growable: true, wont help in making a filled list to be growable, it will result in exception
  List? growableList = List.filled(5, null, growable: true);
  for (int i = 1; i <= 10; i++) {
    growableList[i] = i;
  }
  print(growableList);
  */
}

void listConstructors() {
  List? list1 = List.generate(10, (index) => 1, growable: true);
  for (int i = 0; i <= 10; i++) {
    list1[i] = i;
    print(list1);
  }
  final growableList =
      List<int>.generate(3, (int index) => index * index, growable: true);
  print(growableList);
}

void emptyList() {
  List? emptyList = List.empty(growable: true);
  for (int i = 1; i <= 10; i++) {
    emptyList.add(i);
  }
  print(emptyList);

  List? nonGrowableList = List.empty(growable: false);
  for (int i = 1; i <= 10; i++) {
    nonGrowableList.add(i);
  }
  print(nonGrowableList);
}

void fromList(List source) {
  List<int> destination = List.from(source, growable: true);
  destination.addAll([100, 200]);
  print(destination);
  List<int> fixedDestination = List.from(source, growable: false);
  //fixedDestination.addAll([100, 200]); -> this line causes exception
  print(fixedDestination);
}

void ofList(List source) {
  List? listOf = List.of(source, growable: true);
  listOf.add(100);
  print(listOf);
  List? listOf2 = List.of(source, growable: false);
  listOf2.add(100);
  print(listOf2);
}

void listAsMap(List source) {
  var asMap = source.asMap();
  print(asMap);
  asMap.forEach((key, value) {
    print('$key: $value');
  });
}
