import 'dart:convert';
import 'package:car_rental/API/Models/wishlist_model.dart';
import 'package:car_rental/API/Services/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class WishlistServices {
  static Dio dio = DioClient.dio;

  static Future addWishlist(
      {required String userId, required String carId}) async {
    try {
      var response =
          await dio.post('/dataTowishlist/$carId', data: {'USERID': userId});
      print(response.data);
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
    }
  }

  static Future removeWishlist(
      {required String carId, required String userId}) async {
    try {
      var response = await dio
          .post('/removefromwishlist/$carId', data: {'USERID': userId});
      print(response.data);
      
      return response.data;
    } on DioError catch (e) {
      print('remove aavunnilla');
      print(e.error);
      print(e.response!.statusMessage);
    }
  }

  static Future<List<WishlistModel>?> getDataFromWishlist(
      {required String userId}) async {
    try {
      var response =
          await dio.post('/getallwishlistdata', data: {'USERID': userId});
      print(response.data);

      List<WishlistModel> wishlistData =
          wishlistModelFromJson(jsonEncode(response.data));
      return wishlistData;
    } on DioError catch (e) {
      print('myrrr');
      print(e.error);
      print(e.response!.statusMessage);
    }
  }
}
