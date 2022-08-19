import 'package:car_rental/API/Services/dio_client.dart';
import 'package:dio/dio.dart';

class Search {
  static Dio dio = DioClient.dio;
  static Future searchCar({required String brand}) async {
    try {
      var response = await dio.post('/search', data: {"searchText": brand});

      print(response);
    } on DioError catch (e) {
      print(e.message);
    }
  }
}

class SortByDistrict {
  static Dio dio = DioClient.dio;
  static Future sortDistrict({required String place}) async {
    try {
      var response = await dio.post('/searchdistrict', data: {"place": place});
      print(response);
    } on DioError catch (e) {
      print(e.error);
    }
  }
}
