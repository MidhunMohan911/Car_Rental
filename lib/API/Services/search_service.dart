import 'package:car_rental/API/Models/car_model.dart';
import 'package:car_rental/API/Services/dio_client.dart';
import 'package:dio/dio.dart';

class SortByDistrict {
  static Dio dio = DioClient.dio;
  static Future<List<CarModel>?> sortDistrict({required String place}) async {
    try {
      var response = await dio.post('/searchdistrict', data: {"place": place});
      print(response);
      TotalCarsModel totalCarsModel =
          TotalCarsModel.fromJson(response.data, 'data');
      return totalCarsModel.data;
    } on DioError catch (e) {
      print(e.error);
    }
  }
}
