import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jane_solution/config/size.dart';

@immutable
class DropDownMenu extends StatelessWidget {
  final List dropdownAttributes;
  final String? selectedValue;
  final String title;
  final bool loadingStatus;
  final bool showIcon;
  final bool isSvg;

  const DropDownMenu({
    Key? key,
    required this.dropdownAttributes,
    required this.title,
    this.selectedValue,
    required this.loadingStatus,
    required this.showIcon,
    this.isSvg = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Card(
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(screenPadding, screenPadding, screenPadding, screenPadding / 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color.fromRGBO(173, 31, 97, 1),
                        Color.fromRGBO(70, 0, 106, 1),
                      ],
                    ),
                  ),
                  child: ListTile(
                    enabled: false,
                    contentPadding: EdgeInsets.symmetric(vertical: screenPadding / 3, horizontal: 16),
                    title: Center(
                      child: Text(
                        title,
                        style:
                            Theme.of(context).textTheme.bodyText1!.apply(color: Colors.white, fontSizeDelta: textSize),
                      ),
                    ),
                  ),
                ),
                loadingStatus
                    ? ListTile(
                        enabled: false,
                        contentPadding: EdgeInsets.symmetric(vertical: screenPadding / 3, horizontal: 16),
                        title: const Center(
                          child: SpinKitRing(
                            color: Color(0xFFAD1F61),
                            size: 31.0,
                            lineWidth: 5.0,
                          ),
                        ),
                      )
                    : Flexible(child: getBody()),
              ],
            ),
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.close,
          ),
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget getBody() {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey[400],
        height: 0.3,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: dropdownAttributes.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return getLists(context, index);
      },
    );
  }

  Widget getLists(context, index) {
    return ListTileTheme(
      contentPadding: EdgeInsets.symmetric(vertical: screenPadding / 2, horizontal: 16),
      child: (dropdownAttributes[index].code == selectedValue)
          ? ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: screenPadding / 2),
              leading: (showIcon)
                  ? (isSvg)
                      ? SvgPicture.network(
                          dropdownAttributes[index].logo,
                          height: screenWidth * 0.07,
                          width: screenWidth * 0.07,
                        )
                      : CachedNetworkImage(
                          imageUrl: dropdownAttributes[index].logo,
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                              const SizedBox(height: 0, width: 0),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        )
                  : null,
              title: Text(
                dropdownAttributes[index].name,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .apply(color: const Color(0xff1C3664), fontSizeDelta: textSize),
              ),
              trailing: Icon(
                Icons.check,
                color: Colors.green,
                size: 24 + textSize,
              ),
              onTap: () {
                Navigator.pop(context, index);
              },
            )
          : ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: screenPadding / 2),
              leading: (showIcon)
                  ? (isSvg)
                      ? SvgPicture.network(
                          dropdownAttributes[index].logo,
                          height: screenWidth * 0.07,
                          width: screenWidth * 0.07,
                        )
                      : CachedNetworkImage(
                          imageUrl: dropdownAttributes[index].logo,
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                              const SizedBox(height: 0, width: 0),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        )
                  : null,
              title: Text(
                dropdownAttributes[index].name,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .apply(color: const Color(0xff1C3664), fontSizeDelta: textSize),
              ),
              onTap: () {
                Navigator.pop(context, index);
              },
            ),
    );
  }
}
