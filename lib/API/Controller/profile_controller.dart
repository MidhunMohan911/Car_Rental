import 'package:car_rental/API/Models/profile_model.dart';
import 'package:car_rental/API/Services/profile_services.dart';

import 'package:get/get.dart';

class UserProfileController extends GetxController {
  // Map<String, dynamic>? userData;
  Rx<ProfileModel?> profileModel = ProfileModel().obs;


  @override
  void onInit() {
    UserProfileService.getUserProfileData().then((value) {
      
      return profileModel.value = value;
    });
    super.onInit();
  }
}
