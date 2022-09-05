// To parse this JSON data, do
//
//     final bookingHistoryModel = bookingHistoryModelFromJson(jsonString);

import 'dart:convert';

BookingHistoryModel bookingHistoryModelFromJson(String str) =>
    BookingHistoryModel.fromJson(json.decode(str));

String bookingHistoryModelToJson(BookingHistoryModel data) =>
    json.encode(data.toJson());

class BookingHistoryModel {
  BookingHistoryModel({
    required this.bookingData,
  });

  List<BookingModel> bookingData;

  factory BookingHistoryModel.fromJson(Map<String, dynamic> json) =>
      BookingHistoryModel(
        bookingData: List<BookingModel>.from(
            json["bookingData"].map((x) => BookingModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bookingData": List<dynamic>.from(bookingData.map((x) => x.toJson())),
      };
}

class BookingModel {
  BookingModel({
    this.id,
    this.carId,
    this.userId,
    this.username,
    this.carname,
    this.cancel,
    this.complete,
    this.startDate,
    this.endDate,
    this.payedAmount,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? carId;
  String? userId;
  String? username;
  String? carname;
  bool? cancel;
  bool? complete;
  String? startDate;
  String? endDate;
  int? payedAmount;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        id: json["_id"],
        carId: json["carId"],
        userId: json["userId"],
        username: json["username"],
        carname: json["carname"],
        cancel: json["cancel"],
        complete: json["complete"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        payedAmount: json["PayedAmount"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "carId": carId,
        "userId": userId,
        "username": username,
        "carname": carname,
        "cancel": cancel,
        "complete": complete,
        "startDate": startDate,
        "endDate": endDate,
        "PayedAmount": payedAmount,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
