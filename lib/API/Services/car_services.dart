import 'package:car_rental/API/Models/car_model.dart';
import 'package:car_rental/API/Services/dio_client.dart';
import 'package:dio/dio.dart';

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

  static Future<String> getSingleCar({required String carId}) async {
    try {
      var response = await dio.post('/GetSingleCar/$carId');
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
      return '';
    }
  }
}
