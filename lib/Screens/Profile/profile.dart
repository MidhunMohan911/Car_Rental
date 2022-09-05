import 'package:car_rental/API/Controller/profile_controller.dart';
import 'package:car_rental/API/Models/local_storage.dart';
import 'package:car_rental/API/Models/profile_model.dart';
import 'package:car_rental/Screens/Profile/edit_profile.dart';
import 'package:car_rental/Screens/Sign%20Up/Widgets/textform.dart';
import 'package:car_rental/core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../API/Services/profile_services.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
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

          print("obx called");

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
                          Get.to(EditProfilePage(
                            userDetails: userData,
                          ));
                        },
                        child: Text(
                          'Edit',
                          style: TextStyle(color: themeColor),
                        ),
                      ),
                      ElevatedButton(
                        style: elvButtonStyle,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: themeColor,
                                content: SizedBox(
                                  height: 280,
                                  child: Form(
                                    key: _formKey,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Text(
                                            'Reset Your Password',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: kwhite,
                                                fontSize: 20),
                                          ),
                                          sizedBox10,
                                          TextFormPage(
                                              title: 'Password',
                                              controller: _passwordController,
                                              obscuretext: true,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter password';
                                                } else if (value.length < 6) {
                                                  return 'please enter atleast 6 digit password';
                                                }

                                                return null;
                                              }),
                                          TextFormPage(
                                            title: 'Confirm Password',
                                            controller:
                                                confirmPasswordController,
                                            obscuretext: true,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please confirm password';
                                              } else if (_passwordController
                                                      .text !=
                                                  confirmPasswordController
                                                      .text) {
                                                return 'Password do not match';
                                              }
                                              return null;
                                            },
                                          ),
                                          sizedBox15,
                                          ElevatedButton(
                                              style: elvButtonStyleWhite,
                                              onPressed: () {
                                                bool? isValid = _formKey
                                                    .currentState!
                                                    .validate();
                                                print(isValid);

                                                if (isValid) {
                                                  final ProfileModel
                                                      profileModel =
                                                      ProfileModel(
                                                          password:
                                                              _passwordController
                                                                  .text);

                                                  UserProfileService
                                                      .resetUserProfile(
                                                          profileModel,
                                                          _passwordController
                                                              .text);
                                                }
                                              },
                                              child: const Text(
                                                'Reset',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
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
