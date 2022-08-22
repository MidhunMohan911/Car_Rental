import 'package:car_rental/API/Models/local_storage.dart';
import 'package:car_rental/API/Models/profile_model.dart';
import 'package:car_rental/API/Services/dio_client.dart';
import 'package:car_rental/core/core.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UserProfileService {
  static Dio dio = DioClient.dio;
  static Future<ProfileModel?> getUserProfileData() async {
    String? userId = GetLocalStorage.getUserIdAndToken("uId");

    try {
      var response = await dio.get("/getprofileuserdata/$userId");

      ProfileModel profileModel = ProfileModel.fromJson(response.data['user']);
      print(response.data);
      return profileModel;
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.data);
      return null;
    }
  }

  static Future<ProfileModel?> updateUserProfile(
      ProfileModel profileModel) async {
    String? userId = GetLocalStorage.getUserIdAndToken('uId');

    try {
      var response = await dio.patch("/userupdate/$userId");
      Get.snackbar('Warning', response.data['message'],
          backgroundColor: kwhite);
      print('tftftftdd' + response.statusMessage!);

      getUserProfileData();
      ProfileModel profileModel = ProfileModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
      Get.snackbar('Warning', e.response!.data['message'],
          backgroundColor: kwhite);
      return null;
    }
  }
}
