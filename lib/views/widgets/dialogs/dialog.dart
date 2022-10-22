import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jane_solution/config/color.dart';
import 'package:jane_solution/config/size.dart';

class PopUpMessage {
  void dialogBox({
    required BuildContext context,
    String type = 'default',
    String title = '',
    required String dialogText,
    bool enableButton = true,
    String buttonText = 'Okay',
    color = 'default',
    closeApp = false,
    Function? redirectNavigation,
  }) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () {
          (closeApp) ? onWillPop() : redirectNavigation!();
          return Future.value(true);
        },
        child: SimpleDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          backgroundColor: Colors.white,
          title: (type == 'default')
              ? Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1!.apply(fontSizeDelta: textSize),
                )
              : ElasticIn(
                  child: Image(
                    image: (type == 'success')
                        ? const AssetImage('assets/icons/alert-message/success.png')
                        : const AssetImage('assets/icons/alert-message/warning.png'),
                    width: screenWidth * 0.25,
                    height: screenWidth * 0.25,
                  ),
                ),
          children: <Widget>[
            SimpleDialogOption(
              child: Center(
                child: Text(
                  dialogText,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2!.apply(fontSizeDelta: textSize),
                ),
              ),
            ),
            if (enableButton)
              SimpleDialogOption(
                child: Container(
                  margin: EdgeInsets.fromLTRB(screenPadding * 2, 0, screenPadding * 2, 0),
                  child: ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style,
                    onPressed: () => redirectNavigation!(),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        gradient: LinearGradient(colors: colorOptions(color)),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            buttonText,
                            style: Theme.of(context).textTheme.button!.apply(
                                  fontSizeDelta: textSize,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void cupertinoDialogBox(
      {required BuildContext context,
      String title = '',
      required String dialogText,
      String buttonText = 'Okay',
      color = 'default',
      closeApp = false,
      required Function redirectNavigation}) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () {
          onWillPop();
          redirectNavigation();
          return Future.value(true);
        },
        child: CupertinoAlertDialog(
          title: Text(title),
          content: Text(dialogText),
          actions: [
            CupertinoDialogAction(
              child: Text(
                buttonText,
              ),
              onPressed: () {
                redirectNavigation();
              },
            )
          ],
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    EasyLoading.dismiss();
    DateTime? currentBackPressTime;
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;

      Fluttertoast.showToast(
          msg: "Press back again to exit",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color(0xFF5c5c5c),
          textColor: Colors.white,
          fontSize: 15.0);

      return Future.value(false);
    }
    return Future.value(true);
  }
}
