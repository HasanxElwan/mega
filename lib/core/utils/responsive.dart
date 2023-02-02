import 'package:flutter/cupertino.dart';

double responsiveHeight(context) {
  return MediaQuery.of(context).size.height;
}

double responsiveWidth(context) {
  return MediaQuery.of(context).size.width;
}
