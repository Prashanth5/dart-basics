import 'dart:convert';

void main(List<String> args) {
  emptyMap();
}

void emptyMap() {
  Map<String, dynamic> emptyMap = <String, dynamic>{};
  //adding values individually
  emptyMap['1'] = 'One';
  emptyMap['2'] = 'Two';
  emptyMap['3'] = 'Three';
  emptyMap['4'] = 'Four';
//adding the values
  emptyMap.addAll({'5': 'Five', '6': 'Six'});
  emptyMap.addAll({'7': null, '8': null});

  Map<int, String> anotherMap = {1: '!', 2: '@', 3: '#', 4: '\$'};
  emptyMap.addAll({'anotherMap': anotherMap});
  print(emptyMap);
  print(emptyMap.length);
  print(emptyMap.keys);
  print(emptyMap.values);
  print(emptyMap.keys.toList());
  print(emptyMap.remove('5'));
  print(emptyMap.remove('7'));

  print(emptyMap.isEmpty);
  emptyMap.putIfAbsent('9', () => 'Nine');
  emptyMap.addAll({'7': null, '8': 'eight'});
  emptyMap.keys.forEach((element) => print(element));
  print(emptyMap);
  // print(json.decode(emptyMap));
  print(JsonEncoder().convert(anotherMap));
}
