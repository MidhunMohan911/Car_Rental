import 'package:car_rental/API/Models/car_model.dart';
import 'package:car_rental/API/Services/wishlist.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  Rx<TotalCarsModel> totalCars = TotalCarsModel(data: []).obs;

  @override
  void onInit() {
    WishlistServices.getDataFromWishlist(userId: 'USERID')
        .then((value) => totalCars.value = value);
    super.onInit();
  }
}
