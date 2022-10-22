import 'package:flutter/material.dart';
import 'package:jane_solution/config/color.dart';

class InputFieldAttribute {
  BuildContext context;
  TextEditingController controller;
  String labelText;
  String hintText;
  bool isEditable;
  bool isNumber;
  bool isCurrency;
  bool isDropDown;
  String errorMessage;
  String prefixText;
  int lineNumber;
  int maxCharacter;
  Color isEditableColor;
  Color uneditableColor;

  InputFieldAttribute({
    required this.context,
    required this.controller,
    this.labelText = '',
    this.hintText = '',
    this.isEditable = true,
    this.isNumber = false,
    this.isCurrency = false,
    this.isDropDown = false,
    this.prefixText = '',
    this.errorMessage = '',
    this.lineNumber = 1,
    this.maxCharacter = 255,
    this.isEditableColor = textFormFieldEditableColor,
    this.uneditableColor = textFormFieldUneditableColor,
  });
}
