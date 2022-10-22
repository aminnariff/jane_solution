import 'package:flutter/material.dart';
import 'package:jane_solution/config/platform.dart';
import 'package:jane_solution/config/size.dart';
import 'package:jane_solution/views/widgets/app_padding.dart';
import 'package:jane_solution/views/widgets/selectable_text.dart';
import 'package:sizer/sizer.dart';

class OurProducts extends StatefulWidget {
  const OurProducts({super.key});

  @override
  State<OurProducts> createState() => _OurProductsState();
}

class _OurProductsState extends State<OurProducts> {
  @override
  Widget build(BuildContext context) {
    return isWebMobile ? mobileView() : webView();
  }

  Widget mobileView() {
    return SizedBox(
      height: screenHeight * 0.8,
      child: Column(
        children: [
          const Spacer(),
          Text(
            'COMING SOON',
            style: TextStyle(
              fontSize: 34.sp,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: <Color>[
                    Color(0XFFdd1818),
                    Color(0XFF333333),
                  ],
                ).createShader(Rect.fromLTWH(0.0, 0.0, 80.w, 20.h)),
            ),
          ),
          const AppPadding(denominator: 2).vertical(),
          SelectableTextWidget(
            text: 'We\'re just few days from our big launch. Stay tune.',
            textStyle: Theme.of(context).textTheme.bodyText1!.apply(fontSizeDelta: 12.5.sp),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget webView() {
    return SizedBox(
      height: screenHeight * 0.6,
      child: Column(
        children: [
          const Spacer(),
          Text(
            'COMING SOON',
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: <Color>[
                    Color(0XFFdd1818),
                    Color(0XFF333333),
                  ],
                ).createShader(Rect.fromLTWH(0.0, 0.0, 80.w, 20.h)),
            ),
          ),
          const AppPadding(denominator: 2).vertical(),
          SelectableTextWidget(
            text: 'We\'ll be launching soon. Stay tune.',
            textStyle: Theme.of(context).textTheme.bodyText1!.apply(fontSizeDelta: 2.5.sp),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
