import 'dart:html' as html;
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:jane_solution/config/constants.dart';
import 'package:jane_solution/config/platform.dart';
import 'package:jane_solution/config/size.dart';
import 'package:jane_solution/views/widgets/app_padding.dart';
import 'package:jane_solution/views/widgets/selectable_text.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  ValueNotifier<bool> buttonOnHover = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return isWebMobile ? mobileView() : webView();
  }

  Widget mobileView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: const [],
        ),
        const AppPadding().vertical(),
        ElasticIn(
          child: SelectableTextWidget(
            text: 'A PRODUCT THAT DOES\nYOUR HEALTH GREAT\nAGAIN',
            textStyle: Theme.of(context).textTheme.headline1!.apply(fontSizeDelta: 15.sp, fontWeightDelta: 1),
            textAlign: TextAlign.center,
          ),
        ),
        const AppPadding(denominator: 1.31).vertical(),
        SelectableTextWidget(
          text: 'Get Ready to Align',
          textStyle: Theme.of(context).textTheme.bodyText1!.apply(fontSizeDelta: 10.sp),
        ),
        const AppPadding().vertical(),
        mobileItem('Heel Pain ?', 'assets/images/heel-Pain.jpg'),
        mobileItem('Knee Pain ?', 'assets/images/knee-Pain.jpg'),
        mobileItem('Back Pain ?', 'assets/images/back-Pain.jpg'),
        mobileItem('Achilles Tendonitis ?', 'assets/images/achittes.jpg'),
        const AppPadding(denominator: 2).vertical(),
        mobileLookUsNowButton(),
        const AppPadding().vertical(),
      ],
    );
  }

  Widget webView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // const TopBarNavigator(),
          const AppPadding().vertical(),
          JelloIn(
            child: SelectableTextWidget(
              text: 'Get Ready to Align',
              textStyle: Theme.of(context).textTheme.bodyText1!.apply(fontSizeDelta: 1.5.sp),
            ),
          ),
          const AppPadding().vertical(),
          FadeIn(
            child: SelectableTextWidget(
              text: 'A PRODUCT THAT DOES YOUR HEALTH\nGREAT AGAIN',
              textStyle: Theme.of(context).textTheme.headline1!.apply(fontSizeDelta: 5.5.sp),
              textAlign: TextAlign.center,
            ),
          ),
          const AppPadding(denominator: 1 / 3).vertical(),
          Row(
            children: [
              webItem('Heel Pain ?', 'assets/images/heel-Pain.jpg'),
              webItem('Knee Pain ?', 'assets/images/knee-Pain.jpg'),
              webItem('Back Pain ?', 'assets/images/back-Pain.jpg'),
              webItem('Achilles Tendonitis ?', 'assets/images/achittes.jpg'),
            ],
          ),
          const AppPadding(denominator: 1 / 3).vertical(),
          webLookUsNowButton(),
          // const WebFooter(),
        ],
      ),
    );
  }

  Widget mobileItem(String text, String imagePath) {
    return Column(
      children: [
        Image(
          image: AssetImage(
            imagePath,
          ),
          width: 50.w,
          height: 50.w,
        ),
        const AppPadding(denominator: 2).vertical(),
        SelectableTextWidget(
          text: text,
          textStyle: Theme.of(context).textTheme.bodyText1!.apply(fontSizeDelta: 10.sp),
        ),
        const AppPadding().vertical(),
      ],
    );
  }

  Widget webItem(String text, String imagePath) {
    return Expanded(
      child: Column(
        children: [
          SelectableTextWidget(
            text: text,
          ),
          ElasticIn(
            child: Image(
              image: AssetImage(
                imagePath,
              ),
              width: 15.w,
              height: 15.w,
            ),
          ),
        ],
      ),
    );
  }

  Widget mobileLookUsNowButton() {
    return ElevatedButton(
      onPressed: () {
        _launchUrl();
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: const BorderSide(color: Colors.black),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: screenPadding * 5, vertical: screenPadding)),
      ),
      child: Text(
        'Look For Us Now',
        style: TextStyle(fontSize: 14.sp, color: Colors.black),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(lookForUsRedirection))) {
      throw 'Could not launch $lookForUsRedirection';
    }
  }

  Widget webLookUsNowButton() {
    return ElevatedButton(
      onPressed: () {
        html.window.open(lookForUsRedirection, 'new tab');
      },
      onHover: (bool onHover) {
        buttonOnHover.value = onHover;
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: const BorderSide(color: Colors.black),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: screenPadding * 5, vertical: screenPadding / 1.7)),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.black;
            } else {
              return Colors.white;
            }
          },
        ),
      ),
      child: ValueListenableBuilder<bool>(
          valueListenable: buttonOnHover,
          builder: (context, value, child) {
            return Text(
              'Look For Us Now',
              style: TextStyle(
                fontSize: 4.sp,
                color: value ? Colors.white : Colors.black,
              ),
            );
          }),
    );
  }
}
