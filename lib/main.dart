import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jane_solution/config/loading.dart';
import 'package:jane_solution/config/routes.dart';
import 'package:jane_solution/config/size.dart';
import 'package:jane_solution/config/theme.dart';
import 'package:sizer/sizer.dart';

// update icon
// flutter pub run flutter_launcher_icons:main
ValueNotifier<int> pageIndex = ValueNotifier<int>(0);

void main() {
  runApp(const MyApp());
  AppLoading().configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Sizer(builder: (context, orientation, deviceType) {
        SizeConfig().set(context);
        return MaterialApp(
          title: 'Align Orthotic',
          debugShowCheckedModeBanner: false,
          theme: theme(context),
          builder: EasyLoading.init(),
          routes: routeList,
          initialRoute: '/',
        );
      }),
    );
  }
}
