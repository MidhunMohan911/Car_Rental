// ignore_for_file: avoid_print

import 'package:car_rental/API/Controller/car_details_controller.dart';
import 'package:car_rental/API/Controller/controller.dart';
import 'package:car_rental/API/Models/booking_details_model.dart';
import 'package:car_rental/API/Models/car_model.dart';
import 'package:car_rental/API/Models/local_storage.dart';
import 'package:car_rental/API/Services/book_car_services.dart';

import 'package:car_rental/Screens/Location/location.dart';
import 'package:car_rental/core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../API/Controller/wishlist_controller.dart';
import '../Booking Details/booking_details.dart';

class CarDetails extends StatefulWidget {
  String id;
  CarDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  Controller controller = Get.find<Controller>();
  WishlistController wishlistController = Get.put(WishlistController());

  DateTimeRange? dateRange;

  @override
  Widget build(BuildContext context) {
    CarDetailsController carDetailsController = Get.put(CarDetailsController(
      carId: widget.id,
    ));

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
        child: Obx(() {
          if (carDetailsController.carModel.value == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          CarModel carModel = carDetailsController.carModel.value!;

          String start = dateRange == null
              ? "Trip starts"
              : "${dateRange!.start.day}/${dateRange!.start.month}/${dateRange!.start.year}";
          final end = dateRange == null
              ? "Trip ends"
              : "${dateRange!.end.day}/${dateRange!.end.month}/${dateRange!.end.year}";
          String difference = dateRange == null
              ? "0 days"
              : "'Total days : ${dateRange!.duration.inDays} days'";

          String amount = dateRange == null
              ? "0 "
              : '${dateRange!.duration.inDays * carModel.price}';

          return Column(
            children: [
              Column(
                children: [
                  Container(
                    height: 260,
                    decoration: BoxDecoration(
                        color: kwhite,
                        image: DecorationImage(
                            image: NetworkImage(carModel.imgUrl),
                            fit: BoxFit.contain)),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, left: 10),
                        child: Text(
                          '${carModel.brand}${carModel.model}',
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
                color: themeColor,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Trip starts',
                                style: TextStyle(color: kwhite),
                              ),
                              SizedBox(
                                height: 35,
                                width: 130,
                                child: ElevatedButton(
                                  style: elvButtonStyleWhite,
                                  onPressed: () async {
                                    DateTimeRange? newDateRange =
                                        await showDateRangePicker(
                                      context: context,
                                      initialDateRange: dateRange,
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2100),
                                    );

                                    if (newDateRange == null) return;
                                    setState(() {
                                      dateRange = newDateRange;
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        start,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      const Icon(
                                        CupertinoIcons.calendar,
                                        size: 18,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '\nto',
                          style: TextStyle(color: kwhite, fontSize: 16),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Trip ends',
                                style: TextStyle(color: kwhite),
                              ),
                              SizedBox(
                                  height: 35,
                                  width: 130,
                                  child: ElevatedButton(
                                    style: elvButtonStyleWhite,
                                    onPressed: () async {
                                      DateTimeRange? newDateRange =
                                          await showDateRangePicker(
                                              context: context,
                                              initialDateRange: dateRange,
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2100));

                                      if (newDateRange == null) return;
                                      setState(() {
                                        dateRange = newDateRange;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          end,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        const Icon(
                                          CupertinoIcons.calendar,
                                          size: 18,
                                          color: Colors.black,
                                        )
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(difference,
                        style: TextStyle(
                            color: kwhite, fontSize: 11, height: 1.8)),
                    dateRange == null
                        ? Text('')
                        : Text('Total Amount : $amount/-',
                            style: TextStyle(color: kwhite, height: 1.8)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            shape: const StadiumBorder(),
                            side:
                                const BorderSide(width: 1, color: Colors.blue),
                          ),
                          onPressed: () {
                            if (dateRange == null) {
                              Get.snackbar('Warning', 'Please select date',
                                  colorText: kwhite,
                                  backgroundColor: Colors.black);
                              return;
                            }

                            BookCarServices.bookCarService(
                                start, end, carModel.id);

                            BookingDetailsModel bookingDetailsModel =
                                BookingDetailsModel(
                              carName: carModel.brand + carModel.model,
                              id: carModel.id,
                              tripEnds: end,
                              location: carModel.location,
                              tripStarts: start,
                              amount: amount,
                            );

                            Get.to(BookingDetailsPage(
                              bookingDetailsModel: bookingDetailsModel,
                            ));
                          },
                          child: const Text('BOOK NOW',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 11)),
                        ),
                        const SizedBox(width: 10),
                        Obx(() {
                          List wishlistIds =
                              carDetailsController.wishlistIds!.value;

                          bool isAdded = wishlistIds
                              .any((element) => element == widget.id);

                          return TextButton(
                              onPressed: () {
                                String? userId =
                                    GetLocalStorage.getUserIdAndToken("uId");
                                if (!isAdded) {
                                  wishlistController.addWishlistData(
                                      userId!, carModel.id);
                                } else {
                                  wishlistController.removeWishlistData(
                                    carModel.id,
                                    userId!,
                                  );
                                }
                              },
                              child: Text(isAdded
                                  ? "Remove from wishlist"
                                  : "Add to wishlist"));
                        })
                      ],
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        carDetailCard('Rent/day', '${carModel.price}'),
                        carDetailCard('Number of Seats', '${carModel.seats}'),
                        carDetailCard('Milege', carModel.mileage),
                        carDetailCard('Fuel Type', carModel.fueltype.name),
                        Card(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: Column(
                            children: [
                              const Text(
                                'Pickup Location',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(carModel.location),
                              SizedBox(
                                height: 35,
                                child: IconButton(
                                    alignment: Alignment.topCenter,
                                    onPressed: () =>
                                        Get.to(const LocationPage()),
                                    icon: const Icon(Icons.location_on)),
                              ),
                            ],
                          ),
                        )),
                        carDetailCard(
                            'Vehicle Number', carModel.regNo.toString()),
                        carDetailCard(
                            'Registered Date', carModel.register.toString()),
                        carDetailCard(
                            'Description', carModel.description.toString()),
                      ],
                    ),
                    sizedBox30,
                  ],
                ),
              )
            ],
          );
        }),
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
