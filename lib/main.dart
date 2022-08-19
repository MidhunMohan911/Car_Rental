import 'package:car_rental/API/Models/local_storage.dart';
import 'package:car_rental/Screens/Home/home.dart';
import 'package:car_rental/Screens/Log%20in/log_in.dart';
import 'package:car_rental/core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
  //var response = await ProfileController().signUpUser();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? user = GetLocalStorage.getUserIdAndToken("token");

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor: const Color.fromARGB(255, 235, 229, 229),
        appBarTheme: AppBarTheme(color: themeColor),
        primarySwatch: Colors.blue,
      ),
      home: user == null ? LoginPage() : HomeScreen(),
    );
  }
}
