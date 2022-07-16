import 'dart:math';

import 'package:dart_basics/dart_basics.dart' as dart_basics;

void main(List<String> arguments) {
  print('Hello world: ${dart_basics.calculate()}!');
  for (int i = 153; i <= 371; i++) {
    armstrongNumber(i);
  }
  armstrongNumber(0);
}

void loop1() {
  /*for(initialization; condition; test expression){
    // Body of the loop
} */
  for (int i = 1; i <= 10; i++) {
    print('Items $i');
  }
}

void loop2() {
  /**
   * for (var value in values){}
   */

  var names = ['Name-1', 'Name-2', 'Name-3', 'Name-4', 'Name-5'];
  for (var name in names) {
    print('$name,${name.length}');
  }
}

void loop3() {
  /**
   * collection.foreach(void f(value))
   */
  var names = ['Name-1', 'Name-2', 'Name-3', 'Name-4', 'Name-5'];
  names.forEach(
    (element) => print(element),
  );
}

void loop4() {
  /**
   * while(condition){
    text expression;
    // Body of loop
}
   */

  int i = 10;
  while (i > 0) {
    print(i);
    i -= 1;
  }
}

void loop5() {
  /**
   * do{
    text expression;
    // Body of loop
}while(condition);
   */
  int i = 10;
  do {
    print(i);
    i *= 2;
  } while (i <= 100);
}

void factorial(int number) {
  int factValue = 1;
  for (var i = number; i >= 1; i--) {
    factValue = factValue * i;
  }
  print(factValue);
}

void getGCD(int firstNum, int secondNum) {
  //https://www.cuemath.com/numbers/greatest-common-divisor-gcd/
//https://www.geeksforgeeks.org/c-program-find-gcd-hcf-two-numbers/
  while (firstNum != secondNum) {
    if (firstNum > secondNum) {
      firstNum = firstNum - secondNum;
    } else {
      secondNum = secondNum - firstNum;
    }
    print('firstnum:$firstNum, secondNum:$secondNum');
  }
  print(secondNum);
}

void numberFactors(int number) {
  print('Factors for $number');
  for (int i = 1; i <= number; i++) {
    if (number % i == 0) {
      print(i);
    }
  }
}

void armstrongNumber(int number) {
  // 153 = 1*1*1 + 5*5*5 + 3*3*3 [result is the sum of cubes of each number]
  var originalNumber = number;
  int r = 0;
  int s = 0;
  if (number == 0) return;
  while (number != 0) {
    r = number % 10;
    number = number ~/ 10;
    s += cubeofInt(r);
    if (s == originalNumber) {
      print('$originalNumber is amstrong');
    }
  }
  (s == originalNumber)
      ? print('$originalNumber is amstrong')
      : print('$originalNumber not armstrong');
}

int cubeofInt(int number) {
  return pow(number, 3).toInt();
}
