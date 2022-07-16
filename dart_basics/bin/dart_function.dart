/* Toggling block comments in VSCode
Windows: Shift + Alt + A.
Mac: Shift + Option + A.

https://medium.flutterdevs.com/working-with-callback-in-flutter-89dc207cba37
https://livebook.manning.com/book/dart-in-action/chapter-9/

 */
void main(List<String> args) {
  /*  funAsParam(() {
    print('this looks lihe completion handler');
  });
  funwithOptionalParams();
  funwithOptionalParams(12, 23);
  funwithRequiredParams();
  funwithRequiredParams(b: 12, a: 23);
  funwithRequiredParams(a: 12, b: 23);
  optionalPositionalParam(12);
  optionalPositionalParam(12, 2);
  anynonemusFunc(operation);
  mainFunctionString2('String Message', (value) {
    return 'This is a call back :$value';
  }); */

  /*  mainFunctionDictionary((map) {
    map['name'] = 'Rohan';
    map['age'] = 23;
    map['phone'] = '9876543210';
    map['weight'] = 85.4;
    return map;
  }); */

  Source s = Source();
  s.receiveData();
  s.getUser();
  print(s.setName());
}

void funAsParam(void Function() function) {
  function();
}

//[] indicates optional positional value with some default or else compiler will complain
void funwithOptionalParams([int a = 0, int b = 0]) {
  if (a != 0 && b != 0) {
    print('$a,$b');
  }
}

void optionalPositionalParam(int a, [int b = 3]) {
  print('$a * $b = ${a * b}');
}
//first param cant be optional
// void optionalPositionalParam2([int a = 1], int b=0){

// }

//{} indicates optional names parameters
void funwithRequiredParams({int a = 0, int b = 0}) {
  if (a != 0 && b != 0) {
    print('$a,$b');
  }
}

void anynonemusFunc(int Function(int a, int b) add) {
  print(add);
}

int operation(int a, int b) {
  return a + b;
}

//call back
void mainFunction(void Function() voidCallBack) {
  voidCallBack();
}

void mainFunctionString(String Function() stringCallBack) {
  print(stringCallBack());
}

void mainFunctionString2(
    dynamic value, String Function(dynamic value) stringCallBack) {
  print(stringCallBack(value));
}

void mainFunctionDictionary(
    Map<dynamic, dynamic> Function(Map<dynamic, dynamic> map) sendUserData) {
  var someMapData = sendUserData.call;
  print(someMapData.runtimeType);
}

class Source {
  Destination d = Destination();
  String setName() {
    var name = '';
    d.setName((p0) {
      return name = p0;
    });
    // print('The name is: $name');
    return name;
  }

  void getUser() {
    var userDetails = <String, dynamic>{};
    d.setUser((userMap) {
      return userDetails = userMap as Map<String, dynamic>;
    });

    print(userDetails);
  }

  void receiveData() {
    var localInt = 0;
    d.sendData(
      (p0) {
        return localInt = p0;
      },
    );
    print(localInt);
  }
}

class Destination {
  void setName(String Function(String) name) {
    name('A Name is passed');
  }

  void setUser(
      Map<dynamic, dynamic> Function(Map<dynamic, dynamic> userMap) user) {
    var map = <String, dynamic>{};
    map['name'] = 'Rohan';
    map['age'] = 23;
    map['phone'] = '9876543210';
    map['weight'] = 85.4;
    // print('User details: $user');
    user(map);
  }

  void sendData(int Function(int) age) {
    age(120);
  }
}
