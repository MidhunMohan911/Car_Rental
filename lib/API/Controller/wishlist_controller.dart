import 'package:car_rental/API/Controller/car_details_controller.dart';
import 'package:car_rental/API/Models/car_model.dart';
import 'package:car_rental/API/Services/car_services.dart';
import 'package:car_rental/API/Services/wishlist_services.dart';
import 'package:get/get.dart';

import '../Models/local_storage.dart';
import '../Models/wishlist_model.dart';

class WishlistController extends GetxController {
  // List<WishlistModel> wishlistId = [];

  List<String> wishlistCarIds = [];

  String? userIdd = GetLocalStorage.getUserIdAndToken("uId");
  

  Future removeWishlistData(String carId, String userId) async {
   
    var data =
        await WishlistServices.removeWishlist(carId: carId, userId: userId);

    print(data);
  }

  Future addWishlistData(String userId, String carId) async {
    try {
      var data = WishlistServices.addWishlist(userId: userId, carId: carId);
      return data;
    } catch (e) {
      print('errorrr');
      print(e);
    }
  }

  Future getWishlistData({required String userId}) async {
    try {
      var wishlistData =
          await WishlistServices.getDataFromWishlist(userId: userId);
    } catch (e) {
      print('ddddd');
      print(e);
    }
  }
}
