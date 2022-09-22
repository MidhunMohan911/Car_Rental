import 'dart:convert';

import 'package:car_rental/API/Models/booking_details_model.dart';
import 'package:car_rental/API/Models/local_storage.dart';
import 'package:car_rental/API/Services/dio_client.dart';
import 'package:car_rental/Screens/Booking%20History/booking_history.dart';
import 'package:car_rental/Screens/Home/home.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class PaymentService {
  static Dio dio = DioClient.dio;

  static Future razorPayService() async {
    String? userId = GetLocalStorage.getUserIdAndToken("uId");

    try {
      var response = await dio.post('/razorpay');
      print(response.data);
    } catch (e) {}
  }

  static Future razorpaySuccess(
    BookingDetailsModel bookingModel,
  ) async {
    String? userId = GetLocalStorage.getUserIdAndToken('uId');
    String? userName = GetLocalStorage.getUserIdAndToken('name');
    String? userEmail = GetLocalStorage.getUserIdAndToken('email');

    print("book id");

    print(bookingModel.id);

    Map payload = {
      'USEREMAIL': userEmail,
      'USERID': userId,
      'USERNAME': userName,
      'amount': bookingModel.amount,
      'carName': bookingModel.carName,
      'end': bookingModel.tripEnds,
      'start': bookingModel.tripStarts
    };

    try {
      var response = await dio.post('/razorpaysuccess/${bookingModel.id!}',
          data: jsonEncode(payload));

      Get.offAll(BookingHistory());

      return response.data;
    } on DioError catch (e) {
      print('success errorrrrr');
      print(bookingModel.id! +
          bookingModel.amount +
          bookingModel.carName +
          bookingModel.tripEnds +
          bookingModel.tripStarts);
      print(e.error);
      print(e.response!.statusMessage);
    } catch (e) {
      print(e.toString());
      print("catch block callecf");
    }
  }
}
