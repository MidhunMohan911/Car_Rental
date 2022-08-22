import 'package:car_rental/API/Controller/profile_controller.dart';
import 'package:car_rental/API/Models/local_storage.dart';
import 'package:car_rental/API/Models/profile_model.dart';
import 'package:car_rental/Screens/Profile/edit_profile.dart';
import 'package:car_rental/core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProfileController userProfileController =
        Get.put(UserProfileController());

    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22)),
          centerTitle: true,
          elevation: 0,
        ),
        body: Obx(() {
          ProfileModel? userData = userProfileController.profileModel.value;
          if (userData!.name == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SingleChildScrollView(
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
                  ProfileField(title: 'Name', detail: userData.name!),
                  ProfileField(title: 'Email', detail: userData.email!),
                  ProfileField(
                      title: 'Phone', detail: userData.phone.toString()),
                  ProfileField(title: 'Age', detail: userData.age.toString()),
                  ProfileField(title: 'Gender', detail: userData.gender!),
                  ProfileField(title: 'District', detail: userData.district!),
                  ProfileField(title: 'Address', detail: userData.address!),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: const StadiumBorder(),
                          side: BorderSide(width: 2, color: themeColor),
                        ),
                        onPressed: () {
                          Get.to(EditProfilePage(userDetails: userData,));
                        },
                        child: Text(
                          'Edit',
                          style: TextStyle(color: themeColor),
                        ),
                      ),
                      ElevatedButton(
                        style: elvButtonStyle,
                        onPressed: () {
                          print(GetLocalStorage.getUserIdAndToken("uId"));
                        },
                        child: const Text('Reset Password'),
                      )
                    ],
                  ),
                  sizedBox30
                ],
              ));
        }));
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
