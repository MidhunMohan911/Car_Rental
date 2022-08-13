import 'package:car_rental/Screens/Booking%20Details/Widgets/debitcard_payment.dart';
import 'package:car_rental/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Payment Options',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      content: SizedBox(
        height: 180,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    ' Razorpay',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            sizedBox10,
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.yellow)),
                  onPressed: () {},
                  child: Image.asset(
                    'assets/images/580b57fcd9996e24bc43c530.png',
                    width: 150,
                    height: 30,
                  )),
            ),
            sizedBox10,
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(themeColor)),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => DebitCardPayment(),
                    );
                  },
                  child: const Text('💳 Debit or Credit Card')),
            ),
          ],
        ),
      ),
    );
  }
}
