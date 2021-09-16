import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';

import 'search_modal_viewmodel.dart';

class SearchModalView extends StatelessWidget {
  const SearchModalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SearchModalViewmodel(),
        builder: (context, model, _) => Dialog(
              child: buildModalContainer(model as SearchModalViewmodel),
            ));
  }
}

buildModalContainer(SearchModalViewmodel model) {
  return Container(
    height: 514.h,
    width: 1008.w,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildSearchWidget(model),
        bottomText(),
      ],
    ),
  );
}

bottomText() {
  return Container(
    height: 50.h,
    width: 1008.w,
    padding: EdgeInsets.only(left: 540.w, right: 50.w, top: 11.h, bottom: 21.h),
    child: Wrap(
      children: [
        Text(
          'Not the results that you expected? ',
          style: TextStyle(
            color: lightIconColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Lato',
          ),
        ),
        Text(
          'Give feedback ',
          style: TextStyle(
            color: avatarColor4,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Lato',
          ),
        ),
        Text(
          'or ',
          style: TextStyle(
            color: lightIconColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Lato',
          ),
        ),
        Text(
          'learn more',
          style: TextStyle(
            color: avatarColor4,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Lato',
          ),
        ),
      ],
    ),
  );
}

recentSearchListTile(String? text) {
  return Container(
    margin: EdgeInsets.only(left: 65.w),
    child: ListTile(
      onTap: null,
      leading: SvgPicture.asset('assets/icons/clock.svg'),
      title: Text(
        text!,
        style: TextStyle(
          color: headerColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          fontFamily: 'Lato',
        ),
      ),
    ),
  );
}

lookingForWidget({
  @required String? text,
}) {
  return Container(
    height: 18.h,
    width: 108.w,
    margin: EdgeInsets.only(left: 65.w, top: 18.h, right: 820.w, bottom: 13.h),
    child: Text(
      text!,
      style: leftSideBarStyle,
    ),
  );
}

searchButtons({
  @required String? assetPath,
  @required String? buttonText,
}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      decoration: BoxDecoration(
        color: avatarColor4,
        borderRadius: BorderRadius.circular(5.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 10.5.h, horizontal: 23.5.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(assetPath!),
          SizedBox(
            width: 11.w,
          ),
          Text(buttonText!,
              style: TextStyle(
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                color: bodyColor,
              )),
        ],
      ),
    ),
  );
}

buildSearchWidget(SearchModalViewmodel model) {
  return Container(
    height: 464.h,
    width: 1008.w,
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
      color: lightIconColor,
      width: 1.h,
    ))),
    child: Column(
      children: [
        searchWidget(),
        scrollableView(model),
      ],
    ),
  );
}

scrollableView(SearchModalViewmodel model) {
  return Container(
    height: 406.5.h,
    width: 1008.w,
    padding: EdgeInsets.only(top: 30.5.h, bottom: 20.h),
    child: Scrollbar(
      controller: model.scrollbarController,
      isAlwaysShown: true,
      child: SingleChildScrollView(
        controller: model.scrollbarController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 54.h,
              width: 902.57.w,
              margin: EdgeInsets.only(top: 10.h),
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 65.w),
                      child: SvgPicture.asset('assets/icons/align_left.svg')),
                  SizedBox(
                    width: 23.w,
                  ),
                  Expanded(
                    child: TextField(
                      maxLines: 1,
                      style: TextStyle(
                        color: bodyColor,
                        fontSize: 18.sp,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Find in direct messages with rafiu',
                        hintStyle: TextStyle(
                          color: bodyColor,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            lookingForWidget(text: 'I’m looking for...'),
            Container(
              margin: EdgeInsets.only(bottom: 39.h),
              padding: EdgeInsets.only(
                left: 65.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  searchButtons(
                    assetPath: 'assets/icons/message_circle.svg',
                    buttonText: 'Messages',
                  ),
                  SizedBox(
                    width: 19.w,
                  ),
                  searchButtons(
                    assetPath: 'assets/icons/layers.svg',
                    buttonText: 'Files',
                  ),
                  SizedBox(
                    width: 19.w,
                  ),
                  searchButtons(
                    assetPath: 'assets/icons/hash.svg',
                    buttonText: 'Channels',
                  ),
                  SizedBox(
                    width: 19.w,
                  ),
                  searchButtons(
                    assetPath: 'assets/icons/users.svg',
                    buttonText: 'People',
                  ),
                ],
              ),
            ),
            lookingForWidget(text: 'Recent Searches'),
            recentSearchListTile('Adema'),
            recentSearchListTile('Adema'),
            recentSearchListTile('Adema'),
          ],
        ),
      ),
    ),
  );
}

searchWidget() {
  return Container(
    height: 56.5.h,
    width: 1008.w,
    padding: EdgeInsets.only(left: 65.w, right: 45.w, top: 17.h, bottom: 15.h),
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
      color: lightIconColor,
      width: 1.h,
    ))),
    child: Row(
      children: [
        SvgPicture.asset('assets/icons/search.svg'),
        Expanded(
          child: TextField(
            textAlign: TextAlign.left,
            maxLines: 1,
            style: TextStyle(
              color: headerColor,
              fontSize: 18.sp,
            ),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: 31.w, top: 17.h, bottom: 16.h),
              hintText: 'Scour your archives and fish out the answers',
              hintStyle: TextStyle(
                color: leftNavBarColor,
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        SvgPicture.asset('assets/icons/cancel.svg'),
      ],
    ),
  );
}
