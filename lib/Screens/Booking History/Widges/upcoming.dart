import 'package:car_rental/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UpcomingPage extends StatelessWidget {
  const UpcomingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          upComingCard('BMW', '29/07/2022', '29/07/2022', '89,600/-'),
          sizedBox10,
          upComingCard('NISSAN', '09/07/2022', '19/07/2022', '86,600/-'),
        ],
      ),
    );
  }

  Padding upComingCard(
      String car, String tripStart, String tripEnds, String totalRent) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Card(
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
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: BorderSide(width: 2, color: kwhite),
                  ),
                  onPressed: () {},
                  child: Text(
                    'CANCEL BOOKING',
                    style: TextStyle(color: kwhite),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
