import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:jane_solution/config/constants.dart';
import 'package:jane_solution/config/size.dart';
import 'package:jane_solution/main.dart';
import 'package:jane_solution/views/contact_us.dart';
import 'package:jane_solution/views/faqs.dart';
import 'package:jane_solution/views/get_to_know_us.dart';
import 'package:jane_solution/views/homepage.dart';
import 'package:jane_solution/views/our_products.dart';
import 'package:jane_solution/views/widgets/app_padding.dart';
import 'package:sizer/sizer.dart';

class TopBarNavigator extends StatelessWidget {
  const TopBarNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image(
          image: const AssetImage(
            'assets/images/logo-3.jpg',
          ),
          width: 40.w,
          height: 20.h,
        ),
        Container(
          margin: EdgeInsets.only(bottom: screenPadding * 1.5),
          child: navigation(),
        ),
      ],
    );
  }

  Widget navigation() {
    return Row(
      children: [
        for (int index = 0; index < navigationBar.length; index++) ...[
          hoverButton(navigationBar[index], index),
          if (index != navigationBar.length - 1) const AppPadding(denominator: 2),
        ],
        // hoverButton('Get to Know Us', 1),
        // const AppPadding(denominator: 2),
        // hoverButton('Our Solution & Products', 2),
        // const AppPadding(denominator: 2),
        // hoverButton('Contact Us', 3),
        // const AppPadding(denominator: 2),
        // hoverButton('FAQ(s)', 4),
      ],
    );
  }

  Widget hoverButton(String text, int index) {
    return ValueListenableBuilder<int>(
        valueListenable: pageIndex,
        builder: (context, selectedIndex, child) {
          return HoverButton(
            onpressed: () {
              pageIndex.value = index;
              goToPage();
            },
            hoverPadding: EdgeInsets.symmetric(horizontal: screenPadding),
            color: Colors.white,
            elevation: 0.0,
            textColor: Colors.black,
            hoverTextColor: Colors.red,
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .apply(color: (selectedIndex == index) ? Colors.red : Colors.black),
            ),
          );
        });
  }

  Widget goToPage() {
    if (pageIndex.value == 0) {
      // Navigator.pushNamed(context, '/');
      return const Homepage();
    } else if (pageIndex.value == 1) {
      // Navigator.pushNamed(context, '/get-to-know-us');
      return const GetToKnowUs();
    } else if (pageIndex.value == 2) {
      // Navigator.pushNamed(context, '/our-solution-&-products');
      return const OurProducts();
    } else if (pageIndex.value == 3) {
      // Navigator.pushNamed(context, '/');
      return const ContactUsToday();
    } else if (pageIndex.value == 4) {
      // Navigator.pushNamed(context, '/');
      return const Faqs();
    }
    return const Homepage();
  }
}
