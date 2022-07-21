import 'dart:async';
import 'dart:convert';
import 'dart:io';

/**
 * https://medium.com/flutter-community/flutter-stream-basics-for-beginners-eda23e44e32f
 * https://protocoderspoint.com/flutter-dart-stream-basic-example-fetch-crypto-currency-api-data/
 */
void main(List<String> args) async {
//simple stream transformation

  // var counterStream =
  //     Stream<int>.periodic(const Duration(seconds: 1), (event) => event)
  //         .take(10);

  // counterStream.listen((event) {
  //   print(event);
  // });

/**Exception has occurred.
StateError (Bad state: Stream has already been listened to.) */
  // counterStream.forEach((element) {
  //   print(element);
  // });
//.map() ->transformer
  // var doubleCounterStream = counterStream.map((event) => event * 2);
  // doubleCounterStream.forEach((element) {
  //   print(element);
  // });

  // var takeFive = counterStream.map((event) => event * 3).take(6);
  // takeFive.forEach((element) {
  //   print(element);
  // });

  // var streamsub = creatingAStream(Duration(seconds: 5), 10)
  //     .map((event) => event * 234)
  //     .listen((event) {
  //   // print(event);
  // });

//streamsub is the value returned by the listen , on this value we can perform some operation
// like canceling the stream at some point
  // streamsub.onData((data) {
  //   print('streamsub:$data');
  //   if (data >= 1000) {
  //     streamsub.cancel();
  //   }
  // });

  usingStreamController();
}

// Stream<int> creatingAStream(Duration interval, [int? maxCount]) async* {
//   int i = 0;
//   while (true) {
//     await Future.delayed(interval);
//     yield i++;
//     if (i == maxCount) break;
//   }
// }

usingStreamController() {
  //creating a stream controller
  StreamController<dynamic> controller = StreamController<dynamic>();

//using controller stream and setting it to stream, this is an optional set, controller.stream can
// also be used
  Stream stream = controller.stream;

// publishing to the stream
  controller.add(12);
  controller.sink.add(12.34);
  controller.sink.add(true);
  controller.sink.add('string');
  controller.sink.add(Object());

// subscribing to stream
  StreamSubscription subscription = stream.listen((event) {
    print('The event: $event');
  });

  //cancelling the subscription
  subscription.onDone(() {
    subscription.cancel();
  });
  // subscription.cancel();
}
