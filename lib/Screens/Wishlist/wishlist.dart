import 'package:car_rental/API/Controller/wishlist_controller.dart';
import 'package:car_rental/core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      WishlistController controller = Get.put(WishlistController());

    return Scaffold(
      appBar: AppBar(
        title: appBarTitle(),
        actions: [appBarPopUp(context)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBox15,
            const Text(
              'Wishlist',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            sizedBox15,
            Wrap(
              children: [
                WishlistCard(
                    image:
                        'https://firebasestorage.googleapis.com/v0/b/car-rental-booking-a5524.appspot.com/o/carImages%2Famg-gt-exterior-right-front-three-quarter-60800.webp?alt=media&token=00eb7e8b-b005-4dcc-90de-a8f7466dc238',
                    text:
                     'Mercedes-Benz AMG GT'),
                WishlistCard(
                    image:
                        'https://firebasestorage.googleapis.com/v0/b/car-rental-booking-a5524.appspot.com/o/carImages%2Fmini.webp?alt=media&token=3047bebc-d2c3-417d-bcae-07cffa81d878',
                    text: 'MINI Cooper Convertible'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class WishlistCard extends StatelessWidget {
  WishlistCard({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);
  String image;
  String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: SizedBox(
        height: 200,
        width: 170,
        child: Column(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(image))),
            ),
            Column(
              children: [
                sizedBox10,
                Text(
                  text,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 3,
                        ),
                        shape: const StadiumBorder(),
                        side: BorderSide(width: 2, color: themeColor),
                      ),
                      onPressed: () {},
                      child: Text(
                        'VIEW CAR',
                        style: TextStyle(color: themeColor, fontSize: 11),
                      ),
                    ),
                    ElevatedButton(
                      style: elvButtonStyle,
                      onPressed: () {},
                      child: const Text(
                        'REMOVE',
                        style: TextStyle(fontSize: 11),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
