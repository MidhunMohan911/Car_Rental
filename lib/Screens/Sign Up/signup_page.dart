import 'dart:developer';

import 'package:car_rental/API/Controller/profile_controller.dart';
import 'package:car_rental/Screens/Log%20in/log_in.dart';
import 'package:car_rental/Screens/Sign%20Up/Widgets/textform.dart';
import 'package:car_rental/core/core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import 'package:glassmorphism/glassmorphism.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
                      child: Column(
                        children: [
                          sizedBox15,
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/lock.jpeg'),
                            radius: 22,
                            backgroundColor: Colors.white,
                          ),
                          Text('Sign Up',
                              style: TextStyle(
                                  color: kwhite,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20)),
                          sizedBox10,
                          TextFormPage(title: 'Name'),
                          TextFormPage(title: 'Email'),
                          TextFormPage(title: 'Mobile'),
                          TextFormPage(title: 'Address'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: width * .22,
                                  child: TextFormPage(title: 'Age')),
                              SizedBox(
                                  width: width * .28, child: buildGender()),
                              SizedBox(
                                  width: width * .3,
                                  child: TextFormPage(title: 'District'))
                            ],
                          ),
                          TextFormPage(title: 'Password'),
                          TextFormPage(title: 'Confirm Password'),
                          sizedBox15,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('✘ CLOSE'),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(kRed)),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: ElevatedButton(
                                    onPressed: () async {
                                      Response response =
                                          await ProfileController()
                                              .signUpUser();
                                      log(response.body.toString());
                                    },
                                    child: const Text('LOGIN ➲')),
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
                                            builder: (context) => LoginPage(),
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
            )
          ],
        ),
      ),
    );
  }

  //-------Gender-------//
  Widget buildGender() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
        child: DropdownButton<String>(
            hint: Text(
              'Gender',
              style: TextStyle(color: kwhite),
            ),
            underline: Container(
              height: 2,
              color: kwhite,
            ),
            icon: Icon(Icons.arrow_drop_down, color: kwhite),
            items: <String>['Male', 'Female', 'Other']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {}),
      );
}


















//   //-----Name-----//
//   Widget buildName() => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
//         child: TextFormField(
//           maxLines: 1,
//           style: TextStyle(color: kwhite),
//           decoration: InputDecoration(
//             focusedBorder: outWhiteBorder,
//             enabledBorder: outWhiteBorder,
//             labelText: 'Name',
//             labelStyle: TextStyle(color: kwhite),
//           ),
//         ),
//       );

//   //------Email-------//
//   Widget buildEmail() => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
//         child: TextFormField(
//           maxLines: 1,
//           style: TextStyle(color: kwhite),
//           decoration: InputDecoration(
//               enabledBorder: outWhiteBorder,
//               focusedBorder: outWhiteBorder,
//               labelText: 'Email',
//               labelStyle: TextStyle(color: kwhite)),
//         ),
//       );

//   //-----Phone-----//
//   Widget buildPhone() => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
//         child: TextFormField(
//           maxLines: 1,
//           keyboardType: TextInputType.phone,
//           style: TextStyle(color: kwhite),
//           decoration: InputDecoration(
//               enabledBorder: outWhiteBorder,
//               focusedBorder: outWhiteBorder,
//               labelText: 'Phone',
//               labelStyle: TextStyle(color: kwhite)),
//         ),
//       );

//   //------Address------//
//   Widget buildAddress() => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
//         child: TextFormField(
//           maxLines: 3,
//           style: TextStyle(color: kwhite),
//           decoration: InputDecoration(
//               enabledBorder: outWhiteBorder,
//               focusedBorder: outWhiteBorder,
//               labelText: 'Address',
//               labelStyle: TextStyle(color: kwhite)),
//         ),
//       );

//   //------Age-------//
//   Widget buildAge() => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
//         child: TextFormField(
//           maxLines: 1,
//           keyboardType: TextInputType.number,
//           style: TextStyle(color: kwhite),
//           decoration: InputDecoration(
//               enabledBorder: outWhiteBorder,
//               focusedBorder: outWhiteBorder,
//               labelText: 'Age',
//               labelStyle: TextStyle(color: kwhite)),
//         ),
//       );

//   //-------Gender-------//
//   Widget buildGender() => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
//         child: DropdownButton<String>(
//             hint: Text(
//               'Gender',
//               style: TextStyle(color: kwhite),
//             ),
//             underline: Container(
//               height: 2,
//               color: kwhite,
//             ),
//             icon: Icon(Icons.arrow_drop_down, color: kwhite),
//             items: <String>['Male', 'Female', 'Other']
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//             onChanged: (_) {}),
//       );

//   //-------District-------//
//   Widget buildDistrict() => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
//         child: TextFormField(
//           maxLines: 1,
//           style: TextStyle(color: kwhite),
//           decoration: InputDecoration(
//               enabledBorder: outWhiteBorder,
//               focusedBorder: outWhiteBorder,
//               labelText: 'District',
//               labelStyle: TextStyle(color: kwhite)),
//         ),
//       );

//   //-------Password-------//
//   Widget buildPassword() => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
//         child: TextFormField(
//           maxLines: 1,
//           style: TextStyle(color: kwhite),
//           decoration: InputDecoration(
//               enabledBorder: outWhiteBorder,
//               focusedBorder: outWhiteBorder,
//               labelText: 'Password',
//               labelStyle: TextStyle(color: kwhite)),
//         ),
//       );

//   //-------Confirm Password------//
//   Widget buildConfirmPassword() => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
//         child: TextFormField(
//           maxLines: 1,
//           style: TextStyle(color: kwhite),
//           decoration: InputDecoration(
//               enabledBorder: outWhiteBorder,
//               focusedBorder: outWhiteBorder,
//               labelText: 'Confirm Password',
//               labelStyle: TextStyle(color: kwhite)),
//         ),
//       );
// }
