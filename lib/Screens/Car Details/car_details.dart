import 'dart:developer';

import 'package:car_rental/API/Controller/controller.dart';
import 'package:car_rental/API/Models/car_model.dart';
import 'package:car_rental/API/Services/services.dart';
import 'package:car_rental/Screens/Booking%20Details/booking_details.dart';
import 'package:car_rental/Screens/Location/location.dart';
import 'package:car_rental/core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarDetails extends StatelessWidget {
  CarModel id;
  CarDetails({Key? key, required this.id}) : super(key: key);

  Controller controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle(),
        actions: [
          appBarWishlist(),
          appBarPopUp(context),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 260,
                  decoration: BoxDecoration(
                      color: kwhite,
                      image: DecorationImage(
                          image: NetworkImage(id.imgUrl.toString()),
                          fit: BoxFit.contain)),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, left: 10),
                      child: Text(
                        '${id.brand}${id.model} ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      color: kwhite,
                      height: 50,
                    ),
                    Container(
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: themeColor,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Text(
                        'Choose your Booking Date',
                        style: TextStyle(
                            color: kwhite,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            height: 1.8),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              // height: MediaQuery.of(context).size.height,
              color: themeColor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Flexible(
                        child: SizedBox(
                          height: 35,
                          width: 100,
                          child: Card(
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration:
                                  InputDecoration(hintText: 'trip starts'),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'to',
                        style: TextStyle(color: kwhite),
                      ),
                      const Flexible(
                        child: SizedBox(
                          height: 35,
                          width: 100,
                          child: Card(
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration:
                                  InputDecoration(hintText: 'trip starts'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text('Total days :0 days',
                      style:
                          TextStyle(color: kwhite, fontSize: 11, height: 1.8)),
                  Text('Total Amount :0 /-',
                      style: TextStyle(color: kwhite, height: 1.8)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          shape: const StadiumBorder(),
                          side: const BorderSide(width: 1, color: Colors.blue),
                        ),
                        onPressed: () {
                          Get.to(const BookingDetailsPage());
                        },
                        child: const Text('BOOK NOW',
                            style: TextStyle(color: Colors.blue, fontSize: 11)),
                      ),
                      const SizedBox(width: 10),
                      const Text('ADD TO WISHLIST',
                          style: TextStyle(color: Colors.blue))
                    ],
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      carDetailCard('Rent/day', '${id.price}'),
                      carDetailCard('Number of Seats', '${id.seats}'),
                      carDetailCard('Milege', id.mileage),
                      carDetailCard('Fuel Type', id.fueltype.name),
                      Card(
                          child: Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Column(
                          children: [
                            const Text(
                              'Pickup Location',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(id.location.toString()),
                            SizedBox(
                              height: 35,
                              child: IconButton(
                                  alignment: Alignment.topCenter,
                                  onPressed: () => Get.to(const LocationPage()),
                                  icon: const Icon(Icons.location_on)),
                            ),
                          ],
                        ),
                      )),
                      carDetailCard('Vehicle Number', id.regNo.toString()),
                      carDetailCard('Registered Date', id.register.toString()),
                      carDetailCard('Description', id.description.toString()),
                    ],
                  ),
                  sizedBox30,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Card carDetailCard(String title, String subtitle) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(subtitle)
        ],
      ),
    ));
  }
}
