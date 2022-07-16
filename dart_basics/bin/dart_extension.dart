void main(List<String> args) {
  // print('object'.getStringLength());
  // print('object'.length);
  var a = A();
  a.fun1();
  // a.func2();
}

extension ExtensionName on String {
  int getStringLength() {
    return length;
  }
}

class A {
  void fun1() {}
}

extension NewFun1 on A {
  static var name = '';
  void func2() {}
  void func3() {}
}

extension NewFun2 on A {
  void func5() {}
  void func4() {}
}
