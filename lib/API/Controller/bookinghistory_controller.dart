import 'package:car_rental/API/Models/booking_history_model.dart';
import 'package:car_rental/API/Services/booking_history_service.dart';
import 'package:get/get.dart';

class BookingHistoryController extends GetxController {
  RxList<BookingModel> upcomingTrips = <BookingModel>[].obs;
  // RxList<BookingModel> completedTrips = <BookingModel>[].obs;
  // RxList<BookingModel> cancelledTrips = <BookingModel>[].obs;
  RxList completedTrips = [].obs;
  RxList cancelledTrips = [].obs;

  Future<List<BookingModel>> upcomingData() async {
    try {
      var data = await BookingHistoryService.upcomingService();
      print('upcoming controller success');
      print(data);
      return data!;
    } catch (e) {
      print('upcoming controller error');
      print(e);
      return [];
    }
  }

  Future<void> completedData() async {
    try {
      var data = await BookingHistoryService.upcomingService();
      print('completed controller success');
      print(data);
      completedTrips.value = data!;
    } catch (e) {
      print('completed controller error');
      print(e);
    }
  }

  Future<List<BookingModel>> cancelledData() async {
    try {
      var data = await BookingHistoryService.upcomingService();
      print('cancelled controller success');
      print(data);
      return data!;
    } catch (e) {
      print('cancelled controller error');
      print(e);
      return [];
    }
  }

  Future cancelTripData(String carId) async {
    try {
      var data = BookingHistoryService.cancelTripService(carId);
      return data;
    } catch (e) {
      print('cancel controller error');
      print(e);
    }
  }

  @override
  void onInit() {
    upcomingData().then((value) => upcomingTrips.value = value);
    completedData();
    cancelledData().then((value) => cancelledTrips.value = value);
    super.onInit();
  }
}
