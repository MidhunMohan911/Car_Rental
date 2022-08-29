import 'package:car_rental/API/Services/wishlist_services.dart';
import 'package:get/get.dart';

import '../Models/local_storage.dart';
import '../Models/wishlist_model.dart';

class WishlistController extends GetxController {
  List<WishlistModel> wishlistId = [];
  String? userId = GetLocalStorage.getUserIdAndToken("uId");
  Future removeWishlistData(String carId, String userId) async {
    var data =
        await WishlistServices.removeWishlist(carId: carId, userId: userId);
    print(data);
    update();
  }

  Future addWishlistData(String userId, String carId) async {
    try {
      var data = WishlistServices.addWishlist(userId: userId, carId: carId);
      return data;
    } catch (e) {
      print('errorrr');
      print(e);
    }
    update();
  }

  Future<List<WishlistModel>?> getWishlistData({required String userId}) async {
    try {
      var wishlistData =
          await WishlistServices.getDataFromWishlist(userId: userId);
      print(wishlistData!.first.brand);
      return wishlistData;
    } catch (e) {
      print('ddddd');
      print(e);
    }
    update();
  }

  @override
  void onInit() {
    getWishlistData(userId: userId!).then((value) => wishlistId = value!);
    super.onInit();
  }
}
