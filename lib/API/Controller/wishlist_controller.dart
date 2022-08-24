import 'package:car_rental/API/Services/wishlist_services.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  Future removeWishlistData(String carId, String userId) async {
    var data =
        await WishlistServices.removeWishlist(carId: carId, userId: userId);
    print(data);
    update();
  }
}
