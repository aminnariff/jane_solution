import 'package:flutter/material.dart';

const primary = Color(0XFF012869);
const primaryColors = [
  Color(0XFF23286C),
  Color(0XFF52B3E0),
];
const secondaryColor = Color(0XFFa3b7c7);

//TextFormField
const textFormFieldEditableColor = Color(0xFFEAF2FA);
const textFormFieldUneditableColor = Color(0xFFEAF2FA);

//Shimmer
const shimmerBaseColor = Color(0xFFEEEDED);
const shimmerHighlightColor = Colors.white;

//Card
const cardColor = Color(0XFFf4f5fa);
const shadow = Color(0XFFc2ddf0);

//Text
const textPrimaryColor = Color(0xff163567);
Color? textSecondaryColor = const Color(0xFF78879b);
const textTertiaryColor = Color(0XFF1C61AC);

List<Color> colorOptions(color) {
  switch (color) {
    case 'primary':
      {
        return [
          const Color(0XFF23286C),
          const Color(0XFF52B3E0),
        ];
      }

    default:
      return [
        const Color(0XFF23286C),
        const Color(0XFF52B3E0),
      ];
  }
}

Color statusColor(status) {
  switch (status) {
    case 'Completed':
      {
        return const Color(0XFF50D142);
      }

    case 'Failed':
      {
        return const Color(0XFFDF184A);
      }

    case 'Rejected':
      {
        return const Color(0XFFDF184A);
      }

    case 'Not Found':
      {
        return const Color(0XFFDF184A);
      }

    case 'Progressing':
      {
        return const Color.fromARGB(255, 222, 182, 39);
      }

    case 'Acknowledged':
      {
        return const Color.fromARGB(255, 222, 182, 39);
      }

    case 'New':
      {
        return const Color(0XFF012869);
      }

    default:
      return const Color(0XFF52B3E0);
  }
}
