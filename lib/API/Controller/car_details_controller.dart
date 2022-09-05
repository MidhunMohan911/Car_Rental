import 'package:car_rental/API/Models/car_model.dart';
import 'package:car_rental/API/Models/local_storage.dart';
import 'package:car_rental/API/Services/car_services.dart';
import 'package:car_rental/API/Services/wishlist_services.dart';
import 'package:get/state_manager.dart';

class CarDetailsController extends GetxController {
  Rx<CarModel?> carModel = Rxn<CarModel>();
  String? carId;
  RxList? wishlistIds = [].obs;

  CarDetailsController({required this.carId});

  String? userIdd = GetLocalStorage.getUserIdAndToken("uId");

  getOneCarDetails(String carId) async {
    carModel.value = await CarServices.getSingleCar(carId: carId);
  }

  Future<void> getWishlistId({required String userId}) async {
    try {
      var data = await WishlistServices.getDataFromWishlist(userId: userId);
      wishlistIds!.value = data!;
    } catch (e) {
      print('ddddd');

      print(e);
    }
    // update();
  }

  @override
  void onInit() {
    print("ON INIT STATE CALLED");
    getWishlistId(userId: userIdd!);
    getOneCarDetails(carId!);

    // TODO: implement onInit
    super.onInit();
  }
}
