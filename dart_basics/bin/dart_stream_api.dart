import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';
// https://protocoderspoint.com/flutter-dart-stream-basic-example-fetch-crypto-currency-api-data/
void main(List<String> args) async {
  const timerDuration = 5;
  Timer.periodic(Duration(seconds: timerDuration * 3), (timer) {
    if (timer.tick == timerDuration) {
      timer.cancel();
      controller.close();
      return;
    }
    print('timer: ${timer.tick}');
    makeApiCall();
  });

  //listing to a stream
  // StreamSubscription sub = controller.stream.take(5).listen((event) {
  //   print('Subscribed: ${event.name},${event.logourl},${event.price}');
  // });
  StreamSubscription sub = controller.stream.listen((event) {
    print('Subscribed: ${event.name},${event.logourl},${event.price}');
  });

  sub.onDone(() {
    sub.cancel();
  });
}

//making an api call
StreamController<DataModel> controller = StreamController<DataModel>();
Future<void> makeApiCall() async {
  const apiurl =
      'https://api.nomics.com/v1/currencies/ticker?key=2c4379549d2d118c9342bc0639cbdf9bc8abfe7b&ids=BTC';
  Uri url = Uri.parse(apiurl);
  var respose = await http.get(url);
  if (respose.statusCode == 200) {
    List dataModel = convert.json.decode(respose.body);
    // print(dataModel.first);
    DataModel dm = DataModel.fromJson(dataModel.first);

    //publising the data to the stream
    controller.sink.add(dm);

    // print(dm.toJson());
  } else {
    print(respose.body);
  }
}

//model with name, logo and price

class DataModel {
  String? name;
  String? logourl;
  String? price;

  DataModel(this.name, this.logourl, this.price);

  DataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    logourl = json['logo_url'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'logo_url': logourl, 'price': price};
  }
}
