import 'package:flutter/material.dart';
import 'package:jane_solution/views/get_to_know_us.dart';
import 'package:jane_solution/views/homepage.dart';
import 'package:jane_solution/views/our_products.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.firstPage:
        return _GeneratePageRoute(widget: const Homepage(), routeName: '/');
      case RoutesName.secondPage:
        return _GeneratePageRoute(widget: const GetToKnowUs(), routeName: '/get-to-know-us');
      default:
        return _GeneratePageRoute(widget: const OurProducts(), routeName: 'our-solutions-&-products');
    }
  }
}

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final String routeName;
  _GeneratePageRoute({
    required this.widget,
    required this.routeName,
  }) : super(
            settings: RouteSettings(name: routeName),
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation, Widget child) {
              return SlideTransition(
                textDirection: TextDirection.rtl,
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            });
}

class RoutesName {
  // ignore: non_constant_identifier_names
  static const String firstPage = '/';
  // ignore: non_constant_identifier_names
  static const String secondPage = '/get-to-know-us';
}
