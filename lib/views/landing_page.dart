import 'package:flutter/material.dart';
import 'package:jane_solution/config/constants.dart';
import 'package:jane_solution/config/platform.dart';
import 'package:jane_solution/main.dart';
import 'package:jane_solution/views/footer.dart';
import 'package:jane_solution/views/top_bar_navigator.dart';
import 'package:sizer/sizer.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return isWebMobile ? mobileView() : webView();
  }

  Widget mobileView() {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.red),
        title: Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: Image(
            image: const AssetImage(
              'assets/images/mobile-logo-3.jpeg',
            ),
            height: 8.h,
            width: 50.w,
            fit: BoxFit.contain,
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Image(
                image: const AssetImage(
                  'assets/images/mobile-logo-3.jpeg',
                ),
                width: 60.w,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(0),
                physics: const BouncingScrollPhysics(),
                children: [
                  for (int index = 0; index < navigationBar.length; index++)
                    ListTile(
                      title: Text(
                        navigationBar[index],
                        style: Theme.of(context).textTheme.bodyText1!.apply(fontSizeDelta: 10.sp),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        pageIndex.value = index;
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: pageIndex,
              builder: (context, selectedIndex, child) {
                return const TopBarNavigator().goToPage();
              },
            ),
            const WebFooter(),
          ],
        ),
      ),
    );
  }

  Widget webView() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TopBarNavigator(),
            ValueListenableBuilder(
              valueListenable: pageIndex,
              builder: (context, selectedIndex, child) {
                return const TopBarNavigator().goToPage();
              },
            ),
            const WebFooter(),
          ],
        ),
      ),
    );
  }
}
