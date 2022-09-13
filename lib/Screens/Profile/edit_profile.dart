// ignore_for_file: avoid_print

import 'package:car_rental/API/Controller/controller.dart';
import 'package:car_rental/API/Controller/profile_controller.dart';
import 'package:car_rental/API/Models/profile_model.dart';

import 'package:car_rental/core/core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../API/Models/local_storage.dart';

// ignore: must_be_immutable
class EditProfilePage extends StatelessWidget {
  EditProfilePage({Key? key, required this.userDetails}) : super(key: key);
  ProfileModel userDetails;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    UserProfileController userProfileController =
        Get.find<UserProfileController>();
    Controller controller = Get.find<Controller>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22)),
          centerTitle: true,
          elevation: 0,
        ),
        body: Obx(() {
          ProfileModel? userData = userProfileController.profileModel.value;
          if (userData == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: GetBuilder<UserProfileController>(
                initState: (state) {
                nameController.text = userDetails.name!;
                emailController.text = userDetails.email!;
                phoneController.text = userDetails.phone.toString();
                ageController.text = userDetails.age.toString();
                genderController.text = userDetails.gender.toString();
                districtController.text = userDetails.district!;
                addressController.text = userDetails.address!;
              }, builder: (contrlrr) {
                return Form(
                  key: formKey,
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
                      EditProfileField(
                          title: 'Name',
                          detail: TextFormField(
                            controller: nameController,
                            validator: (value) {
                              String pattern = r'(^[a-z A-Z]+$)';
                              RegExp regExp = RegExp(pattern.toString());
                              if (value!.isEmpty) {
                                return 'enter a name';
                              } else if (!regExp.hasMatch(value)) {
                                return 'please enter a valid name';
                              } else if (value.length < 4) {
                                return "please enter 4 or more characters";
                              }
                              return null;
                            },
                            style: TextStyle(
                                color: themeColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          )),
                      EditProfileField(
                          title: 'Email',
                          detail: TextFormField(
                            controller: emailController,
                            validator: (String? value) {
                              if (value!.isEmpty || !value.isEmail) {
                                return "Enter Correct Email Address";
                              } else {
                                return null;
                              }
                            },
                            style: TextStyle(
                                color: themeColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          )),
                      EditProfileField(
                          title: 'Phone',
                          detail: TextFormField(
                            controller: phoneController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "*required";
                              } else if (!value.contains(RegExp(r'[0-9]'))) {
                                return "please enter numbers";
                              } else if (value.length != 10) {
                                return "please enter 10 numbers";
                              }
                              return null;
                            },
                            style: TextStyle(
                                color: themeColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          )),
                      EditProfileField(
                          title: 'Age',
                          detail: TextFormField(
                            controller: ageController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'enter age';
                              } else if (int.parse(value) < 17 ||
                                  int.parse(value) > 45) {
                                return 'please enter b/w 18-45';
                              }
                              return null;
                            },
                            style: TextStyle(
                                color: themeColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          )),
                      EditProfileField(
                          title: 'Gender',
                          detail: TextFormField(
                            controller: genderController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'enter Gender';
                              }
                              return null;
                            },
                            style: TextStyle(
                                color: themeColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          )),
                      EditProfileField(
                          title: 'District',
                          detail: TextFormField(
                            controller: districtController,
                            style: TextStyle(
                                color: themeColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          )),
                      EditProfileField(
                          title: 'Address',
                          detail: TextFormField(
                            controller: addressController,
                            style: TextStyle(
                                color: themeColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          )),
                      ElevatedButton(
                        style: elvButtonStyle,
                        onPressed: () {
                          print('hhhhhhh');

                          String? userId =
                              GetLocalStorage.getUserIdAndToken('uId');

                          bool? isValid = formKey.currentState!.validate();
                          print(isValid);

                          if (isValid) {
                            final ProfileModel profileModel = ProfileModel(
                              name: nameController.text,
                              email: emailController.text,
                              phone: int.parse(phoneController.text),
                              age: int.parse(ageController.text),
                              gender: genderController.text,
                              address: addressController.text,
                              district: districtController.text,
                            );

                            contrlrr.updateUserData(profileModel, userId!);

                            print(profileModel);
                            print(profileModel.name);
                          }
                        },
                        child: const Text('Submit'),
                      ),
                      sizedBox30
                    ],
                  ),
                );
              }));
        }));
  }
}

class EditProfileField extends StatelessWidget {
  const EditProfileField({
    Key? key,
    required this.title,
    required this.detail,
  }) : super(key: key);

  final String title;

  final TextFormField detail;

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
              const Text(': '),
              Flexible(
                fit: FlexFit.tight,
                child: SizedBox(child: detail),
              ),
            ],
          ),
        ),
        sizedBox10
      ],
    );
  }
}
