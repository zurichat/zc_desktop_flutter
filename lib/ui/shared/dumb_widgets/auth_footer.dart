import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/change_region/change_region_view.dart';

import '../const_ui_helpers.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            PrivacyText,
            style: bottomTextStyle,
          ),
          horizontalSpaceMedium,
          Text(
            ContactUs,
            style: bottomTextStyle,
          ),
          horizontalSpaceMedium,
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Web),
              ),
              Text(
                ChangeRegion,
                style: bottomTextStyle,
              ),
              IconButton(
                onPressed: () => showDialog(
                    context: context, builder: (_) => ChangeRegionView()),
                icon: SvgPicture.asset(ArrowDown),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
