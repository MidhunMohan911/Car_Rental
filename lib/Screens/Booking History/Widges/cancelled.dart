import 'package:car_rental/core/core.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class CancelledPage extends StatelessWidget {
  const CancelledPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizedBox15,
        const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            'Cancelled Trips',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        sizedBox15,
        completeCancelCard(
            'Benz', '10/02/2022', '12/02/2022', '78,500', 'CANCELLED', kRed)
      ],
    );
  }
}
