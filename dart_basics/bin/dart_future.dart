import 'dart:io';

// import 'package:path_provider/path_provider.dart';
// import 'dart:ui' as ui;
//https://low-orbit.net/dart-read-and-write-files
Future<void> main(List<String> args) async {
  // print('User Order:');
  // print(await createOrderMessage().whenComplete(
  //   () => print('The order is received'),
  // ));
  // countSeconds(10);
  // await printOrderMessage();
  fetchMessage()
    ..then((value) => value)
    ..onError((error, stackTrace) => '$error,$stackTrace')
    ..catchError((error) {
      print('Main: $error');
    });
  // print(await readingFile('dart_generators.dart'));
  // writeAFile('sample', 'This is a sample file writen to demo future');
  // print(await createOrderMessage());
}

Future<String> createOrderMessage() async {
  var order = await fetchUserMessage();
  return 'Your order is $order';
}

Future<String> fetchUserMessage() {
  return Future.delayed(Duration(seconds: 5), (() {
    return 'Large Latte';
  }));
}

Future<void> printOrderMessage() async {
  var order = await fetchUserOrder();
  print('waitig for users orders');
  print('Users order: $order');
}

Future<String> fetchUserOrder() {
  return Future.delayed(Duration(seconds: 5), () {
    return 'Large Latte';
  });
}

void countSeconds(int s) {
  for (int i = 1; i <= s; i++) {
    Future.delayed(
      Duration(seconds: i),
      () {
        print('i:$i');
      },
    );
  }
}

//exception handling in async using try & catch

Future<String> fetchMessage() async {
  try {
    var message = await fetchSomeMessage();
    return message;
  } on Exception catch (e) {
    print('Exception:$e');
    return e.toString();
  } catch (e) {
    print('catch:$e');
    return e.toString();
  } finally {
    return 'failed due to internal error';
  }
}

Future<String> fetchSomeMessage() async {
  return await Future.delayed(
      Duration(seconds: 5), () => throw 'Invalid error message');
}

//reading a file
Future<String> readingFile(String path) async {
  late File textFromFile;
  String fileContent = '';
  try {
    textFromFile = File(path);
    fileContent = await textFromFile.readAsString();
  } catch (e) {
    return e.toString();
  }
  return fileContent;
}

Future<void> writeAFile(String fileName, String fileContent) async {
  /** This would work in the Flutter+Dart */
  // Directory dic = await getApplicationDocumentsDirectory();
  // final File file = File('${dic.path}/$fileName.txt');
  // return await file.writeAsString(fileContent);
  //var file = await File('');
  //final f1 = 'file1.txt';
  // File(fileName).writeAsString(fileContent).then((File file) {
  //   // you could do something here when done
  //   print('done writing the file');
  // });
}
