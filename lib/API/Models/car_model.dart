// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.data,
  });

  List<CarModel> data;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        data:
            List<CarModel>.from(json["data"].map((x) => CarModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CarModel {
  CarModel({
    required this.id,
    required this.brand,
    required this.model,
    required this.fueltype,
    required this.regNo,
    required this.price,
    required this.seats,
    required this.location,
    required this.mileage,
    required this.register,
    required this.description,
    required this.imgUrl,
    required this.url,
    required this.imgName,
    required this.longdescription,
    required this.createdAt,
    required this.updatedAt,
    required this.offerStatus,
    required this.prevAmount,
    required this.latitude,
    required this.longitude,
    required this.bookingcount,
  });

  String id;
  String brand;
  String model;
  Fueltype fueltype;
  String regNo;
  int price;
  int seats;
  String location;
  String mileage;
  String register;
  String description;
  String imgUrl;
  String url;
  String imgName;
  String longdescription;
  DateTime createdAt;
  DateTime updatedAt;
  bool offerStatus;
  int prevAmount;
  double latitude;
  double longitude;
  int bookingcount;

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
        id: json["_id"],
        brand: json["brand"],
        model: json["model"],
        fueltype: fueltypeValues.map[json["fueltype"]]!,
        regNo: json["RegNo"],
        price: json["price"],
        seats: json["seats"],
        location: json["location"],
        mileage: json["mileage"],
        register: json["register"],
        description: json["description"],
        imgUrl: json["imgUrl"],
        url: json["url"],
        imgName: json["imgName"],
        longdescription: json["Longdescription"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        offerStatus: json["OfferStatus"],
        prevAmount: json["prevAmount"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        bookingcount: json["Bookingcount"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "brand": brand,
        "model": model,
        "fueltype": fueltypeValues.reverse[fueltype],
        "RegNo": regNo,
        "price": price,
        "seats": seats,
        "location": location,
        "mileage": mileage,
        "register": register,
        "description": description,
        "imgUrl": imgUrl,
        "url": url,
        "imgName": imgName,
        "Longdescription": longdescription,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "OfferStatus": offerStatus,
        "prevAmount": prevAmount,
        "latitude": latitude,
        "longitude": longitude,
        "Bookingcount": bookingcount,
      };
}

enum Fueltype { PETROL, DIESEL }

final fueltypeValues =
    EnumValues({"Diesel": Fueltype.DIESEL, "Petrol": Fueltype.PETROL});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
