// ignore_for_file: avoid_print

import 'package:car_rental/API/Models/local_storage.dart';
import 'package:car_rental/API/Models/profile_model.dart';
import 'package:car_rental/API/Services/profile_services.dart';

import 'package:get/get.dart';

class UserProfileController extends GetxController {
  Rx<ProfileModel?> profileModel = ProfileModel().obs;
  String? userId = GetLocalStorage.getUserIdAndToken("uId");

  Future<void> updateUserData(ProfileModel profile, String userId) async {
    try {
      profileModel.value =
          await UserProfileService.updateUserProfile(profile, userId);
    } catch (e) {
      print("Catch block called");
      print(e);
    }
  }

  Future<ProfileModel?> getUserData(String userId) async {
    try {
      var data = await UserProfileService.getUserProfileData(userId);

      return data!;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  void onInit() {
    UserProfileService.getUserProfileData(userId!).then((value) {
      return profileModel.value = value;
    });
    super.onInit();
  }
}
