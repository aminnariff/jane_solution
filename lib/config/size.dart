import 'package:flutter/material.dart';
import 'package:jane_solution/config/platform.dart';
import 'package:sizer/sizer.dart';

late double textSize;
late double iconSize;
late double screenPadding;
late double screenWidth;
late double screenHeight;

class SizeConfig {
  void set(BuildContext context) {
    screenWidth = 100.w;
    screenHeight = 100.h;

    if (screenWidth < 500) {
      textSize = 0;
      iconSize = 10.w;
    } else {
      textSize = 5.sp;
      iconSize = 3.w;
    }

    screenPadding = isWebMobile ? 5.w : 2.w;
  }
}
