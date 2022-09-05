import 'dart:convert';

import 'package:car_rental/API/Models/car_model.dart';
import 'package:car_rental/API/Models/singlecar_model.dart';
import 'package:car_rental/API/Services/dio_client.dart';
import 'package:dio/dio.dart';

import '../Models/local_storage.dart';

class CarServices {
  static Dio dio = DioClient.dio;

  //create Get function
  static Future<List<CarModel>?> getCarData(String url, String key,
      {bool isSearch = false, String? brand}) async {
    //check condition
    try {
      var response = isSearch
          ? await dio.post(url, data: {
              "searchText": brand,
            })
          : await dio.get(url);
      // Json decode

      TotalCarsModel totalCarsModel =
          TotalCarsModel.fromJson(response.data, key);
      return totalCarsModel.data;
    } on DioError catch (e) {
      print(e.response!.statusMessage);
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  static Future<CarModel?> getSingleCar({required String carId}) async {
    try {
      var response = await dio.post('/GetSingleCar/$carId');
      print(response.data);
      CarModel? singlecarData = CarModel.fromJson(response.data);
      print(singlecarData.brand);
      return singlecarData;
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
      return null;
    }
  }

  /////
  ///

  // static Future addWishlist(CarModel carIdModel) async {
  //   String? userId = GetLocalStorage.getUserIdAndToken("uId");
  //   String carId = carIdModel.id;
  //   try {
  //     var response =
  //         await dio.post('/dataTowishlist/$carId', data: {'USERID': userId});
  //     print('add wishlist successfully');
  //     print(response.data);
  //   } on DioError catch (e) {
  //     print(e.error);
  //     print(e.response!.statusMessage);
  //   }
  // }

  // static Future removeWishlist(CarModel carIdModel) async {
  //   String? userId = GetLocalStorage.getUserIdAndToken("uId");
  //   String carId = carIdModel.id;
  //   try {
  //     var response = await dio
  //         .post('/removefromwishlist/$carId', data: {'USERID': userId});
  //     print(response.data);

  //     return response.data;
  //   } on DioError catch (e) {
  //     print('remove aavunnilla');
  //     print(e.error);
  //     print(e.response!.statusMessage);
  //   }
  // }

  // static Future<List<CarModel>?> getDataFromWishlist(String userId) async {
  //   try {
  //     var response =
  //         await dio.post('/getallwishlistdata', data: {'USERID': userId});
  //     print('total wishlist data');
  //     print(response.data);

  //     List<CarModel>? wishlistData =
  //         carModelFromJson(jsonEncode(response.data));

  //     print(wishlistData.length);
  //     print("aaaaaaaaaaaaaaaaaaa");

  //     return wishlistData;
  //   } on DioError catch (e) {
  //     print('rrrr');
  //     print(e.error);
  //     print(e.response!.statusMessage);
  //     return null;
  //   }
  // }
}
