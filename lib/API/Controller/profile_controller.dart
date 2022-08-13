import 'dart:convert';
import 'dart:developer';

import 'package:car_rental/API/Models/profile_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  var httpClient = http.Client();
  Future loginUser() async {
    var uri = Uri.parse("https://roadsterrental.online/api/user/login");
    var response = await httpClient.post(uri,
        body: {"email": "qwerty@gmail.com", "password": "1234567890"});
    log(response.body.toString());
  }

  Future signUpUser() async {
    var uri = Uri.parse("https://roadsterrental.online/api/user/signup");
    var response = await httpClient.post(uri, body: {
      "name": "aby sebastian",
      "email": "aby123@gmail.com",
      "password": "9876543310",
      "phone": 9090889021,
      "address": "qwertyuio11pjvhfyfydt",
      "age": 25,
      "gender": "male",
      "district": "qbnakfbjagfu"
    });
    log(response.body.toString());
  }

  }
