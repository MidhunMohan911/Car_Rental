import 'package:car_rental/core/core.dart';
import 'package:flutter/material.dart';

class AddsHomePage extends StatelessWidget {
  AddsHomePage({Key? key, required this.image, required this.title})
      : super(key: key);
  AssetImage image;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: themeColor,
            image: DecorationImage(image: image, fit: BoxFit.cover)),
        child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Text(
                title,
                style: TextStyle(
                    color: kwhite,
                    fontSize: 10,
                    height: 1.5,
                    fontWeight: FontWeight.w600),
              ),
            )));
  }
}


List<dynamic> carAdds = [
  Padding(
    padding: const EdgeInsets.only(right: 80),
    child: SizedBox(
      child: Column(
        children: [
          Text(
            'BMW',
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w600, color: kwhite),
          ),
          Text(
            'PartnerShip with BMW',
            style: TextStyle(fontSize: 14, color: kwhite),
          ),
          Text(
            'With the components and products from BMW M Performance Parts, the motorsport DNA from BMW is clearly felt, even off the racetrack. Developed with motorsport expertise, perfectly tailored to the respective model, and combinable to meet individual requirements – that is the range from BMW M Performance Parts. The retrofit components for the drive train, chassis, aerodynamics and cockpit significantly improve driving dynamics and underline the sporty tone of both the exterior appearance and the interior ambience of the car in question',
            style: TextStyle(color: kwhite, fontSize: 10),
          ),
        ],
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.only(right: 80, left: 20),
    child: SizedBox(
      child: Column(
        children: [
          Text(
            'Mercedes Benz',
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w600, color: kwhite),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Partnership With Mercedes Benz',
              style: TextStyle(fontSize: 14, color: kwhite,height: 1.2),
            ),
          ),
          Text(
              'Mercedes gave up the partnership with Us in favor of Geely, the main objective being cooperation for a new generation of 4-cylinder engines to be used in the future by Mercedes, and also we have the whole collection of Mercedes Benz.We’re excited to use our collective resources to develop and demonstrate how technology can improve the livability, vitality and sustainability of Long Beach.',
              style: TextStyle(color: kwhite, fontSize: 10)),
        ],
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.only(right: 80, left: 20),
    child: SizedBox(
      child: Column(
        children: [
          Text(
            'Porsche',
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w600, color: kwhite),
          ),
          Text(
            'Partnership With Porsche',
            style: TextStyle(fontSize: 14, color: kwhite),
          ),
          Text(
              'Porsche and the Our Company have joined forces in a strategic brand partnership. Within the framework of the holistic and long-term alliance, the premium manufacturers intend to jointly approach both sports competitions and the development of products.',
              style: TextStyle(color: kwhite, fontSize: 10))
        ],
      ),
    ),
  )
];
