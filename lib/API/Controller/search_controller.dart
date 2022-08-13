import 'dart:developer';

import 'package:car_rental/API/Controller/controller.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class SearchController extends GetxController {
  var httpClient = http.Client();
  Controller controller = Get.put(Controller());

  Future searchCars() async {
    var uri = Uri.parse('https://roadsterrental.online/api/user/search');
    var response =
        await httpClient.post(uri, body: controller.totalCars.toString());
    log(response.body.toString());
  }
}
