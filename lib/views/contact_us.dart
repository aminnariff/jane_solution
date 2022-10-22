import 'package:flutter/material.dart';
import 'package:jane_solution/config/platform.dart';
import 'package:jane_solution/config/size.dart';
import 'package:jane_solution/views/widgets/app_padding.dart';
import 'package:jane_solution/views/widgets/text_field/input_field.dart';
import 'package:jane_solution/views/widgets/text_field/input_field_attribute.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsToday extends StatefulWidget {
  const ContactUsToday({super.key});

  @override
  State<ContactUsToday> createState() => _ContactUsTodayState();
}

class _ContactUsTodayState extends State<ContactUsToday> {
  List<InputFieldAttribute> inputList = [];
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  void initState() {
    inputList.add(
      InputFieldAttribute(
        context: context,
        controller: TextEditingController(),
        labelText: 'Email',
      ),
    );
    inputList.add(
      InputFieldAttribute(
        context: context,
        controller: TextEditingController(),
        labelText: 'Name',
      ),
    );
    inputList.add(
      InputFieldAttribute(
        context: context,
        controller: TextEditingController(),
        labelText: 'Subject',
      ),
    );
    inputList.add(
      InputFieldAttribute(
        context: context,
        controller: TextEditingController(),
        labelText: 'Message',
        lineNumber: 5,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isWebMobile ? mobileView() : webView();
  }

  Widget mobileView() {
    return const SizedBox();
    return SizedBox(
      width: 60.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppPadding(denominator: 1 / 2).vertical(),
          Text(
            'Contact Us Today',
            style: Theme.of(context).textTheme.headline1!.apply(fontSizeDelta: 5.5.sp),
          ),
          const AppPadding().vertical(),
          Column(
            children: [
              for (InputFieldAttribute item in inputList)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.labelText,
                      style: Theme.of(context).textTheme.bodyText1!.apply(fontWeightDelta: 1),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: screenPadding / 2),
                      width: 25.w,
                      child: InputField().textInputForm(item),
                    ),
                  ],
                ),
              const AppPadding().vertical(),
              ElevatedButton(
                onPressed: () {
                  sendEmail();
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
                      EdgeInsets.symmetric(horizontal: screenPadding * 2, vertical: screenPadding / 1.7)),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 4.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const AppPadding().vertical(),
        ],
      ),
    );
  }

  Widget webView() {
    return SizedBox(
      width: 60.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppPadding(denominator: 1 / 2).vertical(),
          Text(
            'Contact Us Today',
            style: Theme.of(context).textTheme.headline1!.apply(fontSizeDelta: 5.5.sp),
          ),
          const AppPadding().vertical(),
          Row(
            children: [
              SizedBox(
                width: 30.w,
                child: Icon(
                  Icons.abc_sharp,
                  size: 50.sp,
                ),
              ),
              const AppPadding(),
              Column(
                children: [
                  for (InputFieldAttribute item in inputList)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.labelText,
                          style: Theme.of(context).textTheme.bodyText1!.apply(fontWeightDelta: 1),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: screenPadding / 2),
                          width: 25.w,
                          child: InputField().textInputForm(item),
                        ),
                      ],
                    ),
                  const AppPadding().vertical(),
                  ElevatedButton(
                    onPressed: () {
                      sendEmail();
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
                          EdgeInsets.symmetric(horizontal: screenPadding * 2, vertical: screenPadding / 1.7)),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 4.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const AppPadding().vertical(),
        ],
      ),
    );
  }

  void sendEmail() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'amin.mohdariff@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': inputList.where((element) => element.labelText == 'Subject').first.controller.text,
        'body': inputList.where((element) => element.labelText == 'Message').first.controller.text,
      }),
    );
    launchUrl(emailLaunchUri);
  }
}
