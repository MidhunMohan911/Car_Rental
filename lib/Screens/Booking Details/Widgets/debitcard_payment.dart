import 'package:car_rental/Screens/Sign%20Up/Widgets/textform.dart';
import 'package:car_rental/core/core.dart';
import 'package:flutter/material.dart';


class DebitCardPayment extends StatelessWidget {
  const DebitCardPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: AlertDialog(
        title: const Text(
          'Payment Options',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormPage(title: 'Name'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * .32,
                  child: TextFormPage(title: 'Expires'),
                ),
                SizedBox(
                  width: width * .32,
                  child: TextFormPage(title: 'Security'),
                )
              ],
            ),
            const Text(
              'Billing address',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * .32,
                  child: TextFormPage(title: 'First Name'),
                ),
                SizedBox(
                  width: width * .32,
                  child: TextFormPage(title: 'Last Name'),
                )
              ],
            ),
            TextFormPage(title: 'Address line1'),
            TextFormPage(title: 'Address line2'),
            TextFormPage(title: 'Town/City'),
            TextFormPage(title: 'Country'),
            TextFormPage(title: 'Mobile'),
            TextFormPage(title: 'Email'),
            Center(
              child: ElevatedButton(
                style: elvButtonStyle,
                onPressed: () {},
                child: const Text('Buy Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //-------Card Name------//
  Widget buildCardName() => SizedBox(
        height: 55,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: TextFormField(
            maxLines: 1,
            style: const TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              focusedBorder: outGreyBorder,
              enabledBorder: outGreyBorder,
              hintText: 'Card Number',
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ),
      );

  //--------Expires--------//
  Widget buildExpires() => SizedBox(
        height: 55,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: TextFormField(
            maxLines: 1,
            style: const TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              focusedBorder: outGreyBorder,
              enabledBorder: outGreyBorder,
              hintText: 'Expires',
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ),
      );

  //---------Security code--------//
  Widget buildSecurity() => SizedBox(
        height: 55,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: TextFormField(
            maxLines: 1,
            style: const TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              focusedBorder: outGreyBorder,
              enabledBorder: outGreyBorder,
              hintText: 'Security',
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ),
      );

  //---------Firstname--------//
  Widget buildFirstName() => SizedBox(
        height: 55,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: TextFormField(
            maxLines: 1,
            style: const TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              focusedBorder: outGreyBorder,
              enabledBorder: outGreyBorder,
              hintText: 'FirstName',
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ),
      );

  //---------Lastname---------//
  Widget buildLastName() => SizedBox(
        height: 55,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: TextFormField(
            maxLines: 1,
            style: const TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              focusedBorder: outGreyBorder,
              enabledBorder: outGreyBorder,
              hintText: 'LastName',
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ),
      );

  //---------Address line 1--------//
  Widget buildAddress1() => SizedBox(
        height: 55,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: TextFormField(
            maxLines: 1,
            style: const TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              focusedBorder: outGreyBorder,
              enabledBorder: outGreyBorder,
              hintText: 'Address line 1',
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ),
      );

  //---------Address line 2---------//
  Widget buildAddress2() => SizedBox(
        height: 55,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: TextFormField(
            maxLines: 1,
            style: const TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              focusedBorder: outGreyBorder,
              enabledBorder: outGreyBorder,
              hintText: 'Address line 2',
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ),
      );

  //---------Town/City---------//
  Widget buildTownCity() => SizedBox(
        height: 55,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: TextFormField(
            maxLines: 1,
            style: const TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              focusedBorder: outGreyBorder,
              enabledBorder: outGreyBorder,
              hintText: 'Town/City',
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ),
      );

  //---------Country---------//
  Widget buildCountry() => SizedBox(
        height: 55,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: TextFormField(
            maxLines: 1,
            style: const TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              focusedBorder: outGreyBorder,
              enabledBorder: outGreyBorder,
              hintText: 'Country',
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ),
      );

 }
 