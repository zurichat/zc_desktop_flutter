import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/constants/app_images.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';

class BuildStartUpImage extends StatelessWidget {
  const BuildStartUpImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        color: KStartupContainerColor,
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Image.asset(
                  CircularImage,
                ),
              ),
            ),
            Text(
              StartUpTitle,
              textAlign: TextAlign.center,
              style: headline6.copyWith(color: Colors.white),
            ),
            verticalSpaceSmall,
            Text(
              StartUpSubTitle,
              textAlign: TextAlign.center,
              style: subtitle2.copyWith(color: Colors.white),
            ),
            verticalSpaceLarge,
          ],
        ),
      ),
    );
  }
}
