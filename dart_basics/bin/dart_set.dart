void main() {
  // fromSet(['one', 'three', 'four', 'five', 'two']);
  emptySet();
}

void emptySet() {
  Set<int> emptySet = {};
  emptySet.add(123);
  emptySet.addAll([2, 3, 4, 5, 6, 6]);
  print(emptySet.length);
  print(emptySet.isEmpty);
  print(emptySet);
  print(emptySet.map((e) => print(e.runtimeType)));

  print(emptySet.reduce((value, element) => value += element));
  print(emptySet.where((element) => (element > 100)));

  print(emptySet.firstWhere((element) => element % 2 == 0));
  print(emptySet.lastWhere((element) => element > 100));

  print('sad ${emptySet.cast<String>().toString().runtimeType}');
}

void fromSet(List ofString) {
  Set<String> fromStringSet = Set.from(ofString);
  fromStringSet.add('six');
  for (var i in fromStringSet) {
    print(i);
  }
  var setAsMap = fromStringSet.toList().asMap();
  print(setAsMap);
  setAsMap.forEach((key, value) {
    print('$key:$value');
  });
}

void identitySet() {
  Set identitySet = Set.identity();
  identitySet.addAll([1, 2, 3, 3, 45, 6, 7]);
  print(identitySet);
}

void unmodidifedSet() {
  Set unmodifiable = Set.unmodifiable([1, 2, 3, 4, 5]);
  print(unmodifiable);
  // unmodifiable.add(23);
  // print(unmodifiable); //exception at this line
}
