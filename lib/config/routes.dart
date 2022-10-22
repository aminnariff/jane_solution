import 'package:flutter/material.dart';
import 'package:jane_solution/views/landing_page.dart';

Map<String, Widget Function(BuildContext)> routeList = {
  '/': (context) => const LandingPage(),
  // '/get-to-know-us': (context) => const GetToKnowUs(),
  // '/our-solution-&-products': (context) => const OurProducts(),
};
