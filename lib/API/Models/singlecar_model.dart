// To parse this JSON data, do
//
//     final singleCarModel = singleCarModelFromJson(jsonString);

import 'dart:convert';

SingleCarModel singleCarModelFromJson(String str) => SingleCarModel.fromJson(json.decode(str));

String singleCarModelToJson(SingleCarModel data) => json.encode(data.toJson());

class SingleCarModel {
    SingleCarModel({
        this.id,
        this.brand,
        this.model,
        this.fueltype,
        this.regNo,
        this.price,
        this.seats,
        this.location,
        this.mileage,
        this.register,
        this.description,
        this.imgUrl,
        this.url,
        this.imgName,
        this.longdescription,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.offerStatus,
        this.prevAmount,
        this.latitude,
        this.longitude,
        this.bookingcount,
    });

    String? id;
    String? brand;
    String? model;
    String? fueltype;
    String? regNo;
    int? price;
    int? seats;
    String? location;
    String? mileage;
    String? register;
    String? description;
    String? imgUrl;
    String? url;
    String? imgName;
    String? longdescription;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    bool? offerStatus;
    int? prevAmount;
    double? latitude;
    double? longitude;
    int? bookingcount;

    factory SingleCarModel.fromJson(Map<String, dynamic> json) => SingleCarModel(
        id: json["_id"],
        brand: json["brand"],
        model: json["model"],
        fueltype: json["fueltype"],
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
        v: json["__v"],
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
        "fueltype": fueltype,
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
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "OfferStatus": offerStatus,
        "prevAmount": prevAmount,
        "latitude": latitude,
        "longitude": longitude,
        "Bookingcount": bookingcount,
    };
}
