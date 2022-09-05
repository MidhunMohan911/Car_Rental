// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

// class UserProfileModel {
//   UserProfileModel({
//     required this.data,
//   });

//   List<ProfileModel> data;

//   factory UserProfileModel.fromJson(
//     Map<String, dynamic> json,
//     String key,
//   ) {
//     return UserProfileModel(
//       data: List<ProfileModel>.from(
//           json[key].map((x) => ProfileModel.fromJson(x))),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "user": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.age,
    this.gender,
    this.address,
    this.district,
    this.password,
  });
  String? id;
  String? name;
  String? email;
  int? phone;
  int? age;
  String? gender;
  String? address;
  String? district;
  String? password;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        age: json["age"],
        gender: json["gender"],
        address: json["address"],
        district: json["district"],
        password: json["password"]
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
        "password": password,
      };
}
