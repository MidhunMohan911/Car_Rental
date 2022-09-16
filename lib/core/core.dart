import 'package:car_rental/API/Models/local_storage.dart';
import 'package:car_rental/Screens/Booking%20History/booking_history.dart';
import 'package:car_rental/Screens/Home/home.dart';
import 'package:car_rental/Screens/Log%20in/log_in.dart';
import 'package:car_rental/Screens/Profile/profile.dart';
import 'package:car_rental/Screens/Sign%20Up/signup_page.dart';
import 'package:car_rental/Screens/Wishlist/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//--------colors------//
Color kwhite = Colors.white;
Color themeColor = const Color.fromARGB(255, 36, 36, 36);
Color kRed = const Color.fromARGB(255, 242, 19, 3);
Color kGreen = const Color.fromARGB(255, 19, 147, 23);
Color chatClr = const Color.fromARGB(255, 21, 19, 135);

//--------Sizedbox--------//
SizedBox sizedBox10 = const SizedBox(height: 10);
SizedBox sizedBox15 = const SizedBox(height: 15);
SizedBox sizedBox30 = const SizedBox(height: 30);

//-------border black------//
BoxDecoration boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    border: Border.all(color: themeColor));
//--------border white------//
OutlineInputBorder outWhiteBorder = OutlineInputBorder(
  borderSide: BorderSide(color: kwhite),
);

//------border grey------//
OutlineInputBorder outGreyBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.grey),
);

//----------Main Heading-------//
TextStyle mainHeading =
    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

//-------Elevated ButtonStyle------//
ButtonStyle elvButtonStyle = ButtonStyle(
    shape: MaterialStateProperty.all(const StadiumBorder()),
    backgroundColor:
        MaterialStateProperty.all(const Color.fromARGB(255, 36, 36, 36)));

ButtonStyle elvButtonStyleWhite = ButtonStyle(
    shape: MaterialStateProperty.all(const StadiumBorder()),
    backgroundColor: MaterialStateProperty.all(kwhite));

//----------AppBar Methods ---------//

PopupMenuButton<String> appBarPopUp(BuildContext context) {
  return PopupMenuButton<String>(
    icon: const Icon(CupertinoIcons.profile_circled),
    onSelected: (value) {
      if (value == 'Profile') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        ));
      } else if (value == 'Booking History') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const BookingHistory(),
        ));
      } else if (value == 'Logout') {
        GetLocalStorage.deleteUserTokenAnduId();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
          (route) => false,
        );
      }
    },
    itemBuilder: (context) => const [
      PopupMenuItem(value: 'Profile', child: Text('Profile')),
      PopupMenuItem(value: 'Booking History', child: Text('Booking History')),
      PopupMenuItem(value: 'Logout', child: Text('Logout')),
    ],
  );
}

IconButton appBarWishlist() {
  return IconButton(
      onPressed: () {
        Get.to(WishlistPage());
      },
      icon: const Icon(CupertinoIcons.cart_badge_plus));
}

Text appBarTitle() {
  return const Text(
    'LUXDRIVES',
    style: TextStyle(fontSize: 16),
  );
}

Image appBarLogo() {
  return Image.asset(
      'assets/images/depositphotos_81700460-stock-illustration-monogram-l-logo-letter.jpg');
}

completeCancelCard(String car, String tripStart, String tripEnds,
    String totalrent, String lasttitle, Color color) {
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
              'Total Rent :$totalrent',
              style: TextStyle(color: kwhite, fontSize: 19, height: 2.2),
            ),
            sizedBox10,
            const Text(
              'Your Money will be refunded in 7 days',
              style: TextStyle(color: Colors.yellow),
            ),
            sizedBox10,
            Text(
              lasttitle,
              style: TextStyle(
                  color: color, fontSize: 18, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    ),
  );
}
