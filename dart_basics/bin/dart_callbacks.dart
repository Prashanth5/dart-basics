import 'dart_extension.dart';
import 'dart_extension.dart' as a1;

void main(List<String> args) {
  // func1(() {
  //   print('calliong a callback');
  // });
  // func2((a, b) {
  //   print(a + b);
  //   print(a * b);
  //   print(a / b);
  // });
  // print(func3(() => 'Hi'));
  var b1 = B1();
  b1.printNmae('Some Name');
}

void func1(void Function() callback1) {
  callback1();
}

void func2(void Function(int a, int b) callback1) {
  callback1(12, 34);
}

String func3(String Function() getName) {
  print(getName());
  var a = A();
  a.fun1();
  a1.NewFun1(a).func2();
  NewFun1.name;
  return getName() + 'hello';
}

typedef StringCallback = String Function();

class A1 {
  String _name = '';

  void func1(StringCallback setName) {
    _name = setName();
  }

  void getName() {
    print('Name: $_name');
  }
}

class B1 {
  void printNmae(String name) {
    var a1 = A1();
    a1.func1(() => name);
    a1.getName();
  }
}
