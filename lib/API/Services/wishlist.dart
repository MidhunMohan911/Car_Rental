import 'package:car_rental/API/Services/dio_client.dart';
import 'package:dio/dio.dart';

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

  static Future getDataFromWishlist({required String userId}) async {
    try {
      var response =
          await dio.post('/getdatafromwishlist', data: {'USERID': userId});
      print(response.data);
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
    }
  }
}
