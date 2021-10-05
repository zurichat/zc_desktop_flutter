import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';

import '../const_text_styles.dart';
import '../const_ui_helpers.dart';

class BuildSuggestionContainer extends StatelessWidget {
  final String displayName;
  final String displayPicture;
  final bool isActive;
  final String bio;
  const BuildSuggestionContainer(
      {Key? key,
      required this.displayName,
      required this.displayPicture,
      this.bio = '',
      this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kcDisplayChannelColor4)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              displayPicture,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          verticalSpaceSmall,
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                Text(
                  displayName,
                  softWrap: true,
                  style: subtitlec2.copyWith(color: kcDisplayChannelColor),
                ),
                horizontalSpaceSmall,
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: isActive ? whiteColor :searchBarColor),
                    color: isActive ? kcPrimaryColor : kcBackgroundColor2,
                  ),
                )
              ],
            ),
          ),
          verticalSpaceTinyThree,
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                bio,
                softWrap: true,
                style: subtitlec2.copyWith(color: kcDisplayChannelColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
