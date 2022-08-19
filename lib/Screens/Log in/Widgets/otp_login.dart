import 'package:car_rental/API/Services/otp_service.dart';
import 'package:car_rental/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class LoginWithOtp extends StatefulWidget {
  const LoginWithOtp({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  State<LoginWithOtp> createState() => _LoginWithOtpState();
}

class _LoginWithOtpState extends State<LoginWithOtp> {
  String mobileNo = '';
  bool isApiCallProcess = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 241, 237, 237),
      content: Form(
          key: widget._formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Enter your Mobile Number',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              sizedBox15,
              TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.black),
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
                    hintText: 'Mobile Number',
                    hintStyle: TextStyle(color: Colors.black)),
              ),
              ElevatedButton(
                onPressed: () {
                  print('ghfgiuhh');

                  setState(() {
                    isApiCallProcess = true;
                    print(isApiCallProcess);
                  });

                  if (mobileNo.length > 2) {
                    setState(() {
                      isApiCallProcess = true;
                    });

                    ApiService.otpLogin(mobileNo).then((response) {
                      print(response.message);
                      print(response.data);
                      isApiCallProcess = false;

                      if (response.data != null) {
                        showDialog(
                            context: context,
                            builder: (context) => OtpNumber(
                                  formKey: widget._formKey,
                                  mobileNo: mobileNo,
                                  otpHash: response.data,
                                ));
                      }
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text("CONFIRM"),
              )
            ],
          )),
    );
  }
}

class OtpNumber extends StatefulWidget {
  final String? mobileNo;
  final String? otpHash;
  const OtpNumber({
    Key? key,
    required this.mobileNo,
    required this.otpHash,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  State<OtpNumber> createState() => _OtpNumberState();
}

class _OtpNumberState extends State<OtpNumber> {
  String _otpCode = '';
  final int _otpCodeLength = 4;
  bool isApiCallProcess = false;

  late FocusNode myFocusNode;

  @override
  void initState() {
    myFocusNode = FocusNode();
    myFocusNode.requestFocus();

    SmsAutoFill().listenForCode.call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      inAsyncCall: isApiCallProcess,
      opacity: .3,
      key: UniqueKey(),
      child: AlertDialog(
        backgroundColor: Color.fromARGB(255, 241, 237, 237),
        content: Column(
          children: [
            const Text(
              'Enter OTP Number',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
            sizedBox10,
            PinFieldAutoFill(
              decoration: UnderlineDecoration(
                  colorBuilder:
                      FixedColorBuilder(Colors.black.withOpacity(.3))),
              currentCode: _otpCode,
              codeLength: _otpCodeLength,
              onCodeChanged: (code) {
                if (code!.length == _otpCodeLength) {
                  _otpCode = code;
                  FocusScope.of(context).requestFocus(FocusNode());
                }
              },
            ),
            sizedBox15,
            ElevatedButton(onPressed: () {}, child: Text('Verify'))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    myFocusNode.dispose();
    super.dispose();
  }
}
