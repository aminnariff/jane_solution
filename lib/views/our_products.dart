import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:jane_solution/config/platform.dart';
import 'package:jane_solution/config/size.dart';
import 'package:jane_solution/views/widgets/app_padding.dart';
import 'package:sizer/sizer.dart';

class OurProducts extends StatefulWidget {
  const OurProducts({super.key});

  @override
  State<OurProducts> createState() => _OurProductsState();
}

class _OurProductsState extends State<OurProducts> {
  ValueNotifier<String> shoesColor = ValueNotifier<String>('red');

  @override
  Widget build(BuildContext context) {
    return isWebMobile ? mobileView() : webView();
  }

  Widget mobileView() {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            width: 100.w,
            child: Card(
              elevation: 5,
              shape: const RoundedRectangleBorder(),
              child: SlideInRight(
                child: const Image(
                  image: AssetImage('assets/images/product-2.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 100.w,
            child: Card(
              elevation: 5,
              shape: const RoundedRectangleBorder(),
              child: SlideInLeft(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenPadding / 2),
                  child: Image(
                    image: const AssetImage('assets/images/product-1.png'),
                    width: 100.w,
                  ),
                ),
              ),
            ),
          ),
          const AppPadding().vertical(),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipPath(
                clipper: DiagonalPathClipperOne(),
                child: Container(
                  height: 15.h,
                  color: Colors.red,
                ),
              ),
              Image(
                image: const AssetImage('assets/images/product-3.png'),
                width: 40.h,
              ),
            ],
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              RotationTransition(
                turns: const AlwaysStoppedAnimation(180 / 360),
                child: ClipPath(
                  clipper: DiagonalPathClipperOne(),
                  child: Container(
                    height: 15.h,
                    color: Colors.red,
                  ),
                ),
              ),
              Image(
                image: const AssetImage('assets/images/product-6.png'),
                width: 40.h,
              ),
            ],
          ),
          const AppPadding().vertical(),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  height: 58.w, decoration: BoxDecoration(color: Colors.red.withOpacity(0.10), shape: BoxShape.circle)),
              Container(
                  height: 45.w, decoration: BoxDecoration(color: Colors.red.withOpacity(0.2), shape: BoxShape.circle)),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      height: 32.w,
                      decoration: BoxDecoration(color: Colors.red.withOpacity(0.6), shape: BoxShape.circle)),
                  Image(
                    image: const AssetImage('assets/images/product-5.png'),
                    width: 93.w,
                  ),
                ],
              ),
            ],
          ),
          shoes(),
        ],
      ),
    );
  }

  Widget webView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppPadding().vertical(),
        Row(
          children: [
            SizedBox(
              width: 100.w,
              child: Card(
                elevation: 5,
                shape: const RoundedRectangleBorder(),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: screenPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SlideInLeft(
                        child: Image(
                          image: const AssetImage('assets/images/product-1.png'),
                          width: 45.w,
                        ),
                      ),
                      SlideInRight(
                        child: Image(
                          image: const AssetImage('assets/images/product-2.png'),
                          width: 31.w,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const AppPadding().vertical(),
        Container(
          color: Colors.red.withOpacity(0.9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SlideInLeft(
                child: SizedBox(
                  width: 48.w,
                  child: Card(
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: screenPadding),
                      child: Row(
                        children: [
                          Image(
                            image: const AssetImage('assets/images/product-6.png'),
                            width: 41.31.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: screenPadding * 1.5),
                child: SlideInRight(
                  child: Image(
                    image: const AssetImage('assets/images/product-3.png'),
                    width: 40.w,
                  ),
                ),
              ),
            ],
          ),
        ),
        const AppPadding(denominator: 1 / 2).vertical(),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
                height: 48.w, decoration: BoxDecoration(color: Colors.red.withOpacity(0.10), shape: BoxShape.circle)),
            Container(
                height: 35.w, decoration: BoxDecoration(color: Colors.red.withOpacity(0.2), shape: BoxShape.circle)),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    height: 22.w,
                    decoration: BoxDecoration(color: Colors.red.withOpacity(0.6), shape: BoxShape.circle)),
                Image(
                  image: const AssetImage('assets/images/product-5.png'),
                  width: 80.w,
                ),
              ],
            ),
          ],
        ),
        const AppPadding().vertical(),
        shoes(),
        const AppPadding().vertical(),
      ],
    );
  }

  Widget shoes() {
    return ValueListenableBuilder(
        valueListenable: shoesColor,
        builder: (context, color, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(color == 'red' ? 'assets/images/red-shoes.png' : 'assets/images/blue-shoes.png'),
                height: isWebMobile ? 30.h : 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => shoesColor.value = 'blue',
                    child: Container(
                      height: isWebMobile ? 55 : 65,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: color == 'blue'
                            ? Border.all(
                                width: 3,
                                color: const Color(0xFF0B326C).withOpacity(0.5),
                                style: BorderStyle.solid,
                              )
                            : null,
                      ),
                      child: GlowIcon(
                        Icons.circle,
                        size: isWebMobile ? 40 : 50,
                        color: color == 'blue' ? const Color(0xFF0B326C) : const Color(0xFF7796C5),
                        glowColor: const Color(0xFF0B326C).withOpacity(0.7),
                      ),
                    ),
                  ),
                  const AppPadding(denominator: 2),
                  GestureDetector(
                    onTap: () => shoesColor.value = 'red',
                    child: Container(
                      height: isWebMobile ? 55 : 65,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: color == 'red'
                            ? Border.all(
                                width: 3,
                                color: Colors.red.withOpacity(0.5),
                                style: BorderStyle.solid,
                              )
                            : null,
                      ),
                      child: GlowIcon(
                        Icons.circle,
                        size: isWebMobile ? 40 : 50,
                        color: color == 'red' ? Colors.red : const Color(0xFFE27971),
                        glowColor: Colors.red.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

  // Widget comingSoon() {
//mobile
  // const Spacer(),
  // Text(
  //   'COMING SOON',
  //   style: TextStyle(
  //     fontSize: 34.sp,
  //     fontWeight: FontWeight.bold,
  //     foreground: Paint()
  //       ..shader = const LinearGradient(
  //         colors: <Color>[
  //           Color(0XFFdd1818),
  //           Color(0XFF333333),
  //         ],
  //       ).createShader(Rect.fromLTWH(0.0, 0.0, 80.w, 20.h)),
  //   ),
  // ),
  // const AppPadding(denominator: 2).vertical(),
  // SelectableTextWidget(
  //   text: 'We\'re just few days from our big launch. Stay tune.',
  //   textStyle: Theme.of(context).textTheme.bodyText1!.apply(fontSizeDelta: 12.5.sp),
  //   textAlign: TextAlign.center,
  // ),
  // const Spacer(),
  //web
  // const Spacer(),
  // Text(
  //   'COMING SOON',
  //   style: TextStyle(
  //     fontSize: 28.sp,
  //     fontWeight: FontWeight.bold,
  //     foreground: Paint()
  //       ..shader = const LinearGradient(
  //         colors: <Color>[
  //           Color(0XFFdd1818),
  //           Color(0XFF333333),
  //         ],
  //       ).createShader(Rect.fromLTWH(0.0, 0.0, 80.w, 20.h)),
  //   ),
  // ),
  // const AppPadding(denominator: 2).vertical(),
  // SelectableTextWidget(
  //   text: 'We\'ll be launching soon. Stay tune.',
  //   textStyle: Theme.of(context).textTheme.bodyText1!.apply(fontSizeDelta: 2.5.sp),
  //   textAlign: TextAlign.center,
  // ),
  // const Spacer(),
  // }
}
