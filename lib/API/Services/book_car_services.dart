import 'package:car_rental/API/Services/dio_client.dart';
import 'package:dio/dio.dart';

class BookCarServices {
  static Dio dio = DioClient.dio;

  static Future bookCarService(
      String tripStarts, String tripends, String carId) async {
    try {
      var response = await dio.post('/checkdate',
          data: {'id': carId, 'val': tripStarts, 'val2': tripends});

      print(response.data);
    } on DioError catch (e) {
      print(e.error);
      print('checkdate error');
      print(e.response!.statusMessage);
    }
  }


  
}
