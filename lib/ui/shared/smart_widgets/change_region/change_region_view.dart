import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/l10n/l10n.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/change_region/change_region_viewmodel.dart';

class ChangeRegionView extends StatelessWidget {
  const ChangeRegionView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final _appLocalization = AppLocalizations.of(context)!;
    return ViewModelBuilder<ChangeRegionViewmodel>.nonReactive(
        viewModelBuilder: () => ChangeRegionViewmodel(),
        builder: (context, model, _) {
          return Padding(
            padding: EdgeInsets.only(bottom: 46.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                child: Container(
                  height: 334.h,
                  width: 774.w,
                  padding: EdgeInsets.all(32.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       _appLocalization.changeRegion,
                        style: changeRegionStyle,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                       _appLocalization.selectingRegion,
                        style: subtitlec2.copyWith(
                          color: createAccountColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            LanguageRegion(
                              AmericaText,
                              region1: LatinoText,
                              region2: BrasilText,
                              region3: USText,
                              region4: '',
                            ),
                            SizedBox(
                              width: 40.w,
                            ),
                            LanguageRegion(
                              EuropeText,
                              region1: DeutschText,
                              region2: EspanaText,
                              region3: FranceText,
                              region4: UkText,
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            LanguageRegion(
                              AsiaText,
                              region1: IndiaText,
                              region2: '',
                              region3: '',
                              region4: '',
                            ),
                            SizedBox(
                              width: 40.w,
                            ),
                            LanguageRegion(
                              MiddleEastText,
                              region1: UAEText,
                              region2: '',
                              region3: '',
                              region4: '',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class LanguageRegion extends StatelessWidget {
  const LanguageRegion(
    this.headerText, {
    this.region1,
    this.region2,
    this.region3,
    this.region4,
    Key? key,
  }) : super(key: key);

  final String? headerText;
  final String? region1;
  final String? region2;
  final String? region3;
  final String? region4;

  @override
  Widget build(BuildContext context) {
    //final locale = Localizations.localeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          headerText!,
          style: changeRegionStyle,
        ),
        //Region Texts e.g Arabic, hindi e.t.c
        GestureDetector(
          onTap: () {
            L10n.getTranslation(region1!);
          },
          child: Container(
            margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
            child: Text(
              region1!,
              style: regionStyle,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (region2! != '') {
              L10n.getTranslation(region2!);
            }
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10.h),
            child: Text(
              region2!,
              style: regionStyle,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (region3! != '') {
              L10n.getTranslation(region3!);
            }
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10.h),
            child: Text(
              region3!,
              style: regionStyle,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (region4! != '') {
              L10n.getTranslation(region4!);
            }
          },
          child: Text(
            region4!,
            style: regionStyle,
          ),
        ),
      ],
    );
  }
}
