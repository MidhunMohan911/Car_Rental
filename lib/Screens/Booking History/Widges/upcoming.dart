import 'package:car_rental/API/Controller/bookinghistory_controller.dart';
import 'package:car_rental/core/core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class UpcomingPage extends StatelessWidget {
  UpcomingPage({Key? key}) : super(key: key);

  BookingHistoryController bookingHistoryController =
      Get.put(BookingHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        print(bookingHistoryController.completedData());
      }),
      body: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBox15,
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Upcoming Trips',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            sizedBox15,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: bookingHistoryController.upcomingTrips.length,
                  itemBuilder: (context, index) {
                    var data = bookingHistoryController.upcomingTrips[index];

                    return upComingCard(
                      data.carname!,
                      data.startDate!,
                      data.endDate!,
                      data.payedAmount.toString(),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: const StadiumBorder(),
                          side: BorderSide(width: 2, color: kwhite),
                        ),
                        onPressed: () {
                          bookingHistoryController.cancelTripData(data.carId!);
                        },
                        child: Text(
                          'CANCEL BOOKING',
                          style: TextStyle(color: kwhite),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  upComingCard(String car, String tripStart, String tripEnds, String totalRent,
      OutlinedButton cancelBooking) {
    return Card(
      color: themeColor,
      elevation: 5,
      child: SizedBox(
        height: 200,
        width: 280,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Car :$car',
                style: TextStyle(color: kwhite, fontSize: 17),
              ),
              Text(
                'Trip Starts :$tripStart',
                style: TextStyle(color: kwhite, fontSize: 15, height: 1.8),
              ),
              Text(
                'Trip Ends :$tripEnds',
                style: TextStyle(color: kwhite, fontSize: 15, height: 1.5),
              ),
              Text(
                'Total Rent :$totalRent',
                style: TextStyle(color: kwhite, fontSize: 19, height: 2.2),
              ),
              sizedBox15,
              cancelBooking,
              // OutlinedButton(
              //   style: OutlinedButton.styleFrom(
              //     shape: const StadiumBorder(),
              //     side: BorderSide(width: 2, color: kwhite),
              //   ),
              //   onPressed: () {

              //   },
              //   child: Text(
              //     'CANCEL BOOKING',
              //     style: TextStyle(color: kwhite),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
