
import 'package:car_rental/API/Models/wishlist_model.dart';
import 'package:car_rental/API/Services/wishlist.dart';
import 'package:car_rental/core/core.dart';
import 'package:flutter/material.dart';


import '../../API/Models/local_storage.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? userId = GetLocalStorage.getUserIdAndToken("uId");

    return Scaffold(
      appBar: AppBar(
        title: appBarTitle(),
        actions: [appBarPopUp(context)],
      ),
      body: FutureBuilder<List<WishlistModel>?>(
          future: WishlistServices.getDataFromWishlist(
            userId: userId!,
          ),
          builder: (context, AsyncSnapshot<List<WishlistModel>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            List<WishlistModel>? wishlistData = snapshot.data;

            if (wishlistData == null) {
              return const Center(
                child: Text("Something went wrong"),
              );
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3 / 3.4,
              ),
              itemCount: wishlistData.length,
              itemBuilder: (context, index) {
                var data = wishlistData[index];

                return WishlistCard(
                  image: data.imgUrl,
                  text: data.brand + data.model,
                );
              },
            );
          }),
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
