import 'package:car_rental/API/Models/profile_model.dart';
import 'package:car_rental/API/Services/profile_services.dart';

import 'package:get/get.dart';

class UserProfileController extends GetxController {
  // Map<String, dynamic>? userData;
  Rx<ProfileModel?> profileModel = ProfileModel().obs;

  Future updateUserData(ProfileModel profile) async {
    try {
      var data = await UserProfileService.updateUserProfile(profile);

      print("called controller class $data");

      profileModel.value = data;
    } catch (e) {
      print("Catch block called");
      print(e);
    }
    update();
  }

  Future<ProfileModel?> getUserData() async {
    try {
      var data = await UserProfileService.getUserProfileData();

      return data;
    } catch (e) {
      print(e);
    }
    update();
  }

  @override
  void onInit() {
    UserProfileService.getUserProfileData().then((value) {
      return profileModel.value = value;
    });
    super.onInit();
  }
}
