import 'package:flutter/material.dart';
import 'package:jane_solution/config/constants.dart';
import 'package:jane_solution/config/platform.dart';
import 'package:jane_solution/config/size.dart';
import 'package:jane_solution/views/widgets/app_padding.dart';
import 'package:jane_solution/views/widgets/selectable_text.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class WebFooter extends StatelessWidget {
  const WebFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppPadding().vertical(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenPadding / 2),
          child: SelectableTextWidget(
            text: companyAddress,
            textStyle: Theme.of(context).textTheme.subtitle1!.apply(fontSizeDelta: isWebMobile ? 10.sp : 0),
            textAlign: TextAlign.center,
          ),
        ),
        const AppPadding(denominator: 2).vertical(),
        GestureDetector(
          onTap: () async {
            if (!await launchUrl(Uri.parse(lookForUsRedirection))) {
              throw 'Could not launch $lookForUsRedirection';
            }
          },
          child: Icon(
            Icons.facebook_rounded,
            color: Colors.black,
            size: iconSize,
          ),
        ),
        const AppPadding(denominator: 2).vertical(),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: screenPadding / 2),
                alignment: Alignment.center,
                color: Colors.grey[200],
                child: SelectableTextWidget(
                  text: '© 2018 by Align Orthotic Insoles.',
                  textStyle: Theme.of(context).textTheme.subtitle1!.apply(fontSizeDelta: isWebMobile ? 10.sp : 0),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
