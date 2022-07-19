[MarkDown Language](https://guides.github.com/features/mastering-markdown/)

[Emoji CheetSheet](https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md)

*Dart Basics:*

**dart code executiong in vs code use the following command: with default file name and path**
dart run  --observe --pause-isolates-on-start
----------
**with a different file name and path**
dart run bin/main.dart --observe --pause-isolates-on-start
----------

## main

~~~dart
void main() {
  //variables();
  buildInDataType();
  print(funcWithSingleExpression());
  funcWithParameters(23, 44);

//   the function with named parameter can be called in the
//   following 3 way
  funcWithNamedParameters();
  funcWithNamedParameters(a: 12);
  funcWithNamedParameters(a: 12, b: 34);

  funcWithRequiredParameter(uname: 'PKP', password: 'PKP');
  funcWithRequiredParameter(uname: 'PKP', password: 'PKP', email: 'a@b.c');
  
  funcWithOptionalParametersWithNull();
  funcWithOptionalParametersWithDefaultValue();
  funcWithOptionalParametersWithDefaultValue("Raj",36);
}
~~~

## build In Types

~~~dart
void buildInDataType() {
  //Numbers -> int, double, Subtypes of num
  int a = 10;
  double d = 12.345;
  num n = 12.34;
  print(n.runtimeType);
  print(a.bitLength);

  // type casting;
  var num1 = "1.234";
  print(double.parse(num1));

  //while parseing int will not extract only int
  //from a string containing double. throws an format exception
  num1 = '2';
  print(int.parse(num1));

//   a = d; //a double value cant be assigned to a int var
//   print(a);
  num n1 = n;
  print(n1); //this is possible by default

  //String:
  String name = "Prashanth";
  print(name);
  for (var i = 0; i < name.length; i++) {
    print(name[i]);
  }
//   for (var n in name) => print(n); wont work as name is not a collection
  print(name.contains('shan'));
  print(name.substring(3, 6));

  String sentence = "This is a long string";
  print(sentence.split(' '));
  print(sentence.replaceAll('is', 'e'));

  String? address = null; // string can also be nullable
  print(address);

  //list aka arrays

  List<int> list_of_names = [];
  print(list_of_names.isEmpty);
  List<int> names = [1, 2, 3, 4, 5];
  list_of_names.addAll(names);
  print(list_of_names);
  list_of_names.add(1234);
  print(list_of_names);
  print(list_of_names.length);
  print(list_of_names[0]);
  List<String> ages = ["2", "3", "4"];
  List<Object> anyValue = [];
  anyValue.addAll(names);
  anyValue.addAll(list_of_names);
  anyValue.addAll(ages);
  print(anyValue);
  List<String>? emptyList = null;
  emptyList = ages;
  print(emptyList);
  emptyList = ['a',...ages];
  //(...)spread operator for setting a dynamic rnge of values
  //(...?)optional version of sperad opertor
  print(emptyList);
  //using higher order function, map(), to manipulate the elements
  var mapOp = names.map((element) => 2 * element).toList();
  print('mapOp:$mapOp');
  
  //Set same as list but with no duplicate values
  
  var emptySet = <int>{};
  print(emptySet);
  
  Set<String> emptyStringSet = {};
  print(emptyStringSet);
  
  emptySet.addAll(list_of_names);
  print(emptySet); //removed the duplicate values from list_of_names
  
  emptyStringSet.add('Some String');
  print(emptyStringSet);
  
  for (var seta in emptySet ) { print(seta);}
  for (var seta in emptyStringSet ) { print(seta);}
  
  //Map aka Dictionary
  //3 ways to create empty dictionary
  //1. using the {} empty brackets to create an empty dictionary
  var emptyDic = {};
  print(emptyDic.runtimeType);
  //2. using Map() constructore to define empty dic
  var emptyMapConstDic = Map<String,dynamic>();
  print(emptyMapConstDic.runtimeType);
  //3. using just the Map() with out specifing any type,
  //by default dynamic type is set for key and value
  Map emptySimpleMap = Map();
  print(emptySimpleMap.runtimeType);
  //creating map with some values
  Map userOne = {'name':'Prashanth','pwd':'Password@123'};
  print(userOne);
  // setting one additonal KV pair
  userOne.addAll({'age':'23'});
  userOne["phone"]= 8884689321;
  print(userOne);
  //reading a value for a key
  print(userOne['name']);
  // reading all keys and values
  print(userOne.keys);
  print(userOne.values);
  
  userOne.forEach((k,v){
    print('$k:$v');
  });
  //===> Refer MapApi for more info
}
~~~

## Variables

~~~dart
void variables() {
  var i = 10; //this cant be optional(no ?)
  print(i);

  Object j = 100; // this can be optional (with and without ?)
  print(j.runtimeType);
  j = "Sam"; // can store any type of value in the variable
  print(j.runtimeType);

  j = j.toString() + j.toString(); //object is complite time evaluation
  print(j);
  dynamic k =
      123.45; //can store any kind of value but is identified at run time
  print(k.runtimeType);

  k = "Sham";
  print(k.runtimeType);

//   k = k + 1;
//   print(k);// dynamic is runtime evaluation

  Object? a = null;
  //print(a!);//  you cant set the variable to null with !, will cause exception

  int b = 100;
  assert(b == 0.5, 'b is not null'); // throws exception when confition is false
  var st = b != 0.5;
  print('$st');

  var ab; // a var variable can be init without an initial value
  print(ab);

  int? bc; // a normal variable need to init before use
  //if null safty is enabled or else mark the variable type with '?'
  print(bc);

  late var name; // if late is not init
  //compile time as well as runtime error is generated
  name = '';
  print('name:$name');

  //final: is a constant cant re-init
  final pi = 3.141;
  //pi = pi + 1;
  print('pi:${3 * pi}');

  // const: it is a constant variable but not same as final
  // const variable will only work with another const variable
  // const can be defined as a value which remain const through out
//   the usage of the variable,
  //i.e const MAX_AGE = 100, where MAX_AGE will remain as a const and cnt be manipulated
  // where as, a final can be manipulated by rest of the code.
  //like, 3 *pi, where pi is final
  const double pii = 3.141;
const twopi = 2* pii;
  print(twopi);
}
~~~

## functions

~~~dart
String funcWithSingleExpression() => "Hello World";

void funcWithParameters(int a, int b) {
  print('funcWithParameters: a+b = ${a + b}');
}

//following function is having default value set to the parameter
//if the parameter name are not mentioned at the time of calling the function,
//the default value is considered
//named parameter are placed inside {}
void funcWithNamedParameters({int a = 0, int b = -5}) {
  print('funcWithNamedParameters: a+b = ${a + b}');
}

//required paramter are defined using 'required' keyword at the
// begnning of parameter declaration, this will not have a
//default value as it is a required variable
void funcWithRequiredParameter(
    {required String uname, required String password, String email = ""}) {
  print(
      'uname:$uname,password:$password,email:${email.length > 0 ? email : 'email not provided'}');
}

//optional positonal parameter are rapped in [] brackets and can also
//default value
void funcWithOptionalParametersWithNull([String? name,int? age]){
  print('Name:$name,Age:$age');
}
/*difference between optional and named parameter is

* 1. names parameter to use them we need to mention the name of the
* parameter in the method call same is not the case with Optional parameter
*
* the rest remains the same.
*
* */
void funcWithOptionalParametersWithDefaultValue([String name='NoName',int? age=0]){
  print('Name:$name,Age:$age');
}
void anonymousFunc() {
  //this is similar to closures but,
  //here the parameters are defined out of the {}
  //where as in closures the parametea are creted after {}
  name() {
    print('This is an name variable.');
  }

  name();

  //passing params to the func

  sum(double i, double j) {
    return i + j;
  }

  print('Sum:${sum(10, 20)}');

  //passing object to the func
  userInfo(User user) {
    return 'The name:${user.name},age:${user.age}';
  }

  var user = User();
  user.name = 'Person1';
  user.age = 23;
  //print the values of user object using an anonymous method
  print(userInfo(user));

  //populating the object variables using the anonymous func
  userDetails(User user) {
    user.name = 'new name';
    user.age = 23;
    return user;
  }

  var newUser = User();
  //if the values are defined in the anonymous func,
  //it is accessable using the dot operator, see below.
  print(userDetails(newUser).name);
  print(userDetails(newUser).age);

  var ud = userDetails(newUser);
  print('Name:${ud.name},Age:${ud.age}');

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  //creatig a button
  dynamic customButton() {
    return const ElevatedButton(
      style: style,
      onPressed: null,
      child: Text('Disabled'),
    );
    //return raisedButton;
  }

  customButton();
}

class User {
  String? name = '';
  int? age = 0;
}
~~~

## loops and operators

~~~dart
void loops() {
  /**

* Control flow statements
    You can control the flow of your Dart code using any of the following:

    if and else
    for loops
    while and do-while loops
    break and continue
    switch and case
    assert
*/
  /*

* Forloops varity:
* 1. c style for loop
* 2. forEach on collection
* 3. for in collection style.
* */
  
  //C Style loop
  for(var i = 1;i<=10;i++) {
    print(i);
  }
  
  List<String> names = ['a','b','c','d','e','f'];
  names.forEach((name) => print('${name}:${name.toUpperCase()}'));
  
  for (var name in names){
    print(name.toUpperCase());
  }
}
void casscadingNotion() {
  /*

* Cascades (.., ?..) allow you to make a sequence of operations on the same object.
* In addition to function calls, you can also access fields on that same object.
* This often saves you the step of creating a temporary variable
* */
  SuperPerson person = Person()
    ..name = 'Sham'
    ..age = 22
    ..address = 'Banglore'
    ..dob = DateTime.now()
    ..getPersonDetails();
  //you can’t construct a cascade on void. -> not true
  SuperPerson person2 = Person()
    ..getName() //-> this is not printed
    ..getPersonDetails();
  print(person2.getName());
}

void assignmentOperator() {
  // ??= and other operators
  // ??= is used to assign a default value to variable ONLY IF it is null.
  //For an operator op: [a op= b] is same as [a = a op b] => [] not included.
  //op => + - * /
  var a = null;
  var b = 100;
  a ??= b; // shorthand
  a = (a ?? b) + a; // alternate way to aet the value
  print(a);

  /*

* different between conditional operator (?:) and assignment operator(??)
* CO => (conditon)? true : false;
* AO =>  value1??value2 -> if value1 is null, value2 is assigned to value1
* or else value1 is utilised.
* */

  var gender = 'Female';
  var legal_age = (gender == 'Male') ? 21 : 18;
  print(legal_age);
}

void typeTest() {
//   The as, is, and is! operators are handy for checking types at runtime.
  // as is to type cast a type to another type
  // is & is! is to verify the type of a variable.
  var i = 100;
  var j = 23.45;
  var k = true;
  var a = "12345";

  print(i is int);
  print(i is! int);

//   print(j as int); this is not possible gives an error
  var b = i as double;
  print(b is double);
  print(b + j);
  //i = k as int; this will not work generates an error
  print(k is int);
  i = int.parse(a);
  print(i);

  SuperPerson emp = Person();
//   emp = emp as Person;
  if (emp is Person) {
    print('${emp.runtimeType},name:${emp.name}');
  } else {
    print('no access to name');
  }
}

abstract class SuperPerson {
  var name;
  var age;
  var address;
  var dob;
  void getPersonDetails();
  String getName();
}

class Person extends SuperPerson {
  Person() {
    this.name = "Raj";
    this.age = 23;
    this.address = 'Hyderabad';
    this.dob = DateTime.now();
  }
  void getPersonDetails() {
    print('Name:$name,Age:$age,Address:$address,Dob:$dob');
  }

  String getName() {
    print('getName is called..');
    return 'Name is ${this.name}';
  }
}
~~~

## Exception Handling

~~~dart
// simple exception thrown and handled
void exceptionHandling() {
  for (var i = 1; i <= 10; i++) {
    try {
      if (i == 6) {
        throw 'In the middle of the run';
      }
      print(i);
    } catch (e) { // e is reqired identifier which holds the information about exception
      print('This will be taken care of:$e');
    }
  }
}

//handling named exception,
//where we are metioning the one of the exception classes
void namedExceptionHandling(){
  try{
    throw FormatException('Not in correct format');
  }catch (e){
    print('THis is a named exception:$e');
  }
}

void takeUserInput(var input){
  userInput(input);
}

//throwing an exception based on the user input, where we are expecting a perticular type.
void userInput(dynamic input){
  if(input is! String){
    throw 'Invalid Type Exception:${input.runtimeType}';
  }
  print('Userinput: $input');
}
//use the user defined exception
void justThrowUserException() {
  try{
    //throuwing an useredefined exception
    throw MyException();

  }
  // handling the exception when we know the type of exception
  on FormatException {
    print('This is a userdefined Exception...');
  }
  //this is a handling the exception which are
  //inheriting the Exception abstract class
  //this willa additionally provide use with exception and stack trace object
  on Exception catch (e,s){
    print('This is related to Exception class:$e');
    print('Stack Trace:$s');
  }
  //this is generic handling of exception
  //when we are unaware of the type of exception
  catch(e,s){
    print(e.runtimeType);
    print(e.toString());
  }  
}
//custom exception class by implementing the Exception abstract class
class MyException implements Exception {
  MyException() {
    print(getExceptionDescription());
  }
  String getExceptionDescription() {
    return 'This is a user defiend exception';
  }
}
~~~

## Class and Constructors

~~~dart
class GoodPerson extends Person{
  int age = 0;
  String name = 'NONAME';
 GoodPerson(){
    print('Good Person Class');
 }
  GoodPerson.details({age,name}):super.details(name){
    print('Good Persons age:$age');
  }
  void goodPersonMethod(){
    print('From Good Person');
  }
}

void main(){
  var gPerson = GoodPerson();
  var gPersonWithAge = GoodPerson.details(age: 23,name: 'For Super Class');
  gPerson.goodPersonMethod();
}
~~~

## extentions

~~~dart
This can be used to add addtional funtion to an existing type, class, enum, int, string,etc.
This will extend the funtionality of the type. We can also extend abstract class.
extension on int {
  int double() => this * 2;
}
enum Connectivity{
  disconnected,connecting,connected
}

extension on Connectivity{
 String humanize () => this.toString().split('.').last;
}

void main(){
  print(Connectivity.connected.humanize());
  print(Connectivity.connected.humanize().runtimeType);
  //output: connected
  print(Connectivity.disconnected);
  //output: Connectivity.disconnected
  int i = 20;
  print(i.double());
}
~~~

[## Streams](<https://ericwindmill.com/articles/async_dart_flutter/>()

## Setters and getters with function parameters

~~~dart
void main() {
  var myClass = MyClass();
  myClass.setName = 'Welcome';
  print(myClass.getName);
  myClass._age = 23;
  print('age:${myClass._age}');
  print(myClass.defaultParameters('Prashanth', 'Hyd'));
  print(myClass.defaultParameters('Prashanth', 'Hyd', age: 36));
//   Positional arguments must occur before named arguments.
//   print(myClass.defaultParameters(age:36, 'Prashanth', 'Hyd'));
  print(myClass.optionalParameters('Prashanth','SBC'));
  print(myClass.optionalParameters('Prashanth','SBC', 36));
  print(myClass.namedparameters(length: 12,height: 12,breath: 12));
  print(myClass.namedparameters(height: 3,breath: 4,length: 10));
  print(myClass.namedparameters());
}

class MyClass {
  String? _name;
int?_age;
  //we have to make use get+set keywords to define setter and getters or else
  // they will become normal methods
  String? get getName => _name;
  //this is type safe i dont have to explicily tell the compiler
  //that the value passed it a String
  //no return type on setters
set setName(newValue) =>_name = newValue;

  //3 type of parameters:
//   default parameters + positional, indicated using {}
  String? defaultParameters(String name, String address, {int age = 10}) {
    return '$name is @ $address and his age is $age';
  }

//   optional parameters, indicated using []
  String? optionalParameters(String name, String address, [int? age]) {
    return '$name is @ $address and his age is $age';
  }
//   named parameters indicated by {}, parametrs inside {} can change
//   there order which passing the value to them

  double? namedparameters({double? length, double? height, double? breath}) {
    if (length != null && height != null && breath != null) {
      return length *breath* height;
    }
    return 0.0;
  }
}
~~~

## Mixin inheritance

~~~dart
class SuperClass{
  SuperClass(){
    print('SuperClass Default Constructor');
  }
  SuperClass.namedConstructor(String someName){
    print('From the namedConstructor: $someName');
  }
}
// this mixin can;t be used inherited as an standalone as it is dependent 'on Superclass'
// to use this mixin, we have to 'inherit' 'SupeClass' followed
// by 'SomeCommonMixinClass' using the 'with' keyword
mixin SomeCommonMixinClass on SuperClass{
  void someCommonMethod(){
    print('Common for many classes');
  }
}
class SubClass extends SuperClass with SomeCommonMixinClass{
  SubClass():super(){
    print('SubClass Default Constructor');
  }
  SubClass.namedConstructor(String someName):super.namedConstructor(someName){
    print('From namedConstructor: ${someName.toUpperCase()}');
  }
}

//THis will not work as the Mixin is defined to be inherited aling with the
// class 'SupeClass', the mixin is defined 'on' the 'SuperClass' using the 'on'
// keyword
// class ThirdClass with SomeCommonMixinClass{
  
// }

void main(){
  var subClass = SubClass();
  subClass.someCommonMethod();
  
  var subClassNamed = SubClass.namedConstructor('From Main Function');
  subClassNamed.someCommonMethod();
}
~~~

## Generics

~~~dart
void main(){
  var names = <String>[];
  names.addAll(['Some name', 'Some name2', 'Some name3']);
  print(names);
  
  var dynamicValues = <dynamic>[];
  dynamicValues.add(1);
  dynamicValues.add(0.001);
  dynamicValues.add('Sham');
  dynamicValues.add(true);
  
  print(dynamicValues);
  
  var someClass = SomeClass<Generictype>();
  print(someClass.getValue<int>([1,2,3,4,5,6]));
  var someClass2  = SomeClass();
//   'String' doesn't conform to the bound 'Generictype' of the type parameter 'T'.
//   var someClass3 = SomeClass<String>();
  var genericClass = Generictype();
  genericClass.genericMethod<dynamic>(dynamicValues);
  genericClass.genericMethod<String>(names);
  genericClass.genericMethod<double>([1.0,2.0,3.0]);
}

class Generictype{
  void genericMethod<T>(List<T> values){
    print(values);
  }
  
}

// class that conforms to a type
class SomeClass<T extends Generictype>{
  //We cn alternatively use 'E' to metnion an generic type for a method
  List<E> getValue<E>(List<E> values){
    //no need to explitly mention the type for printElement,
//     it will be inferec the compiler
    values.forEach(printElement);
    return values;
  }
  void printElement<E>(E element) {
  print(element);
}
}
~~~

## Interfaces & Abstract classes

~~~dart
    // In dart, an interface is also as class and is inherited using {}
// the implements keyword
class ClassInterface{
  ClassInterface();
//   interface can have normal variable declaration and
//   functions with empty bodys
//    int age = 0; //instance variables are not recommonded in dart
  void display(){}
//  notice the null safty for the string, where the return can be null
  String? displayString(var params){}
}

// In dart,an abstracrt class is defined using abstract keyword
// it is consumed by a class using extends keyword.
abstract class SomeAbstractClass{
  SomeAbstractClass();
  var name = '';
  //  notice the null safty for the int, where the return can be null
  int? area({var height = 0,var width = 0});
}

class ConsumeInterface implements ClassInterface{
  double _height = 0.0;
  @override
  void display(){
    print('A message');
  }
  
  @override
  String? displayString(var params){
    return params;
  }
  
  //setter getter for the instance variable
  set setHeight(newValue){
    _height = newValue;
  }
  
  get getHeight => _height;
  
//   This is not possible with variables in interface
//   @override
//   set setAge(int newValue){
//     age = newValue;
//   }
//   @override
//   int? get getAge => age;
}

class ConsumeAbstractClass extends SomeAbstractClass implements ClassInterface{
  
  @override
  void display(){
    print('Form ConsumeAbstractClass');
  }
  @override
  String? displayString(var params){
    return params;
  }
  @override
  int? area({var height = 0,var width = 0}){
    return height *width;
  }
  /*
  Here are a few things to remember regarding **STATIC** variables and methods:
• From a normal function, you can call a static method.
• From a static method, you cannot call a normal function.
• In a static method, you cannot use the this keyword.
  This is because the static methods do not operate on an instance and
  thus do not have access to this.
  */

}
void main(){
  var ci = ConsumeInterface();
  ci.display();
  print(ci.displayString(ci.runtimeType.toString()));
  ci.setHeight = 12.345;
  print(ci.getHeight);
  
  var cac = ConsumeAbstractClass();
  cac.name = 'Prashanth';
  cac.displayString(cac.name);

}
~~~

## Anonymous methods and closures:
/*
 * Anonymous methods : it is considered as a bad practice compared to 
   the actual function declaration with a proper name
• Here we summarize the key features of anonymous functions:
• We can declare any anonymous function without a function name.
• We can assign it to a variable.
• The anonymous function can be passed into another function, as we’ll see later.
• In the longhand version, we need to use a semicolon to terminate the statement because we assign it to a variable.
• The only disadvantage of an anonymous function is we cannot use it recursively as it has no name.
 * */
~~~dart
Function returnString = (String name){
  return 'Name:$name';
};

Function returnInt = (int age) => age;

// -----------------
// closures

Function sampleData = (){
  var person = Map<String,dynamic>();
  person['name'] = 'Ram';
  person['age'] = 23;
  return person;
};

// -- modify Parent scope value, Fail: actual value is never modified as 
// 'this' is not accessble
class SampleClass{
  String? message;
  Function modifyMessage = (){
    String message = "Message Modified";
    return message;
  };
  
//   --Higher order function will take another function as parameter
  Function addingNumber = (int a,int b){
    return a+b;
  };
  
  void higherOrderFunction(int a, int b, Function myFunction){
//     int a =100;
//     int b = 200;
    print('Sum=${myFunction(a,b)}');
  }
}
void main(){
  /*
   * dynamic is a type underlying all Dart objects. 
   * You shouldn't need to explicitly use it in most cases.
   * var is a keyword, meaning "I don't care to notate what the type is here." 
   * Dart will replace the var keyword with the initializer type, 
   * or leaving it dynamic by default if there is no initializer.
   * 
   * You dont have to initializer neither "var" nor "dynamic", nor you have to
   * declare it with '?'
   * */
  var abc;
  dynamic xyz;
  print(abc.runtimeType);
  print(xyz.runtimeType);
  print(returnString('Raj'));
  print(returnInt(23));
  print(sampleData());
  var sc = SampleClass();
  sc.message = "This is the main message";
  print(sc.modifyMessage());
  print(sc.message);
  
  sc.higherOrderFunction(12,34,sc.addingNumber);
}
~~~

## math function
~~~dart
[math pow()](https://api.dart.dev/be/137378/dart-math/pow.html)
import 'dart:math';

void main() {
  var value = 123.45;
  var mod = pow(10.0, 2);
  value = value + ((value * 10) / 100);
  print((value * mod));
  print((value * mod).round().toDouble() / mod);
}
double dp(double val, int places){ 
   num mod = pow(10.0, places); 
   return ((val * mod).round().toDouble() / mod); 
}
~~~
## -------*-Provider Pattern-*------------
## Provider Patterns

<https://flutterbyexample.com/lesson/what-is-provider>
<https://pub.dev/packages/provider>

1. This pattern is used to provide the access to objects in a widget hierachie i.e an object can be accessed anywhere on the widget tree by making use of 'Provider.of(context)'

2. The provider is a conbination of inherited widget and depenency injection.

3. A provider is a widget so that it can be present on the widget tree.

4. An object can stored in the provider, we make use of Provider(create:Type(), child: First_stl/stf widget) in the main method. As the main method is at the top of the widget tree.

5. The type can access on the widget tree but it can be updated directly as the build method will not be called. For this Provider provides with the changenotifierprovider which will trigger a re-build of the widget when the data is updated.

## 6. There is changenotifierprovider and changenotifier

1.the difference is that latter will trigger the notifierListner when the value is updated, which in turn will trigger the listner/voidcallback on the object which will execute some task.
2.The former will also perform simillar operation but it would work just like the Provider and will wrap the object at the begning of the tree.

## 7. Consumer<T>

is part of a builder pattern provided by the Provier, which wraps the whole view in it and using the builder, shared the object of the type to the rest of the widget tree.
Consumer replaces the Provider.of(context) with an object of the model type/object.
Where T is the model type.
<https://flutterbyexample.com/lesson/rebuilding-widgets-with-consumer>

## 8. Selector<T,String>

Same as Consumer but allows use to select only the required property from the model object and shared it with the rest of the widget tree using a 'selector' property of the Selector, where T is the Model type ans String can be repalce with the requried type
<https://flutterbyexample.com/lesson/finer-build-control-with-selector-1>
Example:

~~~dart
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Person with ChangeNotifier {
  Person({this.name, this.age});

  final String name;
  int age;

  void increaseAge() {
    this.age++;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Person(name: "Yohan", age: 25),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<Person, String>(
      selector: (BuildContext context, Person person) => person.name,
      builder: (context, String name, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("${name} -- ${Provider.of<Person>(context).age} yrs old"),
          ),
          body: child,
        );
      },
      child: Center(
        child: Text('Hi this represents a huge widget! Like a scrollview with 500 children!'),
      ),
    );
  }
}
~~~

## 9. Future Provider

it is a future provider which is used when ther will be a delay in receiving the data. this will have an initial value which will be displayed before actual data is received, once data is received the ui is refreshed, and it wonnt build again. if updated data is received from the server again and again, StreamProvider can be used.
Example:

~~~dart
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Person {
  Person({this.name, this.age});

  final String name;
  int age;
}

class Home {
  final String city = "Portland";

  Future<String> get fetchAddress {
    final address = Future.delayed(Duration(seconds: 2), () {
      return '1234 North Commercial Ave.';
    });

    return address;
  }
}

void main() {
  runApp(
    Provider<Person>(
      create: (_) => Person(name: 'Yohan', age: 25),
      child: FutureProvider<String>(
        create: (context) => Home().fetchAddress,
        initialData: "fetching address...",
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Provider"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Consumer<Person>(
            builder: (context, Person person, child) {
              return Column(
                children: <Widget>[
                  Text("User profile:"),
                  Text("name: ${person.name}"),
                  Text("age: ${person.age}"),
                  Consumer<String>(builder: (context, String address, child) {
                    return Text("address: $address");
                  }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

~~~

## 10. MultiProvider

This Provider is introduced to manage the incresing number of providers, seen in FutureProvider demo,
Multiprovider take an array of Providers where we define the creating of the proviers and will be made available on the widget tree.
Example:

~~~dart
    void main() {
      runApp(
        // You can wrap multiple providers
        MultiProvider(
          providers: [
            Provicer<Person>(create: (_) => Person(name: 'Yohan', age: 25)),
            FutureProvider<String>(create: (context) => Home().fetchAddress),
          ],
          child: MyApp(),
        ),
      );
    }
~~~

## 11. StreamProvider

1.Stream Provider is an alternate for Future Provider, where it can only rebuild the widget only once after receving the updated value, where as Stream Provider can trigger the widget to rebuild everytime updated data is available.
2.Similar to future provier it also requires an initial value which will be replaced by the updated value when it is avaiable.
3.For Stream provider to work we need to create a Stream<T>, where T is a type, by adding and yeilding data from it. This data will be captured by the StreamProvider and shared with widget tree.

## 12. Extending BuildContext

<https://flutterbyexample.com/lesson/using-context-extensions-for-more-control>
1.The build context holds the reference of the widget's 'location' on the widget tree. using this reference it can interact with the widget from anywhere on the widget tree.
2.This feature is used by the Provider.
3.In the line Provider.of<String>(context), "of()" method is using flutter to searches for a
->Provider<- on the widget tree with a subtype ->'String'<-
4.This is possible because Provider is a widget and the context has its information on the widget tree.
5.Each of these simplifies a different process that previously a bit more verbose:

5.1.BuildContext.read<Person>() replaces Provider.of<Person>(context, listen: false). In this case, it will find the Person object and then return it. [ChangeNotifierProvider]

5.2.BuildContext.watch<Person>() replaces Provider.of<Person>(context). While this may seem hardly different, consider that you not do not need to use a Consumer at all. You can remove entire widgets from the tree! watch is used to 'listen' to a value from a ChangeNotifierProvider, FutureProvider or StreamProvider. [Consumer]

5.3.Finally, BuildContext.select<Person> is probably the most useful. It completely removes the need to use a Selector, as you can just use the value you would be selecting directly.[Selector]

## 13. ProxyProvider

<https://flutterbyexample.com/lesson/proxy-provider>
This is used with we want to create a proxy(job class) for an object (person class).
for the proxy we make use of proxy provider the acces the properies provided by the proxy class(job class). We can choose if this proxy class should expose the main class(person class) or not but by default reference to the main class will be exposed.

In this case we are makeing use of ChangeNotifier and ChangeNotifierProxyProvider where letter is dependent on the former provider to start working.
Example:

~~~dart
class Person with ChangeNotifier {
  Person({this.name, this.age});

  final String name;
  int age;

  void increaseAge() {
    this.age++;
    notifyListeners();
  }
}

class Job with ChangeNotifier {
  Job(
    this.person, {
    this.career,
  });

  final Person person;
  String career;
  String get title {
    if (person.age >= 28) return 'Dr. ${person.name}, $career PhD';
    return '${person.name}, Student';
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        // you must first provider the object that will be passed to the proxy
        ChangeNotifierProvider<Person>(create: (_) => Person(name: 'Yohan', age: 25)),
        // Because the ChangeNotifierProxyProvider is being used,
        // each class used must be of ChangeNotifier type
        ChangeNotifierProxyProvider<Person, Job>(
// first, create the_proxy_ object, the one that you'll use in your UI
          // at this point, you will have access to the previously provided objects
          create: (BuildContext context) => Job(Provider.of<Person>(context, listen: false)),
          // next, define a function to be called on `update`. It will return the same type
          // as the create method.
          update: (BuildContext context, Person person, Job job) => Job(person, career: 'Vet'),
        ),
      ],
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Class'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Hi, may name is ${context.select((Job j) => j.person.name)}',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text('Age: ${context.select((Job j) => j.person.age)}'),
              Text(context.watch<Job>().title),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Provider.of<Person>(context, listen: false).increaseAge(),
      ),
    );
  }
}
~~~
## 14. .value Constructor

it is used to share only the existing object/value to the widget tree which can be accessed anywhere on the tree.
Example:
~~~dart
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Person with ChangeNotifier {
  Person({this.name, this.age});

  final String name;
  int age;

  void increaseAge() {
    this.age++;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Person(name: "Yohan", age: 25),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Class'),
      ),
      body: Center(
        child: PersonsNameLabel(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Provider.of<Person>(context, listen: false).increaseAge(),
      ),
    );
  }
}

class PersonsNameLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<String>.value(
      value: Provider.of<Person>(context).name,
      builder: (BuildContext context, Widget child) {
        return Text(context.watch<String>());
      },
    );
  }
}
~~~
## 15. complete demo using the providers

<https://flutterbyexample.com/lesson/the-final-example-a-shopping-cart-app>
code: <https://dartpad.dev/embed-flutter.html?theme=dark&run=true&split=60&id=b0cdc975cdb48076fc3016586693b92c>

## ----Animation----
(Animation Tutorial)[https://www.youtube.com/playlist?list=PL4cUxeGkcC9gP1qg8yj-Jokef29VRCLt1]
## Animation

<https://api.flutter.dev/flutter/animation/animation-library.html>
    1. Animation Controller controlles the animation ,w
    when it will happen,
    how long it will happen,
    what will happen
    more than one widgets are innvolved
    and if the animation is explicit animation [which requires an AnimationController]
    and if not implecit animation[which is not controller, which will just start and finish]

## Animation type

1. Implicit Animation: basic animation provider by the flutter
2. Explicit Animation: User defined animation designed using AnimationController, it controlles                          the animation
3. Animation Widget.
4. Animation Builder.

## How To: Implicit Animation

1. Pick a widget property to animate [opacity, height,width,color,container]
2. Initialize a state variable for the animated property
3. Set up a trigger for the animation, and choose an end value [setState((){});]
4. Set the duration of the animation [Duration in seconds or milli seconds]


# Clipper: for carving shapes on the container
1. CustomClipperis the base class for clipping in Flutter and it’s used by a four widgets: ClipRect , ClipRRect, ClipOval, ClipPath.
2. Each of these has a defined behavior; so if you wrap a Red Container in a ClipOval, the result is a rounded circle.

## -------- Flutter UI ---------
(Flutter UI)[https://www.youtube.com/playlist?list=PLgGlvOHs_ZdAmpkzmtkFT59shGkv3a9sN]
()[https://www.youtube.com/playlist?list=PLf-j0Hs0PF3uxzMCFLlfJ9W3hRxLzHPGX]
(SpeedCoding)[https://www.youtube.com/playlist?list=PLVY9IbkulBUiKDrT5BFcMKXxtk4b0IJIX]
(Flutter UI + GetX)[https://www.youtube.com/watch?v=svQOxQde0bg&t=269s]


Flutter QA:
1. how to set bundle id while creating a app
2. is it possible to set bunlde id after flutter clean in flutter project
3. Where to update the app name and bundle id and package name 
after the flutter app is created