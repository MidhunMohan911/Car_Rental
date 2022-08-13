// To parse this JSON data, do
//
//     final districtModel = districtModelFromJson(jsonString);

import 'dart:convert';

DistrictModel districtModelFromJson(String str) => DistrictModel.fromJson(json.decode(str));

String districtModelToJson(DistrictModel data) => json.encode(data.toJson());

class DistrictModel {
    DistrictModel({
      required  this.getdistrict,
    });

    List<Getdistrict> getdistrict;

    factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
        getdistrict: List<Getdistrict>.from(json["Getdistrict"].map((x) => Getdistrict.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Getdistrict": List<dynamic>.from(getdistrict.map((x) => x.toJson())),
    };
}

class Getdistrict {
    Getdistrict({
        this.id,
        required this.district,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? id;
    String district;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory Getdistrict.fromJson(Map<String, dynamic> json) => Getdistrict(
        id: json["_id"],
        district: json["district"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "district": district,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}
