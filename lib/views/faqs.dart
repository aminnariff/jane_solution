import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:jane_solution/config/constants.dart';
import 'package:jane_solution/config/platform.dart';
import 'package:jane_solution/config/size.dart';
import 'package:jane_solution/views/widgets/app_padding.dart';
import 'package:jane_solution/views/widgets/selectable_text.dart';
import 'package:sizer/sizer.dart';

class Faqs extends StatelessWidget {
  const Faqs({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isWebMobile ? 90.w : 70.w,
      child: Column(
        children: [
          const AppPadding(denominator: 1 / 2).vertical(),
          SelectableTextWidget(
            text: 'Frequently asked questions',
            textStyle: Theme.of(context).textTheme.headline1!.apply(fontSizeDelta: isWebMobile ? 12.sp : 5.5.sp),
          ),
          const AppPadding().vertical(),
          SelectableTextWidget(
            text: 'Have Questions? We\'re here to help.',
            textStyle: Theme.of(context)
                .textTheme
                .bodyText1!
                .apply(fontSizeDelta: isWebMobile ? 10.sp : 1.sp, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
          const AppPadding(denominator: 1 / 3).vertical(),
          ExpandedTileList.builder(
            itemCount: faqList.length,
            maxOpened: 1,
            reverse: true,
            itemBuilder: (context, index, controller) {
              return ExpandedTile(
                theme: ExpandedTileThemeData(
                  headerColor: Colors.white,
                  headerRadius: 15.0,
                  headerPadding: const EdgeInsets.all(24.0),
                  headerSplashColor: Colors.grey[300],
                  contentBackgroundColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: screenPadding, vertical: screenPadding / 1),
                  contentRadius: 12.0,
                ),
                controller: index == 2 ? controller.copyWith(isExpanded: true) : controller,
                title: Text(
                  faqList[index].question,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .apply(fontWeightDelta: isWebMobile ? 1 : 2, fontSizeDelta: isWebMobile ? 10.sp : 0),
                ),
                content: Container(
                  color: Colors.white,
                  child: SelectableTextWidget(
                    text: faqList[index].description,
                    textStyle: Theme.of(context).textTheme.bodyText1!.apply(fontSizeDelta: isWebMobile ? 10.sp : 0),
                  ),
                ),
                onTap: () {
                  if (controller.isExpanded) {
                    controller.collapse();
                  } else {
                    controller.expand();
                  }
                },
              );
            },
          ),
          const AppPadding(denominator: 1 / 3).vertical(),
        ],
      ),
    );
  }
}

class FaqAttribute {
  final String question;
  final String description;

  FaqAttribute({
    required this.question,
    required this.description,
  });
}
