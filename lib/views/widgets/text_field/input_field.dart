import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jane_solution/config/color.dart';
import 'package:jane_solution/config/platform.dart';
import 'package:jane_solution/config/size.dart';
import 'package:jane_solution/views/widgets/text_field/input_field_attribute.dart';
import 'package:jane_solution/views/widgets/text_field/login_attribute.dart';

class InputField {
  Widget textInputForm(
    InputFieldAttribute field, {
    Function()? onChanged,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                readOnly: !field.isEditable,
                style: Theme.of(field.context).textTheme.bodyText1!.apply(color: const Color(0xff1C3664)),
                cursorColor: const Color(0xFF9b9b9b),
                keyboardType: (field.isNumber) ? TextInputType.number : TextInputType.text,
                onTap: () {
                  if (field.isDropDown) {
                    setAction(field.controller, field.context);
                  }
                },
                decoration: InputDecoration(
                  fillColor: field.isDropDown
                      ? const Color(0xFFEAF2FA)
                      : field.isEditable
                          ? field.isEditableColor
                          : field.uneditableColor,
                  filled: true,
                  suffixIcon: (field.isDropDown)
                      ? const Icon(
                          Icons.arrow_drop_down,
                          color: Color(0xff1C3664),
                        )
                      : null,
                  prefixIcon: (field.prefixText.isNotEmpty)
                      ? Padding(
                          padding: EdgeInsets.fromLTRB(screenPadding / 2, 15.0, screenPadding / 3, 15.0),
                          child: Text(
                            field.prefixText,
                            style: Theme.of(field.context).textTheme.bodyText1!.apply(color: const Color(0xff1C3664)),
                          ),
                        )
                      : null,
                  contentPadding: EdgeInsets.fromLTRB(
                      isWebMobile ? screenPadding / 2 : screenPadding / 3,
                      isWebMobile ? screenPadding / 2 : screenPadding / 3,
                      screenPadding / 3,
                      isWebMobile ? screenPadding / 2 : screenPadding / 3),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: (field.errorMessage == '')
                        ? const BorderSide(color: Colors.transparent, width: 0.0)
                        : const BorderSide(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: (field.errorMessage == '')
                        ? const BorderSide(color: Colors.transparent, width: 0.0)
                        : const BorderSide(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintStyle: Theme.of(field.context).textTheme.bodyText1!.apply(color: const Color(0xFF9D9E9E)),
                ),
                controller: field.controller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (String value) {
                  field.errorMessage = '';
                  onChanged;
                },
                inputFormatters: [
                  if (field.isCurrency) FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                  if (field.isCurrency) CurrencyTextInputFormatter(symbol: ''),
                  if (field.isNumber) FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(field.maxCharacter),
                ],
                minLines: field.lineNumber,
                maxLines: field.lineNumber,
              ),
            ),
          ],
        ),
        (field.errorMessage != '')
            ? Row(children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      field.errorMessage,
                      style: Theme.of(field.context)
                          .textTheme
                          .bodyText2!
                          .apply(color: Colors.red, fontSizeDelta: textSize),
                    ),
                  ),
                )
              ])
            : Container(),
      ],
    );
  }

  Widget auth(
    BuildContext context,
    LoginItem field, {
    Function()? obsecureAction,
    Function()? onChanged,
  }) {
    return TextFormField(
      style: Theme.of(context).textTheme.subtitle2!.apply(color: const Color(0xff1C3664), fontSizeDelta: textSize),
      cursorColor: Colors.blue,
      keyboardType: (field.attribute == 'email') ? TextInputType.emailAddress : TextInputType.text,
      obscureText: field.obscureText,
      maxLines: 1,
      decoration: InputDecoration(
        fillColor: textFormFieldEditableColor,
        filled: true,
        suffix: field.isPassword
            ? InkWell(
                onTap: obsecureAction,
                child: Icon(
                  field.obscureText ? Icons.visibility_off : Icons.visibility,
                  color: field.obscureText ? const Color(0xFFa3b7c7) : const Color(0xff163567),
                  size: 18,
                ),
              )
            : null,
        contentPadding: EdgeInsets.symmetric(horizontal: screenPadding, vertical: screenPadding / 2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: (field.errorMessage == '')
              ? const BorderSide(color: Colors.transparent, width: 0.0)
              : const BorderSide(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: (field.errorMessage == '')
              ? const BorderSide(color: Colors.transparent, width: 0.0)
              : const BorderSide(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        disabledBorder: InputBorder.none,
        errorText: (field.errorMessage != '') ? field.errorMessage : null,
        errorStyle: Theme.of(context).textTheme.caption!.apply(color: Colors.red, fontSizeDelta: textSize),
        hintText: field.hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText1!
            .apply(color: const Color(0xFFa3b7c7), fontSizeDelta: textSize, fontWeightDelta: -1),
      ),
      controller: field.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (String value) {
        field.errorMessage = '';
        onChanged;
      },
    );
  }

  void setAction(controller, BuildContext context) {
    switch (controller) {
      case 'example':
        break;
      default:
        break;
    }
  }

  void setValue(controller, value) {
    switch (controller) {
      case 'example':
        break;
      default:
        break;
    }
  }
}
