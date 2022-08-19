import 'dart:developer';

import 'package:car_rental/API/Services/loginandsignup.dart';
import 'package:car_rental/Screens/Home/home.dart';
import 'package:car_rental/Screens/Log%20in/Widgets/otp_login.dart';
import 'package:car_rental/Screens/Sign%20Up/Widgets/textform.dart';
import 'package:car_rental/Screens/Sign%20Up/signup_page.dart';
import 'package:car_rental/core/core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:glassmorphism/glassmorphism.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              child: GlassmorphicContainer(
                width: 300,
                height: 450,
                borderRadius: 20,
                linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.2)
                    ]),
                border: 3,
                blur: 4,
                borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.1),
                      Colors.white.withOpacity(0.1)
                    ]),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      sizedBox15,
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/lock.jpeg'),
                        radius: 22,
                        backgroundColor: Colors.white,
                      ),
                      sizedBox10,
                      Text('Sign In',
                          style: TextStyle(
                              color: kwhite,
                              fontWeight: FontWeight.w500,
                              fontSize: 20)),
                      sizedBox10,
                      TextFormPage(
                        title: 'Email',
                        controller: _userNameController,
                        obscuretext: false,
                        keyboardtype: TextInputType.emailAddress,
                        validator: (String? value) {
                          if (value!.isEmpty || !value.isEmail) {
                            return "Enter Correct Email Address";
                          } else {
                            return null;
                          }
                        },
                      ),
                      sizedBox15,
                      TextFormPage(
                          title: 'Password',
                          controller: _passwordController,
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
                      sizedBox30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('✘ CLOSE'),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(kRed)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ElevatedButton(
                                onPressed: () async {
                                  UserAuthService.loginUser(
                                      userName: _userNameController.text,
                                      password:
                                          _passwordController.text.trim());
                                },
                                child: const Text('LOGIN ➲')),
                          ),
                        ],
                      ),
                      sizedBox10,
                      TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    LoginWithOtp(formKey: _formKey));
                          },
                          child: Text(
                            'LOGIN WITH OTP',
                            style: TextStyle(
                                color: kwhite,
                                fontWeight: FontWeight.w500,
                                shadows: const [
                                  Shadow(color: Colors.black, blurRadius: 10)
                                ]),
                          )),
                      sizedBox10,
                      RichText(
                          text: TextSpan(
                              text: ' Already have an account ? ',
                              style: TextStyle(
                                  color: kwhite,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  shadows: const [
                                    Shadow(color: Colors.black, blurRadius: 25)
                                  ]),
                              children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => SignUpPage(),
                                      )),
                                text: 'Sign Up ?',
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    shadows: [
                                      Shadow(
                                          color: Colors.black, blurRadius: 25)
                                    ])),
                          ])),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //----------Login with OTP---------//
}

// class LoginWithOtp extends StatelessWidget {
//   const LoginWithOtp({
//     Key? key,
//     required GlobalKey<FormState> formKey,
//   })  : _formKey = formKey,
//         super(key: key);

//   final GlobalKey<FormState> _formKey;

//   @override
//   Widget build(BuildContext context) => AlertDialog(
//         backgroundColor: const Color.fromARGB(255, 241, 237, 237),
//         content: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const Text(
//                   'Enter your Mobile Number',
//                   style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
//                 ),
//                 sizedBox15,
//                 TextFormField(
//                   maxLines: 1,
//                   keyboardType: TextInputType.phone,
//                   style: const TextStyle(color: Colors.black),
//                   decoration: const InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                         ),
//                       ),
//                       hintText: 'Mobile Number',
//                       hintStyle: TextStyle(color: Colors.black)),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     showDialog(
//                         context: context,
//                         builder: (context) => OtpNumber(formKey: _formKey));
//                   },
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                   ),
//                   child: const Text("CONFIRM"),
//                 )
//               ],
//             )),
//       );
// }

class OtpNumber extends StatelessWidget {
  const OtpNumber({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 241, 237, 237),
      content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Enter OTP Number',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              sizedBox15,
              TextFormField(
                //maxLength: 4,
                maxLines: 1,
                keyboardType: TextInputType.number,
                style: TextStyle(color: kwhite),
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    hintText: 'Otp Number',
                    hintStyle: TextStyle(color: Colors.black)),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text("LOGIN ➲"),
              )
            ],
          )),
    );
  }
}
