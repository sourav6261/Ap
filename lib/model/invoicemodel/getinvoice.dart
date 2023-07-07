// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

// import 'dart:convert';

// User userFromJson(String str) => User.fromJson(json.decode(str));

// String userToJson(User data) => json.encode(data.toJson());

// class User {
//   bool status;
//   String message;
//   List<Datum> data;

//   User({
//     required this.status,
//     required this.message,
//     required this.data,
//   });

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         status: json["status"],
//         message: json["message"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }

// class Datum {
//   String? id;
//   String name;
//   String? address;
//   SiteName? siteName;
//   int? advancePayment;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int v;
//   List<Item> items;
//   int? totalAmount;

//   Datum({
//     required this.id,
//     required this.name,
//     this.address,
//     this.siteName,
//     this.advancePayment,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//     required this.items,
//     this.totalAmount,
//   });

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["_id"],
//         name: json["name"],
//         address: json["address"],
//         siteName: siteNameValues.map[json["siteName"]]!,
//         advancePayment: json["advancePayment"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//         items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
//         totalAmount: json["totalAmount"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "name": name,
//         "address": address,
//         "siteName": siteNameValues.reverse[siteName],
//         "advancePayment": advancePayment,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//         "items": List<dynamic>.from(items.map((x) => x.toJson())),
//         "totalAmount": totalAmount,
//       };
// }

// class Item {
//   String itemsDiscrition;
//   int quantity;
//   int? unitPrice;
//   int? total;
//   String? id;

//   Item({
//     required this.itemsDiscrition,
//     required this.quantity,
//     this.unitPrice,
//     this.total,
//     this.id,
//   });

//   factory Item.fromJson(Map<String, dynamic> json) => Item(
//         itemsDiscrition: json["itemsDiscrition"],
//         quantity: json["quantity"],
//         unitPrice: json["unitPrice"],
//         total: json["total"],
//         id: json["_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "itemsDiscrition": itemsDiscrition,
//         "quantity": quantity,
//         "unitPrice": unitPrice,
//         "total": total,
//         "_id": id,
//       };
// }

// enum SiteName { MAGARPATTA, GULMOHAR_SOCIETY }

// final siteNameValues = EnumValues({
//   "Gulmohar Society": SiteName.GULMOHAR_SOCIETY,
//   "Magarpatta": SiteName.MAGARPATTA
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }

import 'dart:convert';

List<FinalData> finalDataFromJson(String str) =>
    List<FinalData>.from(json.decode(str).map((x) => FinalData.fromJson(x)));

String finalDataToJson(List<FinalData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FinalData {
  String id;
  String name;
  String address;
  String siteName;
  List<Item> items;
  int advancePayment;
  int totalAmount;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  FinalData({
    required this.id,
    required this.name,
    required this.address,
    required this.siteName,
    required this.items,
    required this.advancePayment,
    required this.totalAmount,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory FinalData.fromJson(Map<String, dynamic> json) => FinalData(
        id: json["_id"],
        name: json["name"],
        address: json["address"],
        siteName: json["siteName"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        advancePayment: json["advancePayment"],
        totalAmount: json["totalAmount"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "address": address,
        "siteName": siteName,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "advancePayment": advancePayment,
        "totalAmount": totalAmount,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Item {
  String itemsDiscrition;
  int quantity;
  dynamic unitPrice;

  Item({
    required this.itemsDiscrition,
    required this.quantity,
    this.unitPrice,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemsDiscrition: json["itemsDiscrition"],
        quantity: json["quantity"],
        unitPrice: json["unitPrice"],
      );

  Map<String, dynamic> toJson() => {
        "itemsDiscrition": itemsDiscrition,
        "quantity": quantity,
        "unitPrice": unitPrice,
      };
}
