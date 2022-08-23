// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:car_rental/API/Models/local_storage.dart';
import 'package:car_rental/API/Models/profile_model.dart';
import 'package:car_rental/API/Services/dio_client.dart';
import 'package:car_rental/Screens/Home/home.dart';
import 'package:car_rental/Screens/Log%20in/log_in.dart';
import 'package:car_rental/core/core.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UserAuthService {
  static Dio dio = DioClient.dio;

  static Future loginUser(
      {required String userName, required String password}) async {
    try {
      var response = await dio.post("/login", data: {
        "email": userName,
        "password": password,
      });

      Map<String, String> user = {
        "uId": response.data['_id'],
        "token": response.data['token'],
      };

      GetLocalStorage.saveToken(user);
      print(response.data);
      Get.offAll(HomeScreen());
    } on DioError catch (e) {
      print(e.message);
      Get.snackbar('Warning', e.response!.data['message'],
          backgroundColor: kwhite);
    }
  }

  static Future signUpUser(ProfileModel profileData) async {
    Map<String, dynamic> headers = {
      "Content-type": "application/json",
      "Accept": "application/json"
    };

    // var uri = Uri.parse("https://roadsterrental.online/api/user/signup");
    try {
      Map signUpData = ProfileModel(
        name: profileData.name,
        email: profileData.email,
        phone: profileData.phone,
        age: profileData.age,
        gender: profileData.gender,
        address: profileData.address,
        district: profileData.district,
        password: profileData.password,
      ).toJson();

      // print(signUpData);

      final response = await dio.post(
        "/signup",
        data: signUpData,
        options: Options(
          followRedirects: false,
          headers: headers,
        ),
      );

      Map<String, String> user = {
        "uId": response.data['user'],
        "token": response.data['token'],
      };
      print('ppppp');
      GetLocalStorage.saveToken(user);
      print("lafl");

      print("Success response");
      print(response.data);
    } on DioError catch (e) {
      print('errrrrorrr');
      print(e.response?.statusMessage);
      print(e.error);
      print(e.message);
    } catch (e) {
      print("inside catch");
      print(e);
      return '';
    }
  }
}
