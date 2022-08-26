import 'package:car_rental/API/Controller/book_controller.dart';
import 'package:car_rental/API/Controller/controller.dart';
import 'package:car_rental/API/Models/car_model.dart';
import 'package:car_rental/API/Models/local_storage.dart';
import 'package:car_rental/API/Models/wishlist_model.dart';
import 'package:car_rental/API/Services/book_car_services.dart';
import 'package:car_rental/API/Services/wishlist_services.dart';
import 'package:car_rental/Screens/Location/location.dart';
import 'package:car_rental/core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarDetails extends StatefulWidget {
  CarModel id;
  CarDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  // Controller controller = Get.find<Controller>();
  BookingController bookingController = BookingController();

  DateTimeRange dateRange =
      DateTimeRange(start: DateTime(2022, 11, 07), end: DateTime(2022, 12, 24));

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final difference = dateRange.duration;

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
                          image: NetworkImage(widget.id.imgUrl.toString()),
                          fit: BoxFit.contain)),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, left: 10),
                      child: Text(
                        '${widget.id.brand}${widget.id.model} ',
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
                                      '${start.year}/${start.month}/${start.day}',
                                      textAlign: TextAlign.center,
                                    ),
                                    const Icon(
                                      CupertinoIcons.calendar,
                                      size: 18,
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
                                        '${end.year}/${end.month}/${end.day}',
                                      ),
                                      const Icon(
                                        CupertinoIcons.calendar,
                                        size: 18,
                                      )
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text('Total days : ${difference.inDays} days',
                      style:
                          TextStyle(color: kwhite, fontSize: 11, height: 1.8)),
                  Text(
                      'Total Amount : ${difference.inDays * widget.id.price} /-',
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
                          BookCarServices.bookCarService(
                              start.toString(), end.toString(), widget.id.id);

                          // Get.to(const BookingDetailsPage());
                        },
                        child: const Text('BOOK NOW',
                            style: TextStyle(color: Colors.blue, fontSize: 11)),
                      ),
                      const SizedBox(width: 10),
                      GetBuilder<Controller>(
                          init: Controller(),
                          builder: (controller) {
                            List<WishlistModel> wishList = [];
                            String? userId =
                                GetLocalStorage.getUserIdAndToken("uId");
                            var wishlistModel =
                                WishlistServices.getDataFromWishlist(
                                    userId: userId!);
                            wishlistModel.then((value) => wishList = value!);
                            bool isNotAdded = wishList
                                .where((element) =>
                                    element.id.toString() == widget.id.id)
                                .isEmpty;
                            print(isNotAdded);

                            return isNotAdded
                                ? TextButton(
                                    child: const Text('ADD TO WISHLIST',
                                        style: TextStyle(color: Colors.blue)),
                                    onPressed: () {
                                      String? userId =
                                          GetLocalStorage.getUserIdAndToken(
                                              "uId");
                                      WishlistServices.addWishlist(
                                          userId: userId!, carId: widget.id.id);
                                      Get.snackbar('Successfully Added',
                                          '${widget.id.brand + widget.id.model} added to wishlist',
                                          colorText: kwhite,
                                          backgroundColor: Colors.black);
                                    },
                                  )
                                : TextButton(
                                    onPressed: () {},
                                    child: const Text('REMOVE FROM WISHLIST'));
                          })
                    ],
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      carDetailCard('Rent/day', '${widget.id.price}'),
                      carDetailCard('Number of Seats', '${widget.id.seats}'),
                      carDetailCard('Milege', widget.id.mileage),
                      carDetailCard('Fuel Type', widget.id.fueltype.name),
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
                            Text(widget.id.location.toString()),
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
                      carDetailCard(
                          'Vehicle Number', widget.id.regNo.toString()),
                      carDetailCard(
                          'Registered Date', widget.id.register.toString()),
                      carDetailCard(
                          'Description', widget.id.description.toString()),
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

  // Future pickDateRange() async {
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
