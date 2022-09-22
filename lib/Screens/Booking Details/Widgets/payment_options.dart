import 'dart:convert';
import 'dart:io';

import 'package:car_rental/API/Services/payment_service.dart';
import 'package:car_rental/Screens/Booking%20Details/Widgets/debitcard_payment.dart';
import 'package:car_rental/core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import '../../../API/Controller/controller.dart';
import '../../../API/Controller/profile_controller.dart';
import '../../../API/Models/booking_details_model.dart';
import '../../../API/Models/local_storage.dart';
import 'razor_credentials.dart' as razorCredentials;

class PaymentOptions extends StatefulWidget {
  PaymentOptions({Key? key, required this.bookingDetailsModel})
      : super(key: key);
  BookingDetailsModel bookingDetailsModel;

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Payment Options',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      content: SizedBox(
        height: 100,
        child: Column(
          children: [
            sizedBox15,
            SizedBox(
                height: 50,
                width: double.infinity,
                child:
                    RazorPay(bookingDetailsModel: widget.bookingDetailsModel)),
            sizedBox15,
            // SizedBox(
            //   height: 50,
            //   width: double.infinity,
            //   child: ElevatedButton(
            //       style: ButtonStyle(
            //           backgroundColor:
            //               MaterialStateProperty.all(Colors.yellow)),
            //       onPressed: () {},
            //       child: Image.asset(
            //         'assets/images/580b57fcd9996e24bc43c530.png',
            //         width: 150,
            //         height: 30,
            //       )),
            // ),
            // sizedBox10,
            // SizedBox(
            //   height: 50,
            //   width: double.infinity,
            //   child: ElevatedButton(
            //       style: ButtonStyle(
            //           backgroundColor: MaterialStateProperty.all(themeColor)),
            //       onPressed: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => DebitCardPayment(),
            //         );
            //       },
            //       child: const Text('💳 Debit or Credit Card')),
            // ),
          ],
        ),
      ),
    );
  }
}

class RazorPay extends StatefulWidget {
  RazorPay({Key? key, required this.bookingDetailsModel}) : super(key: key);
  BookingDetailsModel bookingDetailsModel;

  @override
  State<RazorPay> createState() => _RazorPayState();
}

/////////////======///////
UserProfileController userProfileController = Get.put(UserProfileController());
Controller controller = Controller();

class _RazorPayState extends State<RazorPay> {
  // ProfileModel? profileModel;
  final _razorpay = Razorpay();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print(response);
    print('carname' +
        widget.bookingDetailsModel.carName +
        'amount' +
        widget.bookingDetailsModel.amount +
        'tripends' +
        widget.bookingDetailsModel.tripEnds +
        'tripstarts' +
        widget.bookingDetailsModel.tripStarts +
        'carid' +
        widget.bookingDetailsModel.id!);

    print("PAYMENT SUCCESS");

    BookingDetailsModel bookingDetails = BookingDetailsModel(
        id: widget.bookingDetailsModel.id,
        carName: widget.bookingDetailsModel.carName,
        tripEnds: widget.bookingDetailsModel.tripEnds,
        tripStarts: widget.bookingDetailsModel.tripStarts,
        amount: widget.bookingDetailsModel.amount);

    PaymentService.razorpaySuccess(
      bookingDetails,
    );
    print(bookingDetails.carName +
        bookingDetails.amount +
        bookingDetails.tripEnds +
        bookingDetails.tripStarts +
        bookingDetails.id!);

    Get.snackbar('Message', 'Payment success',
        colorText: kwhite,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print(response);
    // Do something when payment fails
    Get.snackbar('Warning', 'Payment failed',
        colorText: kwhite,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print(response);

    // Do something when an external wallet is selected
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response.walletName ?? ''),
      ),
    );
  }

// create order
  void createOrder() async {
    String username = razorCredentials.keyId;
    String password = razorCredentials.keySecret;
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    controller.loginLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));

    Map<String, dynamic> body = {
      "amount": (int.parse(widget.bookingDetailsModel.amount) * 100).toString(),
      "currency": "INR",
      "receipt": "rcptid_11"
    };
    var res = await http.post(
      Uri.https(
          "api.razorpay.com", "v1/orders"), //https://api.razorpay.com/v1/orders
      headers: <String, String>{
        "Content-Type": "application/json",
        'authorization': basicAuth,
      },
      body: jsonEncode(body),
    );

    if (res.statusCode == 200) {
      openGateway(jsonDecode(res.body)['id']);
    }
    print(res.body);
    controller.loginLoading.value = false;
  }

  openGateway(String orderId) {
    String? userEmail = GetLocalStorage.getUserIdAndToken('email');

    var options = {
      'key': razorCredentials.keyId,
      'amount': (int.parse(widget.bookingDetailsModel.amount) * 100)
          .toString(), //in the smallest currency sub-unit.
      'name': widget.bookingDetailsModel.customer,
      'order_id': orderId, // Generate order_id using Orders API
      'description': widget.bookingDetailsModel.carName + 'has been booked',
      'timeout': 60 * 5, // in seconds // 5 minutes
      'prefill': {
        'contact': '7025793652',
        'email': userEmail,
      }
    };
    _razorpay.open(options);
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return OutlinedButton(
          onPressed: controller.loginLoading.value
              ? null
              : () {
                  createOrder();
                },
          child: controller.loginLoading.value
              ? const CircularProgressIndicator()
              : const Text(
                  ' Razorpay',
                  style: TextStyle(fontSize: 20),
                ));
    });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
