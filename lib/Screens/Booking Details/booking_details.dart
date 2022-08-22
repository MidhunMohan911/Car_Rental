import 'package:car_rental/Screens/Booking%20Details/Widgets/payment_options.dart';
import 'package:car_rental/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BookingDetailsPage extends StatelessWidget {
  const BookingDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle(),
        actions: [appBarWishlist(), appBarPopUp(context)],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBox15,
            const Text(
              'Booking Details',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            sizedBox15,
            bookingDetailCard('Car', 'McLaren'),
            bookingDetailCard('Customer', 'Midhun Mohan'),
            bookingDetailCard('Trip starts', '10/08/2022'),
            bookingDetailCard('Trip End', '11/08/2022'),
            bookingDetailCard('Pickup Location', ' Kannur '),
            bookingDetailCard('Our HelpLine', '+91 7559017884'),
            sizedBox10,
            const Text(
              'Total Amount : 610/-',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
            ),
            sizedBox10,
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const PaymentOptions(),
                    );
                  },
                  child: const Text(
                    'PAY',
                    style: TextStyle(
                        color: Color.fromARGB(255, 14, 92, 156),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'COUPON',
                      style: TextStyle(color: Colors.green),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  SizedBox bookingDetailCard(String title, String subtitle) {
    return SizedBox(
      height: 80,
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
            const Text(' : '),
            Expanded(
              child: Text(
                subtitle,
                style: const TextStyle(fontSize: 17),
              ),
            )
          ],
        ),
      )),
    );
  }
}