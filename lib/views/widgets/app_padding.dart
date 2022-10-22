import 'package:flutter/material.dart';
import 'package:jane_solution/config/platform.dart';
import 'package:sizer/sizer.dart';

class AppPadding extends StatelessWidget {
  final double denominator;
  const AppPadding({Key? key, this.denominator = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isWebMobile ? 5.w / denominator : 2.w / denominator,
    );
  }

  Widget vertical() {
    return SizedBox(
      height: isWebMobile ? 5.w / denominator : 2.w / denominator,
    );
  }
}
