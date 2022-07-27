import 'dart:convert' as convert;

// https://codewithandrea.com/articles/parse-json-dart/
// https://docs.flutter.dev/development/data-and-backend/json
//https://jsonformatter.curiousconcept.com/#
void main() async {
  final jsonData = '{ "name": "Pizza da Mario", "cuisine": "Italian" }';
  final jsonData1 =
      '[{"id":1,"title":"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops","price":109.95,"description":"Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday","category":"mens clothing","image":"https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"},{"id":2,"title":"Mens Casual Premium Slim Fit T-Shirts ","price":22.3,"description":"Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.","category":"mens clothing","image":"https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg"}]';
  final jsonData2 = [
    {
      "id": 1,
      "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
      "price": 109.95,
      "description":
          "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
      "category": "mens clothing",
      "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
    },
    {
      "id": 2,
      "title": "Mens Casual Premium Slim Fit T-Shirts ",
      "price": 22.3,
      "description":
          "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
      "category": "mens clothing",
      "image":
          "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg"
    }
  ];

  final json1 = convert.jsonDecode(jsonData1);

  print(json1.runtimeType());

  print(jsonData2.map((e) => CategoriesModel.fromJson(e).title));
}

class CategoriesModel {
  CategoriesModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.image,
  });

  int? id;
  String? title;
  double? price;
  String? description;
  String? image;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json["id"],
      title: json["title"],
      price: json["price"].toDouble(),
      description: json["description"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "image": image,
      };
}
