import 'dart:io';
import 'dart:convert';

import 'package:car_rental/API/Controller/controller.dart';
import 'package:car_rental/API/Models/local_storage.dart';
import 'package:car_rental/API/Services/search_service.dart';

import 'package:car_rental/Screens/Car%20Details/car_details.dart';
import 'package:car_rental/Screens/Chat/chat.dart';
import 'package:car_rental/Screens/Chat/chat_bot.dart';
import 'package:car_rental/Screens/Home/widgets/card_home.dart';
import 'package:car_rental/Screens/Home/widgets/home_widget.dart';
import 'package:car_rental/Screens/Location/location.dart';

import 'package:car_rental/core/core.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  int _current = 0;
  Controller controller = Get.put(Controller());

  CarouselController carouselController = CarouselController();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: appBarLogo(),
        title: appBarTitle(),
        actions: [
          appBarWishlist(),
          appBarPopUp(context),
        ],
      ),
      body: GetBuilder<Controller>(
        init: Controller(),
        builder: (controller) => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CarouselSlider(
                carouselController: carouselController,
                items: homeImages
                    .map((item) => Builder(builder: (context) => item))
                    .toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2,
                  onPageChanged: (index, _) {
                    _current = index;
                    controller.update();
                  },
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    homeImages.length,
                    (index) => Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? const Color.fromRGBO(0, 0, 0, 0.9)
                              : const Color.fromRGBO(0, 0, 0, 0.4)),
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AddsHomePage(
                      image: const AssetImage(
                          'assets/images/My project-1 (1).png'),
                      title: 'Internal &\nExternal\nSanitisation'),
                  AddsHomePage(
                      image: const AssetImage('assets/images/My project-1.png'),
                      title: 'Contact-less\ndoorstep\ndelivery'),
                  AddsHomePage(
                      image: const AssetImage(
                          'assets/images/My project-1 (2).png'),
                      title: 'Safety &\nHygiene\nbest practices'),
                ],
              ),
              sizedBox10,
              Container(
                height: 209,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/turkmenistan-black-cars.webp'),
                      fit: BoxFit.fill),
                ),
                child: CarouselSlider(
                    items: carAdds
                        .map(
                          (e) => Builder(builder: (context) => e),
                        )
                        .toList(),
                    options: CarouselOptions()),
              ),
              sizedBox10,
              Text(
                'CHOOSE YOUR CAR',
                style: mainHeading,
              ),
              sizedBox10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 36,
                          width: 100,
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              hintText: 'search',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: themeColor)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: themeColor)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 3),
                        ElevatedButton(
                          style: elvButtonStyle,
                          onPressed: () {
                            // Search.searchCar(brand: searchController.text);

                            controller
                                .getData("/search", "data",
                                    isSearch: true,
                                    brand: searchController.text)
                                .then((value) =>
                                    controller.totalCars.value = value);
                          },
                          child: Text(
                            'Search',
                            style: TextStyle(color: kwhite, fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      child: Text(
                        'FILTER',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: themeColor),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: SizedBox(
                              height: 100,
                              child: Column(
                                children: [
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          primary: themeColor,
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600)),
                                      onPressed: () {
                                        controller
                                            .getData("/lowtohigh", "sort")
                                            .then((value) => controller
                                                .totalCars.value = value);
                                        Get.back();
                                      },
                                      child: const Text('Low to High')),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          primary: themeColor,
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600)),
                                      onPressed: () {
                                        controller
                                            .getData("/hightolow", "sorttwo")
                                            .then((value) => controller
                                                .totalCars.value = value);
                                        Get.back();
                                      },
                                      child: const Text('High to Low')),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    // const SizedBox(width: 10),
                    GetBuilder<Controller>(builder: (controller) {
                      return SizedBox(
                        width: 105,
                        child: DropdownButton<String>(
                          hint: const Text(
                            "SORT BY DISTRICT",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          value: controller.districtSelected,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          isDense: true,
                          isExpanded: true,
                          onChanged: (newValue) {
                            controller.setSelected(
                              newValue!,
                              "SORT BY DISTRICT",
                            );
                            controller.sortDistrictData(place: newValue).then(
                                (value) => controller.totalCars.value = value);
                          },
                          items: controller.districts
                              .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  value,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              sizedBox10,
              Obx(
                () {
                  if (controller.loading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (controller.totalCars.isEmpty) {
                    return const Center(
                      child: Text("Data not found"),
                    );
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.totalCars.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.60,
                    ),
                    itemBuilder: (context, index) {
                      final data = controller.totalCars[index];

                      return CardHomePage(
                        image: data.imgUrl.toString(),
                        amount: data.price.toString(),
                        brand: data.brand.toString(),
                        model: data.model.toString(),
                        available: data.location.toString(),
                        button: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: const StadiumBorder(),
                            side: BorderSide(width: 2, color: kwhite),
                          ),
                          onPressed: () {
                            Get.to(CarDetails(id: data.id));
                          },
                          child: Text(
                            'BOOK',
                            style: TextStyle(color: kwhite),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              sizedBox15,
              Container(
                width: double.infinity,
                height: 180,
                color: themeColor,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Are you looking to rent a car in Kerala? Then, you have come to the right place. Roadster Cars, the premium rental services provides car booking in Kochi and other locations of the state. With attractive prices, our car rental services remove those frustrating transport woes from the minds of NRIs and tourists.',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      'FOLLOW US',
                      style:
                          TextStyle(color: kwhite, fontWeight: FontWeight.w600),
                    ),
                    sizedBox10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {},
                            child: ClipRRect(
                                child: Image.asset(
                              'assets/images/instagram_2 (1).png',
                              color: kwhite,
                              height: 25,
                            ))),
                        GestureDetector(
                            onTap: () {},
                            child: ClipRRect(
                                child: Image.asset(
                              'assets/images/google.png',
                              color: kwhite,
                              height: 25,
                            ))),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 21, 19, 135),
        onPressed: () {
          //Get.to(LocationPage());

          Get.to(MyWidget());
        },
        child: const Icon(Icons.chat_bubble),
      ),
    );
  }
}

//--------sliding images------//
List<dynamic> homeImages = [
  HomeSideImg(
      image: const AssetImage(
          'assets/images/white-tesla-model-s-sedan-68yz-1024x576-MM-90.webp'),
      title: 'Flexible pricing plans',
      subtitle: 'Choose unlimited Kms or with fuel plans'),
  HomeSideImg(
      image: const AssetImage('assets/images/download.jpeg'),
      title: 'Home Delivery & Return',
      subtitle: 'on-time doorstep service at your prefered location & time'),
  HomeSideImg(
      image: const AssetImage(
          'assets/images/photo-1612544448445-b8232cff3b6c.jpeg'),
      title: 'Well maintained cars',
      subtitle: 'Regular service & maintenance,inspect before each trip'),
];

class HomeSideImg extends StatelessWidget {
  HomeSideImg(
      {Key? key,
      required this.image,
      required this.title,
      required this.subtitle})
      : super(key: key);

  AssetImage image;
  String title;
  String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: image, fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          sizedBox10,
          Text(title, style: TextStyle(fontSize: 16.0, color: kwhite)),
          Text(subtitle, style: TextStyle(color: kwhite, fontSize: 10))
        ],
      ),
    );
  }
}
