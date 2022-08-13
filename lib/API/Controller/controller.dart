import 'package:car_rental/API/Models/car_model.dart';
import 'package:car_rental/API/Services/services.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  List<CarModel> totalCars = [];
  var loading = true.obs;
  Future<List<CarModel>> getData(String url) async {
    loading.value = true;
    try {
      var data = await ApiServices().getService(url);
      loading.value = false;
      return data!;
    } catch (e) {
      // Get.snackbar('oops! ', '$e');
      loading.value = false;
      return [];
    }
  }
  @override
  void onInit() {
     getData(urls[0]).then((value) => totalCars = value);
    super.onInit();
  }
  
}
