// ignore_for_file: avoid_print

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
    Map<String, dynamic> headers = {
      "Content-type": "application/json",
      "Accept": "application/json"
    };

    try {
      Map newProfileModel = ProfileModel(
        name: profileModel.name,
        email: profileModel.email,
        phone: profileModel.phone,
        age: profileModel.age,
        gender: profileModel.gender,
        address: profileModel.address,
        district: profileModel.district,
        password: profileModel.password,
      ).toJson();

      var response = await dio.patch(
        "/userupdate/$userId",
        data: newProfileModel,
        options: Options(
          followRedirects: false,
          headers: headers,
        ),
      );

      ProfileModel? editedProfileMode = ProfileModel.fromJson(response.data);

      Get.snackbar('Success', response.data['message'],
          backgroundColor: kwhite);

      print('tftftftdd' + response.statusMessage!);

      print('llllll' + editedProfileMode.name.toString());
      return editedProfileMode;
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
      Get.snackbar('Warning', e.response!.data['message'],
          backgroundColor: kwhite);
      return null;
    }
  }

  static Future<ProfileModel?> resetUserProfile(
      ProfileModel profileModel, String newPassword) async {
    String? userId = GetLocalStorage.getUserIdAndToken('uId');
    Map<String, dynamic> headers = {
      "Content-type": "application/json",
      "Accept": "application/json"
    };
    try {
      var response = await dio.patch(
        '/passwordreset/$userId',
        data: {'password': newPassword},
        options: Options(
          followRedirects: false,
          headers: headers,
        ),
      );
      print('rrrrrrrr');
      print(response.data);

      Get.snackbar('Success', response.data['message'],
          backgroundColor: kwhite);
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
      Get.snackbar('Warning', e.response!.data['message'],
          backgroundColor: kwhite);
      return null;
    }
  }
}
