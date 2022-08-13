// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    ProfileModel({
        this.id,
       required this.name,
       required this.email,
       required this.phone,
       required this.age,
       required this.gender,
       required this.address,
       required this.district,
       required this.isBlock,
        this.token,
    });

    String? id;
    String name;
    String email;
    int phone;
    int age;
    String gender;
    String address;
    String district;
    bool isBlock;
    String? token;

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        age: json["age"],
        gender: json["gender"],
        address: json["address"],
        district: json["district"],
        isBlock: json["isBlock"],
        token: json["Token"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "age": age,
        "gender": gender,
        "address": address,
        "district": district,
        "isBlock": isBlock,
        "Token": token,
    };
}
