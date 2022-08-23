import 'dart:convert';

import 'package:car_rental/API/Controller/wishlist_controller.dart';
import 'package:car_rental/API/Models/car_model.dart';
import 'package:car_rental/API/Models/wishlist_model.dart';
import 'package:car_rental/API/Services/car_services.dart';
import 'package:car_rental/API/Services/wishlist_services.dart';
import 'package:car_rental/Screens/Car%20Details/car_details.dart';
import 'package:car_rental/core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../API/Controller/controller.dart';
import '../../API/Models/local_storage.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? userId = GetLocalStorage.getUserIdAndToken("uId");
    WishlistController controller = Get.put(WishlistController());

    return Scaffold(
      appBar: AppBar(
        title: appBarTitle(),
        actions: [appBarPopUp(context)],
      ),
      body: FutureBuilder<List<WishlistModel>?>(
          future: WishlistServices.getDataFromWishlist(
            userId: userId!,
          ),
          builder: (context, AsyncSnapshot<List<WishlistModel>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            List<WishlistModel>? wishlistData = snapshot.data;

            if (wishlistData == null) {
              return const Center(
                child: Text("Something went wrong"),
              );
            }

            return GetBuilder<WishlistController>(
                init: WishlistController(),
                builder: (controller) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 3 / 3.5,
                    ),
                    itemCount: wishlistData.length,
                    itemBuilder: (context, index) {
                      var data = wishlistData[index];
                      //  final carData = controller.totalCars[index];

                      return WishlistCard(
                        image: data.imgUrl!,
                        text: data.brand! + data.model!,
                        elevatedButton: ElevatedButton(
                          style: elvButtonStyle,
                          onPressed: () {
                            String? userId =
                                GetLocalStorage.getUserIdAndToken("uId");
                            // WishlistServices.removeWishlist(
                            //     carId: data.id!, userId: userId!);
                            controller.removeWishlistData(data.id!, userId!);
                            Get.snackbar('Message', 'Deleted Successfully',
                                snackPosition: SnackPosition.BOTTOM);
                          },
                          child: const Text(
                            'REMOVE',
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                        outlinedButton: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 3,
                            ),
                            shape: const StadiumBorder(),
                            side: BorderSide(width: 2, color: themeColor),
                          ),
                          onPressed: () {
                            Future<String> bbb =
                                CarServices.getSingleCar(carId: data.id!);
                            print('hhjhjjh');
                            String carDetails = '';
                            bbb.then((value) => carDetails = value);
                            var carDetail = jsonDecode(carDetails);
                            print('jhjjhjhjhh' + carDetail);
                            var car = CarModel.fromJson(carDetail);
                            print(car);
                          },
                          child: Text(
                            'VIEW CAR',
                            style: TextStyle(color: themeColor, fontSize: 11),
                          ),
                        ),
                      );
                    },
                  );
                });
          }),
    );
  }
}

class WishlistCard extends StatelessWidget {
  WishlistCard(
      {Key? key,
      required this.image,
      required this.text,
      required this.elevatedButton,
      required this.outlinedButton})
      : super(key: key);
  String image;
  String text;
  ElevatedButton elevatedButton;
  OutlinedButton outlinedButton;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: SizedBox(
        height: 200,
        width: 170,
        child: Column(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(image))),
            ),
            Column(
              children: [
                sizedBox10,
                Text(
                  text,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [outlinedButton, elevatedButton],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
