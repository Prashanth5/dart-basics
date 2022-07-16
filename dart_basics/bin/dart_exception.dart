import 'dart:async';

void main(List<String> args) {
  tryfinally();
}

void throwAnException({String? name = null}) {
  try {
    if (name == null) {
      throw Exception();
    }
  } on Exception catch (e) {
    print('this is an exception: ${e.toString()}');
  } catch (e) {
    print(e.toString());
    name = 'some';
  }
}

void notImplemente() {
  try {
    throw TimeoutException('Not in Correct Format');
  }
  // on Exception catch (e) {
  //   print('this is an exception: ${e.toString()}');
  // }
  on UnimplementedError catch (e) {
    print(e.toString());
  } catch (e, s) {
    print(e.toString());
    print(s.toString());
  } finally {
    print('This will always exceute');
  }
}

void tryfinally() {
  try {
    throw 'exception';
  } finally {
    print('This will always exceute');
  }
}
