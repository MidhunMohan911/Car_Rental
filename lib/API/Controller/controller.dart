import 'package:car_rental/API/Models/car_model.dart';
import 'package:car_rental/API/Services/car_services.dart';
import 'package:car_rental/API/Services/loginandsignup.dart';
import 'package:car_rental/API/Services/search_service.dart';
import 'package:car_rental/Screens/Home/home.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  String? selected;
  int? ageSelected;
  String? districtSelected;
  List<int> ageList = List.generate(27, (index) => 18 + index);
  // var httpClient = http.Client();
  var loginLoading = false.obs;
  RxList<CarModel> totalCars = <CarModel>[].obs;

  List<String> districts = [
    "Kasargod",
    "Kannur",
    "Wayanad",
    "Kozhikode",
    "Malappuram",
    "Palakkad",
    "Thrissur",
    "Ernakulam",
    "Idukki",
    "Kottayam",
    "Alappuzha",
    "Pathanamthitta",
    "Kollam",
    "Trivandrum",
  ];

  Future loginFile(String userName, String password) async {
    loginLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    var data =
        await UserAuthService.loginUser(userName: userName, password: password);
    loginLoading.value = false;
    Get.offAll(HomeScreen());
    return data;
  }

  var loading = true.obs;
  List<String> listType = [
    'Male',
    'Female',
    'Other',
  ];
  void setSelected(String value, String checkingKey) {
    if (checkingKey == "age") {
      ageSelected = int.parse(value);
    } else if (checkingKey == "gender") {
      selected = value;
    } else if (checkingKey == "district") {
      districtSelected = value;
    }

    update();
  }

  Future<List<CarModel>> getData(
    String url,
    String key, {
    bool isSearch = false,
    String? brand,
  }) async {
    loading.value = true;
    try {
      var data = await CarServices.getCarData(
        url,
        key,
        isSearch: isSearch,
        brand: brand,
      );
      loading.value = false;
      return data!;
    } catch (e) {
      // Get.snackbar('oops! ', '$e');
      loading.value = false;
      return [];
    }
  }

  Future<List<CarModel>> sortDistrictData({required String place}) async {
    loading.value = true;
    try {
      var districtData = await SortByDistrict.sortDistrict(place: place);

      loading.value = false;
      return districtData!;
    } catch (e) {
      print(e);
      loading.value = false;
      return [];
    }
  }

  filter({required bool isLowtoHigh}) {
    if (isLowtoHigh) {
      totalCars.value.sort((a, b) => a.price.compareTo(b.price));
    } else {
      totalCars.value.sort((a, b) => b.price.compareTo(a.price));

      update();
    }
  }

  @override
  void onInit() {
    getData("/getcarData", "data").then((value) => totalCars.value = value);
    // getAllWishlistData(userIdd!).then((value) => wishlistCars.value = value);

    super.onInit();
  }
}
