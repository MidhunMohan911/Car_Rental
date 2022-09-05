import 'package:car_rental/core/core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../API/Controller/bookinghistory_controller.dart';

class CancelledPage extends StatelessWidget {
  CancelledPage({Key? key}) : super(key: key);

  BookingHistoryController bookingHistoryController =
      Get.find<BookingHistoryController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizedBox15,
        const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            'Cancelled Trips',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        sizedBox15,
        Obx(() {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: bookingHistoryController.cancelledTrips.length,
                itemBuilder: (context, index) {
                  var data = bookingHistoryController.cancelledTrips[index];

                  return completeCancelCard(
                      data.carname!,
                      data.startDate!,
                      data.endDate!,
                      data.payedAmount.toString(),
                      'CANCELLED',
                      Colors.red);
                },
              ),
            ),
          );
        }),
      ],
    );
  }
}
