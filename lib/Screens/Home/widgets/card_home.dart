import 'package:car_rental/Screens/Car%20Details/car_details.dart';
import 'package:car_rental/core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardHomePage extends StatelessWidget {
  CardHomePage(
      {Key? key,
      required this.image,
      required this.amount,
      required this.brand,
      required this.model,
      required this.available,
      required this.button})
      : super(key: key);
  String image;
  String amount;
  String brand;
  String model;
  String available;
  OutlinedButton button;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        children: [
          SizedBox(
            height: 125,
            child: ClipRRect(child: Image.network(image)),
          ),
          Flexible(
            child: Container(
              width: 188,
              height: 195,
              decoration: BoxDecoration(
                  color: themeColor,
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.only(left: 9, right: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBox10,
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(' $amount/-  ',
                          style: TextStyle(
                              color: kwhite,
                              fontWeight: FontWeight.w500,
                              fontSize: 17)),
                    ),
                    Text('$brand $model',
                        style: TextStyle(
                            color: kwhite,
                            fontWeight: FontWeight.w500,
                            fontSize: 17)),
                    Text('Available in $available',
                        style:
                            TextStyle(color: kwhite, fontSize: 13, height: 2)),
                    sizedBox15,
                    button,
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// //------list of cars------//
// List<CardHomePage> totalCars = [
//   CardHomePage(
//     image: ClipRRect(
//         child: Image.network(
//             'https://firebasestorage.googleapis.com/v0/b/car-rental-booking-a5524.appspot.com/o/carImages%2F3-2-aston-martin-download-png.png?alt=media&token=db5cd9b0-9468-401d-bcd8-5a4570021b9d')),
//     amount: '₹610/day',
//     model: 'McLaren 720s',
//     available: 'Available in :Kannur',
//     button: OutlinedButton(
//       style: OutlinedButton.styleFrom(
//         shape: const StadiumBorder(),
//         side: BorderSide(width: 2, color: kwhite),
//       ),
//       onPressed: () {},
//       child: Text(
//         'BOOK',
//         style: TextStyle(color: kwhite),
//       ),
//     ),
//   ),
//   CardHomePage(
//     image: ClipRRect(
//         child: Image.network(
//             'https://firebasestorage.googleapis.com/v0/b/car-rental-booking-a5524.appspot.com/o/carImages%2Fbmwx4.webp?alt=media&token=522412d6-28b8-4db8-a5e0-c5bec90db650')),
//     amount: '₹26000/day',
//     model: 'Bmw X4',
//     available: 'Available in :Ernakulam',
//     button: OutlinedButton(
//       style: OutlinedButton.styleFrom(
//         shape: const StadiumBorder(),
//         side: BorderSide(width: 2, color: kwhite),
//       ),
//       onPressed: () {},
//       child: Text(
//         'BOOK',
//         style: TextStyle(color: kwhite),
//       ),
//     ),
//   ),
//   CardHomePage(
//     image: ClipRRect(
//         child: Image.network(
//             'https://firebasestorage.googleapis.com/v0/b/car-rental-booking-a5524.appspot.com/o/carImages%2Ff8-tributo-exterior-right-front-three-quarter-11.webp?alt=media&token=0eb70f62-25e4-44ae-8ac4-a1fdab211232')),
//     amount: '₹19000/day',
//     model: 'Ferrari F8 Tributo',
//     available: 'Available in :Kottayam',
//     button: OutlinedButton(
//       style: OutlinedButton.styleFrom(
//         shape: const StadiumBorder(),
//         side: BorderSide(width: 2, color: kwhite),
//       ),
//       onPressed: () {
//         Get.to(const CarDetails());
//       },
//       child: Text(
//         'BOOK',
//         style: TextStyle(color: kwhite),
//       ),
//     ),
//   ),
//   CardHomePage(
//     image: ClipRRect(
//         child: Image.network(
//             'https://firebasestorage.googleapis.com/v0/b/car-rental-booking-a5524.appspot.com/o/carImages%2FRollsRoyce-Wraith-Right-Front-Three-Quarter-62429.webp?alt=media&token=d0daa8f4-dafa-4d1d-a1b3-2c786964fa70')),
//     amount: '₹62000/day',
//     model: 'Rolls-Royce Wraith',
//     available: 'Available in :Idukki',
//     button: OutlinedButton(
//       style: OutlinedButton.styleFrom(
//         shape: const StadiumBorder(),
//         side: BorderSide(width: 2, color: kwhite),
//       ),
//       onPressed: () {},
//       child: Text(
//         'BOOK',
//         style: TextStyle(color: kwhite),
//       ),
//     ),
//   ),
// ];
