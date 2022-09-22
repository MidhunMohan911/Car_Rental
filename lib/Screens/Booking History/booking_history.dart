import 'package:car_rental/Screens/Booking%20History/Widges/cancelled.dart';
import 'package:car_rental/Screens/Booking%20History/Widges/completed.dart';
import 'package:car_rental/Screens/Booking%20History/Widges/upcoming.dart';
import 'package:car_rental/Screens/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class BookingHistory extends StatelessWidget {
  const BookingHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.to(HomeScreen());
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          title: const Text('Booking History'),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(text: 'UPCOMING'),
            Tab(text: 'COMPLETED'),
            Tab(text: 'CANCELLED'),
          ]),
        ),
        body: TabBarView(
            children: [UpcomingPage(), CompletedPage(), CancelledPage()]),
      ),
    );
  }
}
