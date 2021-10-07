import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';

class LeftSideContainer extends StatelessWidget {
  const LeftSideContainer({Key? key}) : super(key: key);

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
                child: Image.asset(CircularGifPath),
              ),
            ),
            Text(
              AppLocalizations.of(context)!.startUpTitleText,
              //StartUpTitleText,
              textAlign: TextAlign.center,
              style: headline6.copyWith(color: Colors.white),
            ),
            verticalSpaceSmall,
            Text(
              '${AppLocalizations.of(context)!.startUpSubtitleText1} \n ${AppLocalizations.of(context)!.startUpSubtitleText2}',
              //"$StartUpSubTitleText1 \n $StartUpSubTitleText2",
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
