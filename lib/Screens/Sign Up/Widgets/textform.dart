import 'package:car_rental/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextFormPage extends StatelessWidget {
  TextFormPage(
      {Key? key,
      required this.title,
      this.validator,
      this.controller,
      this.keyboardtype,
      this.obscuretext})
      : super(key: key);
  String title;
  FormFieldValidator? validator;
  TextEditingController? controller;
  TextInputType? keyboardtype;
  final bool? obscuretext;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardtype,
          maxLines: 1,
          style: TextStyle(color: kwhite),
          validator: validator,
          decoration: InputDecoration(
            focusedBorder: outWhiteBorder,
            enabledBorder: outWhiteBorder,
            labelText: title,
            labelStyle: TextStyle(color: kwhite),
          ),
        ),
      );
}
