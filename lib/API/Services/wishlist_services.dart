// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:car_rental/API/Models/wishlist_model.dart';
import 'package:car_rental/API/Services/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../Controller/car_details_controller.dart';

class WishlistServices {
  static Dio dio = DioClient.dio;

  static Future addWishlist(
      {required String userId, required String carId}) async {
    try {
      CarDetailsController carDetailsController =
          Get.find<CarDetailsController>();
      var response =
          await dio.post('/dataTowishlist/$carId', data: {'USERID': userId});

      carDetailsController.getWishlistId(userId: userId);

      print(response.data);
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
    }
  }

  static Future removeWishlist(
      {required String carId, required String userId}) async {
    try {
      CarDetailsController carDetailsController =
          Get.find<CarDetailsController>();
      var response = await dio
          .post('/removefromwishlist/$carId', data: {'USERID': userId});
      print(response.data);

      carDetailsController.getWishlistId(userId: userId);

      return response.data;
    } on DioError catch (e) {
      print('remove aavunnilla');
      print(e.error);
      print(e.response!.statusMessage);
    }
  }

  static Future<List<WishlistModel>?> getAllDataFromWishlist(
      {required String userId}) async {
    try {
      var response =
          await dio.post('/getallwishlistdata', data: {'USERID': userId});
      print(response.data);

      List<WishlistModel> wishlistData =
          wishlistModelFromJson(jsonEncode(response.data));
      return wishlistData;
    } on DioError catch (e) {
      print('rrrr');
      print(e.error);
      print(e.response!.statusMessage);
      return null;
    }
  }

  static Future<List<dynamic>?> getDataFromWishlist(
      {required String userId}) async {
    try {
      var response =
          await dio.post('/getdatafromwishlist', data: {'USERID': userId});
      print(response.data['wishlist'].runtimeType);

      print("GET DATA WISHLIST CALLED");

      return response.data['wishlist'];
    } on DioError catch (e) {
      print('rrrr');
      print(e.error);
      print(e.response!.statusMessage);
      return null;
    }
  }
}
