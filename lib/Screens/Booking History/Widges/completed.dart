import 'package:car_rental/API/Controller/bookinghistory_controller.dart';
import 'package:car_rental/core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedPage extends StatelessWidget {
  CompletedPage({Key? key}) : super(key: key);

  BookingHistoryController bookingHistoryController =
      Get.find<BookingHistoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBox15,
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Completed Trips',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          sizedBox15,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: bookingHistoryController.completedTrips.length,
                itemBuilder: (context, index) {
                  var data = bookingHistoryController.completedTrips[index];

                  return completeCancelCard(
                      data.carname!,
                      data.startDate!,
                      data.endDate!,
                      data.payedAmount.toString(),
                      'COMPLETED',
                      Colors.green);
                },
              ),
            ),
          ),
        ],
      );
    });
  }
}
