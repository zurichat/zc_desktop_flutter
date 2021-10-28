import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/core/enums/button_type_enum.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';

import 'search_modal_viewmodel.dart';

class SearchModalView extends StatelessWidget {
  const SearchModalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      builder: (context, model, _) => Align(
        alignment: Alignment.topCenter,
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
          child: BuildContainerWidget(
            model: model,
          ),
        ),
      ),
      onDispose: (model) => model.saveSearch(),
      onModelReady: (model) => model.fetchAndSetSearchHistory(),
      viewModelBuilder: () => SearchViewModel(),
    );
  }
}

class BuildContainerWidget extends StatelessWidget {
  BuildContainerWidget({
    Key? key,
    this.model,
  }) : super(key: key);

  final SearchViewModel? model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: model!.isClicked ? 400.h : 514.h,
      width: 1008.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BuildSearchWidget(
            model: model,
          ),
         // bottomText(),
        ],
      ),
    );
  }
}

bottomText() {
  return Container(
    height: 50.h,
    width: 1008.w,
    padding: EdgeInsets.only(left: 400.w, right: 50.w, top: 11.h, bottom: 21.h),
    child: Wrap(
      children: [
        Text(
          ButtonText5,
          style: preferenceStyleNormal,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(ButtonText6, style: searchModal),
        ),
        Text(
          ButtonText7,
          style: preferenceStyleNormal,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(ButtonText8, style: searchModal),
        ),
      ],
    ),
  );
}

recentSearchListTile(String? text, {VoidCallback? function}) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: Container(
      margin: EdgeInsets.only(left: 65.w, right: 10.w),
      child: Material(
        child: ListTile(
          hoverColor: kcSecondaryColor,
          //tileColor: whiteColor,
          onTap: function,
          leading: SvgPicture.asset(Clock, width: 18.w, height: 18.h),
          title: Text(text!, style: searchModal1),
        ),
      ),
    ),
  );
}

lookingForWidget({
  @required String? text,
}) {
  return Container(
    height: 22.h,
    width: 300.w,
    margin: EdgeInsets.only(left: 65.w, top: 16.h, right: 708.w, bottom: 13.h),
    child: Text(text!, style: preferenceStyleNormal),
  );
}

searchButtons(
    {@required String? assetPath,
    @required String? buttonText,
    @required ButtonType? buttonType,
    SearchViewModel? model}) {
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
      label: Text(buttonText!, style: searchModal2),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.hovered)) return kcSecondaryColor;
        return avatarColor4;
      })),
    ),
  );
}

class BuildSearchWidget extends StatelessWidget {
  BuildSearchWidget({
    Key? key,
    this.model,
  }) : super(key: key);

  final SearchViewModel? model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: model!.isClicked ? 350.h : 464.h,
      width: 1008.w,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: lightIconColor,
        width: 1.h,
      ))),
      child: Stack(
        children: [
          Positioned(
            top: 30.h,
            child: ScrollableView(),
          ),
          SearchWidget(),
        ],
      ),
    );
  }
}

class ScrollableView extends HookViewModelWidget<SearchViewModel> {
  const ScrollableView({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(BuildContext context, SearchViewModel model) {
    var scrollController = useScrollController();

    return Container(
      height: model.isClicked ? 285.h : 406.5.h,
      width: 1008.w,
      padding: EdgeInsets.only(top: 30.5.h),
      child: Scrollbar(
        controller: scrollController,
        isAlwaysShown: true,
        child: SingleChildScrollView(
          controller: scrollController,
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
                                child: SvgPicture.asset(AlignLeft)),
                            SizedBox(
                              width: 23.w,
                            ),
                            Expanded(
                              child: TextField(
                                maxLines: 1,
                                style: searchModal4,
                                decoration: InputDecoration(
                                  hintText: SearchModalHintText,
                                  hintStyle: searchModal3,
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
                              child: SvgPicture.asset(AlignLeft)),
                          SizedBox(width: 23.w),
                          Expanded(
                            child: TextField(
                              maxLines: 1,
                              style: searchModal4,
                              decoration: InputDecoration(
                                hintText: SearchModalHintText,
                                hintStyle: searchModal3,
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
                      child: lookingForWidget(text: LookingForWidget),
                    )
                  : lookingForWidget(text: LookingForWidget),
              model.isClicked
                  ? Visibility(
                      visible: false,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        padding: EdgeInsets.only(
                          left: 65.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            searchButtons(
                              assetPath: Circle,
                              buttonText: ButtonText,
                              buttonType: ButtonType.MESSAGE,
                              model: model,
                            ),
                            // SizedBox(width: 19.w),
                            // searchButtons(
                            //   assetPath: Layers,
                            //   buttonText: ButtonText2,
                            //   buttonType: ButtonType.FILE,
                            //   model: model,
                            // ),
                            SizedBox(width: 19.w),
                            searchButtons(
                              assetPath: Hash,
                              buttonText: ButtonText4,
                              buttonType: ButtonType.CHANNELS,
                              model: model,
                            ),
                            // SizedBox(width: 19.w),
                            // searchButtons(
                            //     assetPath: Users,
                            //     buttonText: ButtonText3,
                            //     buttonType: ButtonType.PEOPLE,
                            //     model: model),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      padding: EdgeInsets.only(
                        left: 65.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          searchButtons(
                            assetPath: Circle,
                            buttonText: ButtonText,
                            buttonType: ButtonType.MESSAGE,
                            model: model,
                          ),
                          // SizedBox(width: 19.w),
                          // searchButtons(
                          //   assetPath: Layers,
                          //   buttonText: ButtonText2,
                          //   buttonType: ButtonType.FILE,
                          //   model: model,
                          // ),
                          SizedBox(width: 19.w),
                          searchButtons(
                            assetPath: Hash,
                            buttonText: ButtonText4,
                            buttonType: ButtonType.CHANNELS,
                            model: model,
                          ),
                          // SizedBox(width: 19.w),
                          // searchButtons(
                          //     assetPath: Users,
                          //     buttonText: ButtonText3,
                          //     buttonType: ButtonType.PEOPLE,
                          //     model: model),
                        ],
                      ),
                    ),
              lookingForWidget(
                  text: model.isClicked
                      ? 'Recent Searches in ${model.text}'
                      : RecentSearch),
              Container(
                height: 362.h,
                width: 350.w,
                child: ListView.builder(
                    itemCount: model.historyLenth,
                    itemBuilder: (context, index) =>
                        recentSearchListTile(model.searchHistory[index])),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchWidget extends HookViewModelWidget<SearchViewModel> {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(BuildContext context, SearchViewModel model) {
    final text = useTextEditingController();

    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              model.isClicked
                  ? MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        height: 49.h,
                        width: 140.w,
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 8.5.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: avatarColor4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(model.text, style: preferenceStyleNormal),
                            GestureDetector(
                                onTap: () {
                                  model.toggleButtonClicked();
                                  model.toggleSwap();
                                  text.clear();
                                  model.toggleTextFieldActivated();
                                },
                                child: SvgPicture.asset(Cancel)),
                          ],
                        ),
                      ),
                    )
                  : SvgPicture.asset(Search, width: 15.w, height: 15.h),
              SizedBox(width: 10.w),
              Expanded(
                child: TextField(
                  controller: text,
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  style: searchModal4,
                  onChanged: model.onChange,
                  decoration: InputDecoration(
                    hintText:
                        model.isClicked ? model.hintText : SearchModalHintText1,
                    hintStyle: preferenceStyleNormal,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              GestureDetector(
                  child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: SvgPicture.asset(Cancel)),
                  onTap: () {
                    Navigator.pop(context, true);
                  }),
            ],
          ),
        ),
        !model.textFieldActivated
            ? SizedBox(
                height: 0.h,
                width: 0.h,
              )
            : Container(
                height: model.isClicked ? 270.h : 350.h,
                width: 1008.w,
                child: ListView.builder(
                    itemCount: model.availableListLength,
                    itemBuilder: (context, index) {
                      if (model.searchList.length <=
                              model.availableListLength &&
                          model.searchList.isNotEmpty) {
                        return recentSearchListTile(
                            model.searchList[index].name, function: () {
                          Navigator.pop(context, true);
                          model.toggleTextFieldActivated();
                          text.clear();
                          if (model.searchList.elementAt(index).object ==
                              'dm') {
                            model.goToDmView();
                          } else if (model.searchList.elementAt(index).object ==
                              'channel') {
                            model.goToChannelsView();
                          }
                          model.searchNavigate(model.searchList[index]);
                        });
                      } else {
                        return SizedBox();
                      }
                    }),
              )
      ],
    );
  }
}
