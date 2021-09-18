import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/enums/button_type_enum.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';

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
    height: model.isClicked ? 400.h : 514.h,
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
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            'Give feedback ',
            style: TextStyle(
              color: avatarColor4,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Lato',
            ),
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
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            'learn more',
            style: TextStyle(
              color: avatarColor4,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Lato',
            ),
          ),
        ),
      ],
    ),
  );
}

recentSearchListTile(String? text) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: Container(
      margin: EdgeInsets.only(left: 65.w, right: 10.w),
      child: Material(
        child: ListTile(
          hoverColor: kcSecondaryColor,
          tileColor: whiteColor,
          onTap: () {},
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
      ),
    ),
  );
}

lookingForWidget({
  @required String? text,
}) {
  return Container(
    height: 18.h,
    width: 300.w,
    margin: EdgeInsets.only(left: 65.w, top: 18.h, right: 708.w, bottom: 13.h),
    child: Text(
      text!,
      style: leftSideBarStyle,
    ),
  );
}

searchButtons(
    {@required String? assetPath,
    @required String? buttonText,
    @required ButtonType? buttonType,
    SearchModalViewmodel? model}) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: ElevatedButton.icon(
      onPressed: () {
        model!.toggleButtonClicked();
        if (model.isClicked == true) {
          model.toggleSwap();
          if (buttonType == ButtonType.CHANNELS) {
            model.buttonType = ButtonType.CHANNELS;
            model.getTextAndHintText();
          }
          if (buttonType == ButtonType.FILE) {
            model.buttonType = ButtonType.FILE;
            model.getTextAndHintText();
          }
          if (buttonType == ButtonType.PEOPLE) {
            model.buttonType = ButtonType.PEOPLE;
            model.getTextAndHintText();
          }
          if (buttonType == ButtonType.MESSAGE) {
            model.buttonType = ButtonType.MESSAGE;
            model.getTextAndHintText();
          }
        }
      },
      icon: SvgPicture.asset(assetPath!),
      label: Text(
        buttonText!,
        style: TextStyle(
          fontFamily: 'Lato',
          fontWeight: FontWeight.w500,
          fontSize: 18.sp,
          color: bodyColor,
        ),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.hovered)) return kcSecondaryColor;
        return avatarColor4;
      })),
    ),
  );
}

buildSearchWidget(SearchModalViewmodel model) {
  return Container(
    height: model.isClicked ? 350.h : 464.h,
    width: 1008.w,
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
      color: lightIconColor,
      width: 1.h,
    ))),
    child: Column(
      children: [
        searchWidget(model),
        scrollableView(model),
      ],
    ),
  );
}

scrollableView(SearchModalViewmodel model) {
  return Container(
    height: model.isClicked ? 285.h : 406.5.h,
    width: 1008.w,
    padding: EdgeInsets.only(top: 30.5.h),
    child: Scrollbar(
      controller: model.scrollbarController,
      isAlwaysShown: true,
      child: SingleChildScrollView(
        controller: model.scrollbarController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            model.isClicked
                ? Visibility(
                    visible: false,
                    child: Container(
                      height: 54.h,
                      width: 902.57.w,
                      margin: EdgeInsets.only(top: 10.h),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 65.w),
                              child: SvgPicture.asset(
                                  'assets/icons/align_left.svg')),
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
                  )
                : Container(
                    height: 54.h,
                    width: 902.57.w,
                    margin: EdgeInsets.only(top: 10.h),
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 65.w),
                            child: SvgPicture.asset(
                                'assets/icons/align_left.svg')),
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
            model.isClicked
                ? Visibility(
                    visible: false,
                    child: lookingForWidget(text: 'I’m looking for...'),
                  )
                : lookingForWidget(text: 'I’m looking for...'),
            model.isClicked
                ? Visibility(
                    visible: false,
                    child: Container(
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
                            buttonType: ButtonType.MESSAGE,
                            model: model,
                          ),
                          SizedBox(
                            width: 19.w,
                          ),
                          searchButtons(
                            assetPath: 'assets/icons/layers.svg',
                            buttonText: 'Files',
                            buttonType: ButtonType.FILE,
                            model: model,
                          ),
                          SizedBox(
                            width: 19.w,
                          ),
                          searchButtons(
                            assetPath: 'assets/icons/hash.svg',
                            buttonText: 'Channels',
                            buttonType: ButtonType.CHANNELS,
                            model: model,
                          ),
                          SizedBox(
                            width: 19.w,
                          ),
                          searchButtons(
                              assetPath: 'assets/icons/users.svg',
                              buttonText: 'People',
                              buttonType: ButtonType.PEOPLE,
                              model: model),
                        ],
                      ),
                    ),
                  )
                : Container(
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
                          buttonType: ButtonType.MESSAGE,
                          model: model,
                        ),
                        SizedBox(
                          width: 19.w,
                        ),
                        searchButtons(
                          assetPath: 'assets/icons/layers.svg',
                          buttonText: 'Files',
                          buttonType: ButtonType.FILE,
                          model: model,
                        ),
                        SizedBox(
                          width: 19.w,
                        ),
                        searchButtons(
                          assetPath: 'assets/icons/hash.svg',
                          buttonText: 'Channels',
                          buttonType: ButtonType.CHANNELS,
                          model: model,
                        ),
                        SizedBox(
                          width: 19.w,
                        ),
                        searchButtons(
                            assetPath: 'assets/icons/users.svg',
                            buttonText: 'People',
                            buttonType: ButtonType.PEOPLE,
                            model: model),
                      ],
                    ),
                  ),
            lookingForWidget(
                text: model.isClicked
                    ? 'Recent Searches in ${model.text}'
                    : 'Recent Searches'),
            recentSearchListTile('Adema'),
            recentSearchListTile('Adema'),
            recentSearchListTile('Adema'),
            recentSearchListTile('Adema'),
          ],
        ),
      ),
    ),
  );
}

searchWidget(SearchModalViewmodel model) {
  return Container(
    height: 56.5.h,
    width: 1008.w,
    padding: EdgeInsets.only(
        left: model.isClicked ? 20.w : 65.w,
        right: 45.w,
        top: model.isClicked ? 10.h : 17.h,
        bottom: model.isClicked ? 10.h : 15.h),
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
      color: lightIconColor,
      width: 1.h,
    ))),
    child: Row(
      children: [
        model.isClicked
            ? MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  height: 49.h,
                  width: 140.w,
                  padding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: avatarColor4,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        model.text,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'Lato',
                          color: bodyColor,
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            model.toggleButtonClicked();
                            model.toggleSwap();
                          },
                          child: SvgPicture.asset('assets/icons/cancel.svg')),
                    ],
                  ),
                ),
              )
            : SvgPicture.asset('assets/icons/search.svg'),
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
              hintText: model.isClicked
                  ? model.hintText
                  : 'Scour your archives and fish out the answers',
              hintStyle: TextStyle(
                color: leftNavBarColor,
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        GestureDetector(
            child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: SvgPicture.asset('assets/icons/cancel.svg')),
            onTap: () {
              model.popDialog();
            }),
      ],
    ),
  );
}
