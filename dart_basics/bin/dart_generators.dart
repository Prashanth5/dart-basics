import 'dart:io';

//https://flutteragency.com/what-is-yield-keyword-in-flutter/#:~:text=Yield%20adds%20a%20value%20to,doesn't%20terminate%20the%20function.&text=When%20the%20yield%20statement%20executes,the%20current%20implementations%20it%20does.
void main(List<String> args) {
  // callStream();
  // callIterable();

  countDownFrom(10).forEach((element) {
    print(element);
  });
  countDownFromStream(10).listen((event) {
    print('event:$event');
  });
}

//generators: generatord a bunch of values
//sync generators
//makes use of iterable as return type, yield to retrurn value and sync*
Iterable<int> counter() sync* {
  var i = 1;
  while (i <= 10) {
    yield i;
    i++;
    sleep(Duration(seconds: 1));
  }
}

void callIterable() {
  print('Iterable Started');
  //foreach is ued to access the values coming from the genrator
  counter().forEach((element) {
    print(element);
  });
  print('ended');
}

//async generators
// makes use of Stream as return type, yield to return values and async* to inform it is an async
Stream<int> counterStream() async* {
  var i = 1;
  while (i <= 10) {
    yield i;
    i++;
    sleep(Duration(seconds: 1));
  }
}

void callStream() {
  print('Stream Start');
  counterStream().listen(
    (event) {
      print(event);
    },
    onDone: () {
      print('Stream is completed');
    },
  );
  print('end');
}

// iterable with the recursive function. where we are makking use of sync* and yield*

Iterable<int> countDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    // Future.delayed(Duration(seconds: 1));
    sleep(Duration(seconds: 1));
    yield* countDownFrom(n - 1);
  }
}

Stream<int> countDownFromStream(int n) async* {
  if (n > 0) {
    yield n;
    await Future.delayed(Duration(seconds: 1));
    // sleep(Duration(seconds: 1));
    yield* countDownFromStream(n - 1);
  }
}
