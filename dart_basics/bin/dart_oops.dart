void main(List<String> args) {
  var c2 = Class2.two();
  c2.methos1();

  var s = SampleClass();
  s.age = 23;
  s.name = 'Ram';
  s.run();
}

class Class1 {
  String name = '';
  Class1() {
    print('Class1 Con:$name');
  }
  Class1.one() {
    print('Class1.one Con: $name');
  }

  Class1.two() : this();

  void methos1() {
    print(name);
  }
}

abstract class AbsClass {
  String name = '';
  void method1();
}

class InterfaceI {
  String age = '23';
  void method2() {}
}

class Class2 extends Class1 implements InterfaceI {
  Class2() : super.one() {
    super.name = 'some name';
    print('Class2 Con');
    methos1();
  }
  Class2.two() : super.two() {
    print('How Come this is working');
  }

  @override
  String age = '';

  @override
  void method2() {
    print('object');
  }
}

class Class3 extends AbsClass implements InterfaceI {
  @override
  void method1() {}

  @override
  String age = '';

  @override
  void method2() {}
}

class MyClass {
  MyClass() {}
}

mixin MyMixin on MyClass {
  // MyMixin(){}
  String name = '';
  int age = 0;
  void run() {}
}

class SampleClass extends MyClass with MyMixin {}
