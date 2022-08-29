import 'package:car_rental/API/Models/car_model.dart';
import 'package:car_rental/API/Services/car_services.dart';
import 'package:get/get.dart';

import '../Models/singlecar_model.dart';

class SingleCarController extends GetxController {
  SingleCarModel? carData;

  String carId;

  SingleCarController({required this.carId});

  Future<SingleCarModel?> getSingleCar({required String carId}) async {
    try {
      var data = CarServices.getSingleCar(carId: carId);
      return data;
    } catch (e) {}
  }

  @override
  void onInit() {
    getSingleCar(carId: carId).then((value) => carData = value!);
    super.onInit();
  }
}
