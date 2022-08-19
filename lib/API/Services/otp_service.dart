import 'dart:convert';

import 'package:car_rental/API/Models/otp_model.dart';

import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();

  static Future<OtpLoginResponseModel> otpLogin(String mobileNo) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.parse('https://roadsterrental.online/api/user/otpnumber');
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode({"phone": mobileNo}));

    return otpLoginResponseJSON(response.body);
  }

  static Future<OtpLoginResponseModel> verifyOTP(String mobileNo,String otpHash,String otpCode) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.parse('https://roadsterrental.online/api/user/otpnumber');
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode({"phone": mobileNo,"otp": otpCode,"hash":otpHash}));

    return otpLoginResponseJSON(response.body);
  }
}
