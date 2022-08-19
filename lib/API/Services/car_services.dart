
import 'package:car_rental/API/Models/car_model.dart';
import 'package:car_rental/API/Services/dio_client.dart';
import 'package:dio/dio.dart';

class CarServices {
  static Dio dio = DioClient.dio;
  
  

  //create Get function
  static Future<List<CarModel>?> getCarData(String url, String key) async {
    //check condition
    try {
      var response = await dio.get(url);
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
}
