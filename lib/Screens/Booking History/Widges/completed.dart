import 'package:car_rental/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizedBox15,
        const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            'Completed Trips',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        sizedBox15,
        completeCancelCard(
            'Mini Cooper', '10/02/2022', '12/02/2022', '78,500','COMPLETED', Colors.green)
      ],
    );
  }
}
