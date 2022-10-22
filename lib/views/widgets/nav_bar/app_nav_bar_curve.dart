import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:jane_solution/config/color.dart';
import 'package:jane_solution/config/size.dart';

@immutable
class AppNavBarCurve extends StatelessWidget {
  final String title;
  final bool backButton;
  final dynamic color;

  const AppNavBarCurve({
    Key? key,
    required this.title,
    this.backButton = false,
    this.color = primaryColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          gradient: const LinearGradient(colors: [
            Colors.transparent,
            Colors.transparent,
          ]),
        ),
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                height: screenHeight * 0.2,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(50.0),
                    bottomLeft: Radius.circular(50.0),
                  ),
                  gradient: LinearGradient(
                    colors: color,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenPadding / 2, vertical: screenPadding),
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: backButton ? Colors.white : Colors.transparent,
                          size: 24 + textSize,
                        ),
                        onPressed: () {
                          if (backButton) {
                            Navigator.pop(context);
                          }
                        }),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline1!.apply(
                            fontSizeDelta: textSize,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
