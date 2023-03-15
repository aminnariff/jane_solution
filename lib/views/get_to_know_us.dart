import 'package:flutter/material.dart';
import 'package:jane_solution/config/platform.dart';
import 'package:jane_solution/config/size.dart';
import 'package:jane_solution/views/widgets/app_padding.dart';
import 'package:jane_solution/views/widgets/selectable_text.dart';
import 'package:sizer/sizer.dart';

class GetToKnowUs extends StatefulWidget {
  const GetToKnowUs({super.key});

  @override
  State<GetToKnowUs> createState() => _GetToKnowUsState();
}

class _GetToKnowUsState extends State<GetToKnowUs> {
  final List<Information> infoList = [
    Information(
      title: 'Why us?',
      description:
          'Align orthotics insoles are design by professional through years of experience, trials and has proven that it reduces and prevent such pain by providing proper arch support and heel stability; hence returning the foot to its most natural position.\n\nAt Align, we provide quality foot care products, services and solutions at affordable prices for people from all walks of life.',
      imagePath: 'assets/images/sole-lution leaflet.jpg',
    ),
    Information(
      title: 'How insole can help?',
      description:
          'To help to get rid of pain such as/to relief of:\n  \u2022 Plantar fasciitis/Heel pain\n  \u2022 Knee Pain\n  \u2022 Achilles Tendonitis\n  \u2022 Back Pain\nPrevents over-pronation(foot rolling inwards)\n  \u2022 Over pronation is one of the most unnoticed and unknown conditions that leads to pain on the foot, heel, ankle, hip, lower back and/or neck.\n  \u2022 Over pronation causes irregular pressure distribution of the foot during all kind of activities. It causes all related joints such as foot, ankles, knees, hips, lower & upper spine to rotate unnaturally at the greater angle and/or incorrect directions; hence creating friction within joints that causes pain.\nCreates better posture, alignment and balance\nSupport flat feet and high arches',
      imagePath: 'assets/images/7.jpg',
    ),
    // Information(
    //   title: 'Features and\nbenefits of our sole',
    //   description:
    //       '  \u2022 Deep heel cup - For stability and balancing\n  \u2022 Plantar Groove – To relieve plantar fascia pressure\n  \u2022 Base – High density EVA material for greater support and durability\n  \u2022 Top Cover – Infused with fine infrared to improve blood circulation and anti-bacterial',
    //   imagePath: 'assets/images/product_benefits.jpg',
    //   imageWidth: isWebMobile ? 85.w : 28.w,
    // ),
    // Information(
    //   title: 'Insole Size Chart',
    //   description: 'Product Size ?\nYes, we are applying UK size as feet standard',
    //   imagePath: 'assets/images/size-UK.jpg',
    // ),
    Information(
      title: 'Products Guarantee',
      description:
          'At Align, we provide guaranteed results and customer satisfaction. Our insole products come with a 100% satisfaction guarantee. You can send them back for a full refund if you are not completely impressed. We know you will love them though because thousands of people already use them and rave about the results.',
      imagePath: 'assets/images/guarantee.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return isWebMobile ? mobileView() : webView();
  }

  Widget mobileView() {
    return Column(
      children: [
        const AppPadding().vertical(),
        for (int index = 0; index < infoList.length; index++) informationCard(index),
      ],
    );
  }

  Widget webView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AppPadding().vertical(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  for (int index = 0; index < infoList.length; index++)
                    if (index % 2 == 0) informationCard(index),
                ],
              ),
              Column(
                children: [
                  for (int index = 0; index < infoList.length; index++)
                    if (index % 2 == 1) informationCard(index),
                ],
              ),
            ],
          ),
          const AppPadding(denominator: 1 / 3).vertical(),
        ],
      ),
    );
  }

  Widget informationCard(int index) {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: screenPadding / 2, vertical: screenPadding / 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.4),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: isWebMobile ? 98.w : 30.w),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenPadding / 2, vertical: screenPadding / 2),
                child: SelectableTextWidget(
                  text: infoList[index].title,
                  textStyle: Theme.of(context)
                      .textTheme
                      .headline1!
                      .apply(fontWeightDelta: isWebMobile ? 2 : 3, fontSizeDelta: isWebMobile ? 17.sp : 4.5),
                ),
              ),
              Container(
                color: const Color.fromRGBO(64, 224, 208, 1),
                margin: EdgeInsets.symmetric(horizontal: isWebMobile ? screenPadding : screenPadding / 2),
                width: 20.w,
                height: 5,
              ),
              Container(
                width: isWebMobile ? 98.w : 30.w,
                padding: EdgeInsets.symmetric(
                    horizontal: isWebMobile ? screenPadding : screenPadding / 2, vertical: screenPadding / 2),
                child: SelectableTextWidget(
                  text: infoList[index].description,
                  textStyle: Theme.of(context).textTheme.bodyText1!.apply(fontSizeDelta: isWebMobile ? 13.sp : 2),
                ),
              ),
            ],
          ),
          const AppPadding().vertical(),
          isWebMobile
              ? Image(
                  image: AssetImage(infoList[index].imagePath),
                  fit: BoxFit.fitWidth,
                  width: infoList[index].imageWidth ?? 60.w,
                )
              : Image(
                  image: AssetImage(infoList[index].imagePath),
                  fit: BoxFit.fitWidth,
                  width: infoList[index].imageWidth ?? 20.w,
                ),
          const AppPadding().vertical(),
        ],
      ),
    );
  }
}

class Information {
  final String title;
  final String description;
  final String imagePath;
  final double? imageWidth;

  Information({
    required this.title,
    required this.description,
    required this.imagePath,
    this.imageWidth,
  });
}
