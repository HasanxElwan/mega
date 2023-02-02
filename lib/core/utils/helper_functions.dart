import 'dart:ui';
import 'package:flutter/material.dart';

String? validateEmailFormat(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value!)) {
    return "Enter Valid Email Address";
  } else {
    return null;
  }
}

Future navigatTo(context, {required Widget screen}) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return screen;
  }));
}

Future navigatAndReplacement(context, {required Widget screen}) {
  return Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => screen), (route) => false);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
