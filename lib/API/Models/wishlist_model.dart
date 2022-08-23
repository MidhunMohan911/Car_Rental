// To parse this JSON data, do
//
//     final wishlistModel = wishlistModelFromJson(jsonString);

import 'dart:convert';

List<WishlistModel> wishlistModelFromJson(String str) => List<WishlistModel>.from(json.decode(str).map((x) => WishlistModel.fromJson(x)));

String wishlistModelToJson(List<WishlistModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WishlistModel {
    WishlistModel({
         this.id,
         this.brand,
         this.model,
         this.imgUrl,
    });

    String? id;
    String? brand;
    String? model;
    String? imgUrl;

    factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
        id: json["_id"],
        brand: json["brand"],
        model: json["model"],
        imgUrl: json["imgUrl"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "brand": brand,
        "model": model,
        "imgUrl": imgUrl,
    };
}
