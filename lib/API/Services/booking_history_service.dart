import 'package:car_rental/API/Controller/bookinghistory_controller.dart';
import 'package:car_rental/API/Models/local_storage.dart';
import 'package:car_rental/API/Models/booking_history_model.dart';
import 'package:car_rental/API/Services/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class BookingHistoryService {
  static Dio dio = DioClient.dio;

  static Future<List<BookingModel>?> upcomingService() async {
    String? userId = GetLocalStorage.getUserIdAndToken('uId');
    try {
      var response = await dio.post('/bookingdata', data: {'userId': userId});
      BookingHistoryModel bookingData =
          BookingHistoryModel.fromJson(response.data);
      return bookingData.bookingData;
    } on DioError catch (e) {
      print('upcoming service error');
      print(e.response!.statusMessage);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<List<BookingModel>?> completedService() async {
    String? userId = GetLocalStorage.getUserIdAndToken('uId');
    try {
      var response =
          await dio.post('/completedtrips', data: {'userId': userId});
      BookingHistoryModel bookingData =
          BookingHistoryModel.fromJson(response.data);
      print('completed service success');
      print(response.data!);
      return bookingData.bookingData;

      // return response.data['bookingData'];
    } on DioError catch (e) {
      print('completed service error');
      print(e.response!.statusMessage);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<List<BookingModel>?> cancelledService() async {
    String? userId = GetLocalStorage.getUserIdAndToken('uId');
    try {
      var response =
          await dio.post('/cancelledtrips', data: {'userId': userId});
      BookingHistoryModel bookingData =
          BookingHistoryModel.fromJson(response.data);
      return bookingData.bookingData;
    } on DioError catch (e) {
      print('cancelled service error');
      print(e.response!.statusMessage);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future cancelTripService(String carId) async {
    try {
      print('kkkkkk');
      BookingHistoryController bookingHistoryController =
          Get.find<BookingHistoryController>();

      var response = await dio.post('/cancel/$carId');
      print(response.data);
      bookingHistoryController.upcomingData();

      Get.snackbar('Message', response.data);
      return response.data!;
    } on DioError catch (e) {
      print('cancel button error');
      print(e.error);
      print(e.response!.statusMessage);
    }
  }
}
