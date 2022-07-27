import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

void main(List<String> args) async {
  // await deleteRecord(1);
  // Album album = await getResponse();
  // print('Userid:${album.userId}');
  // print('id:${album.id}');
  // print('Title:${album.title}\n');
  await getAllAlbums();
  // Albums albums = await getAllAlbums();
  // for (var album in albums.toAlbumList()) {
  //   print('${album.keys}: ${album.values}');
  // }
}

//api
final String baseUrl = 'https://jsonplaceholder.typicode.com/albums/';

//creating a model
// ignore: slash_for_doc_comments
/**
{
"userId": 1,
"id": 1,
"title": "quidem molestiae enim"
},
 */
class Album {
  int? userId;
  int? id;
  String? title;
  Album(this.userId, this.id, this.title);

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        json['userId'],
        json['id'],
        json['title'],
      );

  Map<String, dynamic> toJson() => {'userId': userId, 'id': id, 'title': title};
  String getDetails() {
    return 'uid:$userId,id:$id,title:$title';
  }
}

List<Album> albumFromJson(String str) =>
    List<Album>.from(convert.json.decode(str).map((x) => Album.fromJson(x)));

//this class will handle list of map
class Albums {
  List<Map<String, dynamic>> albums;
  Albums(this.albums);
  factory Albums.fromList(List<Map<String, dynamic>> albumList) =>
      Albums(albumList);
  List<Map<String, dynamic>> toAlbumList() => albums;
}

//deleting a record
Future<void> deleteRecord(var id) async {
  var deleteUrl = baseUrl + '$id';
  var headers = {'Content-type': 'application/json'};
  var response = await http.delete(Uri.parse(deleteUrl), headers: headers);
  print(response.statusCode);
  print(response.body);
}

Future<Album> getResponse() async {
  http.Response response = await http.get(Uri.parse(baseUrl));
  Album? album;
  // print(response.statusCode);
  // print(response.body);
  List json = convert.json.decode(response.body);
  if (response.statusCode == 200) {
    for (var jsonAlbum in json) {
      album = Album.fromJson(jsonAlbum);
      // print('Userid:${album.userId}');
      // print('id:${album.id}');
      // print('Title:${album.title}\n');
    }
    return album!;
  } else {
    print(response.statusCode);
    return throw ('Error Retriving data');
  }
}

Future<Albums> getAllAlbums() async {
  http.Response response = await http.get(Uri.parse(baseUrl));
  print(response.body);
  albumFromJson(response.body).forEach((element) {
    print(element.title);
  });
  List<dynamic> albums = convert.jsonDecode(response.body);
  // albums.forEach((element) {
  //   Album a = element;
  //   print(a.id);
  // });
  return Albums.fromList(albums.cast<Map<String, dynamic>>());
}


/**
// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);

import 'dart:convert';

List<Album> albumFromJson(String str) => List<Album>.from(json.decode(str).map((x) => Album.fromJson(x)));

String albumToJson(List<Album> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Album {
    Album({
        this.userId,
        this.id,
        this.title,
    });

    int userId;
    int id;
    String title;

    factory Album.fromJson(Map<String, dynamic> json) => Album(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
    };
}

 */
