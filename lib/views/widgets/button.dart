import 'package:flutter/material.dart';
import 'package:jane_solution/config/size.dart';

class Button extends StatelessWidget {
  final Function() action;
  final String actionText;
  final double extraPaddingRatio;
  final double? height;
  final double? width;

  const Button({
    super.key,
    required this.action,
    this.actionText = 'Okay',
    this.extraPaddingRatio = 1,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return (height == null && width == null)
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: action,
                style: ElevatedButton.styleFrom(
                  elevation: 1.0,
                  padding: EdgeInsets.symmetric(
                      horizontal: screenPadding * extraPaddingRatio,
                      vertical: (screenPadding * extraPaddingRatio) / (2 + extraPaddingRatio)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    actionText,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.apply(color: Colors.white, fontSizeDelta: textSize),
                  ),
                ),
              ),
            ],
          )
        : ElevatedButton(
            onPressed: action,
            style: ElevatedButton.styleFrom(
              elevation: 1.0,
              padding: EdgeInsets.symmetric(horizontal: screenPadding * extraPaddingRatio, vertical: screenPadding / 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: Container(
              width: width,
              height: height,
              alignment: Alignment.center,
              child: Text(
                actionText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1!.apply(color: Colors.white, fontSizeDelta: textSize),
              ),
            ),
          );
  }
}
