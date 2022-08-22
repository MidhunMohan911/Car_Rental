import 'package:car_rental/API/Controller/controller.dart';
import 'package:car_rental/API/Models/profile_model.dart';
import 'package:car_rental/API/Services/loginandsignup.dart';
import 'package:car_rental/Screens/Log%20in/log_in.dart';
import 'package:car_rental/Screens/Sign%20Up/Widgets/textform.dart';
import 'package:car_rental/core/core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  TextEditingController districtController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              "assets/images/f23488d2842df2adcea43b23d86e2c13.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Center(
              child: SingleChildScrollView(
                child: Center(
                  child: GlassmorphicContainer(
                    width: width * .85,
                    height: height * .90,
                    borderRadius: 20,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.2)
                        ]),
                    border: 3,
                    blur: 8,
                    borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.15),
                          Colors.white.withOpacity(0.15)
                        ]),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              sizedBox15,
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/lock.jpeg'),
                                radius: 22,
                                backgroundColor: Colors.white,
                              ),
                              Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: kwhite,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              sizedBox10,
                              TextFormPage(
                                title: 'Name',
                                controller: nameController,
                                obscuretext: false,
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
                              ),
                              TextFormPage(
                                title: 'Email',
                                controller: emailController,
                                keyboardtype: TextInputType.emailAddress,
                                validator: (String? value) {
                                  if (value!.isEmpty || !value.isEmail) {
                                    return "Enter Correct Email Address";
                                  } else {
                                    return null;
                                  }
                                },
                                obscuretext: false,
                              ),
                              TextFormPage(
                                title: 'Mobile',
                                keyboardtype: TextInputType.phone,
                                obscuretext: false,
                                controller: mobileController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "*required";
                                  } else if (!value
                                      .contains(RegExp(r'[0-9]'))) {
                                    return "please enter numbers";
                                  } else if (value.length != 10) {
                                    return "please enter 10 numbers";
                                  }
                                  return null;
                                },
                              ),
                              TextFormPage(
                                title: 'Address',
                                controller: addressController,
                                obscuretext: false,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GetBuilder<Controller>(
                                      builder: (Controller controller) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: SizedBox(
                                        height: 30,
                                        width: 80,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: kwhite),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: DropdownButton<int>(
                                            hint: Text(
                                              "Age",
                                            ),
                                            value: controller.ageSelected,
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                            focusColor: Colors.white,
                                            isDense: false,
                                            onChanged: (newValue) {
                                              controller.setSelected(
                                                  newValue!.toString(), "age");
                                            },
                                            underline: const SizedBox(),
                                            icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black,
                                            ),
                                            items: controller.ageList
                                                .map<DropdownMenuItem<int>>(
                                                    (value) {
                                              return DropdownMenuItem<int>(
                                                value: value,
                                                child: Text(
                                                  value.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: kwhite),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: SizedBox(
                                      width: 70,
                                      //width: width * .26,
                                      child: GetBuilder<Controller>(
                                          builder: (controller) {
                                        return Center(
                                          child: DropdownButton<String>(
                                            hint: const Text(
                                              "Gender",
                                            ),
                                            value: controller.selected,
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                            isDense: true,
                                            onChanged: (newValue) {
                                              controller.setSelected(
                                                newValue!,
                                                "gender",
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black,
                                            ),
                                            items: controller.listType
                                                .map<DropdownMenuItem<String>>(
                                                    (value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: kwhite),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: SizedBox(
                                      // width: width * .25,
                                      child: GetBuilder<Controller>(
                                          builder: (controller) {
                                        return DropdownButton<String>(
                                          hint: const Text(
                                            "District",
                                          ),
                                          value: controller.districtSelected,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          isDense: true,
                                          onChanged: (newValue) {
                                            controller.setSelected(
                                              newValue!,
                                              "district",
                                            );
                                          },
                                          icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black),
                                          items: controller.districts
                                              .map<DropdownMenuItem<String>>(
                                                  (value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Text(
                                                  value,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        );
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                              TextFormPage(
                                  title: 'Password',
                                  controller: passwordController,
                                  obscuretext: true,
                                  validator: (value) {
                                    RegExp regex = RegExp(
                                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                    if (value!.isEmpty) {
                                      return 'Please enter password';
                                    } else if (value.length < 6) {
                                      return 'please enter atleast 6 digit password';
                                    }

                                    return null;
                                  }),
                              TextFormPage(
                                title: 'Confirm Password',
                                controller: confirmPasswordController,
                                obscuretext: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please confirm password';
                                  } else if (passwordController.text !=
                                      confirmPasswordController.text) {
                                    return 'Password do not match';
                                  }
                                  return null;
                                },
                              ),
                              sizedBox15,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('✘ CLOSE'),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(kRed)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          if (controller.selected == null) {
                                            Get.showSnackbar(
                                              const GetSnackBar(
                                                message: "Please select gender",
                                                title: "Warning!!",
                                                duration: Duration(
                                                  seconds: 2,
                                                ),
                                              ),
                                            );
                                            return;
                                          }

                                          bool isValid =
                                              formKey.currentState!.validate();

                                          if (isValid) {
                                            final ProfileModel profileModel =
                                                ProfileModel(
                                              name: nameController.text,
                                              email: emailController.text,
                                              phone: int.parse(
                                                  mobileController.text),
                                              age: controller.ageSelected,
                                              gender: controller.selected!,
                                              address: addressController.text,
                                              district:
                                                  controller.districtSelected,
                                              password: passwordController.text,
                                            );

                                            UserAuthService.signUpUser(
                                                profileModel);
                                          }
                                        },
                                        child: const Text('SIGN UP ➲')),
                                  )
                                ],
                              ),
                              sizedBox15,
                              RichText(
                                  text: TextSpan(
                                      text: ' Already have an account ? ',
                                      style: TextStyle(
                                        color: kwhite,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                      children: [
                                    TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage(),
                                              )),
                                        text: 'Sign In ?',
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ])),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
