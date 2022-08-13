import 'dart:convert';

import 'package:car_rental/API/Models/car_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

List urls = ['https://roadsterrental.online/api/user/getcarData'];

class ApiServices extends GetxController {
  //create Get function
  Future<List<CarModel>?> getService(String url) async {
    var response = await http.get(Uri.parse(url));

    //check condition
    try {
      // Json decode
      Map<String, dynamic> body = await json.decode(response.body);

      Welcome welcome = Welcome.fromJson(body);

      return welcome.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
