import 'package:car_rental/core/core.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22)),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                        ),
                        color: themeColor,
                      ),
                    ),
                    const Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/profile-photo_GREYDARK-scaled.jpg'),
                        radius: 70,
                      ),
                    )
                  ],
                ),
                sizedBox15,
                const ProfileField(title: 'Name', detail: 'Midhun Mohan'),
                const ProfileField(
                    title: 'Email', detail: 'midhunmohan911@gmail.com'),
                const ProfileField(title: 'Phone', detail: '7025793652'),
                const ProfileField(title: 'Age', detail: '18'),
                const ProfileField(title: 'Gender', detail: 'Male'),
                const ProfileField(title: 'District', detail: 'Palakkad'),
                const ProfileField(
                    title: 'Address', detail: 'kdjjkd, kdjkjdk, hfiie, dkh'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        side: BorderSide(width: 2, color: themeColor),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Edit',
                        style: TextStyle(color: themeColor),
                      ),
                    ),
                    ElevatedButton(
                      style: elvButtonStyle,
                      onPressed: () {},
                      child: const Text('Reset Password'),
                    )
                  ],
                ),
                sizedBox30
              ],
            )));
  }
}

class ProfileField extends StatelessWidget {
  const ProfileField({
    Key? key,
    required this.title,
    required this.detail,
  }) : super(key: key);

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 60,
          width: 350,
          decoration: boxDecoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "$title ",
                    style: TextStyle(
                        color: themeColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const Text(':'),
              Flexible(
                fit: FlexFit.tight,
                child: SizedBox(
                  child: Text(
                    detail,
                    style: TextStyle(
                        color: themeColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
        sizedBox10
      ],
    );
  }
}
