// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
//import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
//import 'package:zc_desktop_flutter/ui/shared/smart_widgets/bookmark_and_pinned_bar/bookmark_and_pinned_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/views/main/dm/dm_viewmodel.dart';

import '../../const_text_styles.dart';
import '../../const_widgets.dart';

class BookmarkAndPinnedMessagesView extends StatelessWidget {
  final DmViewModel dmViewModel;
  BookmarkAndPinnedMessagesView({required this.dmViewModel}) : super();

  final GlobalKey actionKey = GlobalKey();
  late double height, width, xPosition, yPosition;
  late OverlayEntry _floatingDropdown;
  late OverlayEntry _floatingPinnedMessagesDropDown;

  get floatingPinnedMessagesDropDown => floatingPinnedMessagesDropDown;
  get floatingDropDown => _floatingDropdown;

  OverlayEntry _buildFloatingDropdown() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        left: 98.w,
        //width: 282.w,
        //height: 200.h,
        top: 96.h,
        child: Container(
          child: Material(
            elevation: 0.0,
            child: InkWell(
              onTap: () {
                _toggleDropdownForAddBookmark(close: true, context: context);
              },
              child: DropDown(
                context,
                onPress: () {
                  _toggleDropdownForAddBookmark(close: true, context: context);
                },
              ),
            ),
          ),
        ),
      );
    });
  }

  OverlayEntry _buildDropDownForPinnedMessages(DmViewModel model) {
    return OverlayEntry(builder: (context) {
      return Positioned(
        left: 10.w,
        //width: 282.w,
        //height: 200.h,
        top: 96.h,
        child: Container(
          child: Material(
            child: InkWell(
              onTap: () {
                _toggleDropDownForPinnedMessages(
                    isClosed: true, context: context, model: model);
              },
              child: DropDownForPinnedMessages(
                onPressed: () {
                  _toggleDropDownForPinnedMessages(
                      isClosed: true, context: context, model: model);
                },
              ),
            ),
          ),
        ),
      );
    });
  }

  _toggleDropdownForAddBookmark({
    bool close = false,
    required BuildContext context,
  }) async {
    if (dmViewModel.isDropped || close) {
      this._floatingDropdown.remove();
      dmViewModel.setIsDropped(false);
    } else {
      this._floatingDropdown = this._buildFloatingDropdown();
      Overlay.of(context)!.insert(this._floatingDropdown);
      dmViewModel.setIsDropped(true);
    }
  }

  _toggleDropDownForPinnedMessages({
    bool isClosed = false,
    required BuildContext context,
    required DmViewModel model,
  }) async {
    if (isClosed || model.isDropped) {
      this._floatingPinnedMessagesDropDown.remove();
      model.setIsDropped(false);
    } else {
      this._floatingPinnedMessagesDropDown =
          this._buildDropDownForPinnedMessages(model);
      Overlay.of(context)!.insert(this._floatingPinnedMessagesDropDown);
      model.setIsDropped(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RowActions(context);
  }

  RowActions(BuildContext context) {
    return ViewModelBuilder<DmViewModel>.reactive(
        builder: (context, model, child) => Container(
              color: kcPrimaryLight,
              child: Row(
                children: [
                  //Original Pinned Icon
                  Visibility(
                    visible: dmViewModel.isMessagePinned,
                    child: RowActionItem(
                      tip: 'Pinned Items',
                      label: '${dmViewModel.pinnedMessages.length} Pinned',
                      icon: SVGAssetPaths.pinnedIcon,
                      onClicked: () {
                        //dmViewModel.onPinnedMessage(false);
                        //dmViewModel.displayDecoyForPinnedMessage(true);
                        log('Pinned messages clicked');
                        _toggleDropdownForAddBookmark(
                            close: true, context: context);
                        _toggleDropDownForPinnedMessages(
                            context: context, model: model);
                      },
                    ),
                  ),
                  //Decoy Pinned items button
                  Visibility(
                    visible: dmViewModel.isDecoyForPinnedMessageVisible,
                    child: RowActionItem(
                      tip: 'Pinned Items',
                      label: 'close',
                      icon: SVGAssetPaths.pinnedIcon,
                      onClicked: () {
                        dmViewModel.onPinnedMessage(true);
                        dmViewModel.displayDecoyForPinnedMessage(false);
                        _toggleDropdownForAddBookmark(
                            close: true, context: context);
                        _toggleDropDownForPinnedMessages(
                            context: context, model: model);
                      },
                    ),
                  ),
                  BookMarkedItem(
                      tip: 'www.zurichat.com',
                      label: 'zurichat',
                      icon: SVGAssetPaths.linkIcon,
                      onClicked: () {
                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                  child: ActionsBookmarkDialog(context),
                                ));
                      }),
                  /* Visibility(
                    visible: dmViewModel.isOriginalBookmarkVisible,
                    child: RowActionItem(
                      //2
                      tip: 'Bookmark a link',
                      label: 'Add a bookmark',
                      icon: SVGAssetPaths.addIcon,
                      onClicked: () {
                        _toggleDropdownForAddBookmark(
                            context: context, close: false);
                        _toggleDropDownForPinnedMessages(
                            context: context, model: model);
                        dmViewModel.onPinnedMessage(true);
                        dmViewModel.displayDecoyForAddBookmark(true);
                        dmViewModel.displayOriginalBookmark(false);
                        log('Add to bookmarks clicked');
                      },
                    ),
                  ), */
                  //Decoy Button=> closes the overlay
                  /* Visibility(
                    visible: dmViewModel.isBookmarkDecoyVisible,
                    child: RowActionItem(
                      //Decoy
                      tip: 'Bookmark a link',
                      label: 'Add a bookmark',
                      icon: SVGAssetPaths.addIcon,
                      onClicked: () {
                        dmViewModel.displayDecoyForAddBookmark(false);
                        dmViewModel.displayOriginalBookmark(true);
                        _toggleDropdownForAddBookmark(
                            context: context, close: true);
                        _toggleDropDownForPinnedMessages(
                            context: context, model: dmViewModel);
                        dmViewModel.onPinnedMessage(true);
                        log('Add to bookmarks clicked');
                      },
                    ),
                  ), */
                ],
              ),
            ),
        viewModelBuilder: () => DmViewModel());
  }

  RowActionItem({
    required final String icon,
    required final String label,
    required final String tip,
    VoidCallback? onClicked,
  }) =>
      Tooltip(
        message: tip,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: onClicked,
            child: Container(
              height: 30,
              foregroundDecoration: BoxDecoration(color: Colors.transparent),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: avatarColor4,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      icon,
                      color: bodyColor,
                    ),
                    SizedBox(
                      width: 5.h,
                    ),
                    Text(
                      label,
                      style: boldCaptionStyle,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );

/********************************
*
*
*
*
*
*
*
*
//BOOKMARKS SECTION
*
*
*
*
*
*
*
*
*
*/

  DropDown(
    BuildContext context, {
    final void Function()? onPress,
  }) =>
      Material(
        elevation: 3.0,
        child: Container(
          color: kcBackgroundColor2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              verticalSpaceMedium,
              AddBookMark(context),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Container(
                  //color: Colors.red,
                  //margin: EdgeInsets.only(left: 20),
                  child: Text('No recent links',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Lato',
                          color: kcDisplayChannelColor4)),
                ),
              ),
              // DropDownItem(
              //   text: "No recent links",
              // ),
            ],
          ),
        ),
      );

  AddBookMark(BuildContext context, {final void Function()? onPressed}) =>
      MouseRegion(
        onEnter: (_) => dmViewModel.onEntered(true),
        onExit: (_) => dmViewModel.onEntered(false),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop;
            _toggleDropdownForAddBookmark(close: true, context: context);
            showDialog(
                context: context,
                builder: (context) =>
                    Dialog(child: AddBookmarkDialog(context)));
            dmViewModel.onPinnedMessage(false);
            // view.toggleDropdownForAddBookmarkForAddBookmarkForAddBookmarkForAddBookmark(context: context, close: true);
          },
          child: Container(
              color: dmViewModel.isHover ? kcPrimaryColor : kcBackgroundColor2,
              // width: 250.w,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SvgPicture.asset(
                        SVGAssetPaths.linkIcon,
                      ),
                    ),
                  ),
                  horizontalSpaceSmall,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Add a bookmark', style: headline7),
                      Text('Easily find your team\'s important links',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Lato',
                          ))
                    ],
                  )
                ],
              )),
        ),
      );

  DropDownItem({
    required final String text,
    final IconData? iconData,
    void Function()? onTap,
  }) =>
      MouseRegion(
        onEnter: (_) => dmViewModel.onEntered(true),
        onExit: (_) => dmViewModel.onEntered(false),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            color: dmViewModel.isHover ? kcPrimaryColor : kcBackgroundColor2,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: <Widget>[
                Text(
                  text,
                  style: dmViewModel.isHover ? subtitlec2 : subtitle2,
                ),
                Spacer(),
                Icon(
                  iconData,
                  color: dmViewModel.isHover ? kcBackgroundColor2 : headerColor,
                ),
              ],
            ),
          ),
        ),
      );

  AddBookmarkDialog(BuildContext context) => Container(
        width: 580,
        height: 420,
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        child: Column(children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add A Bookmark',
                    style: headline6,
                  ),
                  IconButton(
                      onPressed: Navigator.of(context).pop,
                      icon: Icon(
                        Icons.close,
                        size: 28.sp,
                      ))
                ],
              ),
              verticalSpaceMediumTwo,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Link', style: subtitle2),
                  verticalSpaceSmall,
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kcPrimaryColor)),
                      hintText: 'https://www.zuri.chat',
                    ),
                  ),
                ],
              ),
              verticalSpaceMediumTwo,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name', style: subtitle2),
                  verticalSpaceSmall,
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kcPrimaryColor)),
                      hintText: 'Ex. design reference ',
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Container(
                          height: 15,
                          width: 15,
                          child: SvgPicture.asset(
                            SVGAssetPaths.linkIcon,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              verticalSpaceMedium,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(117.w, 48.h),
                    textStyle: clearStatusTextStyle,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    primary: kcPrimaryColor,
                    onPrimary: bodyColor,
                    side: BorderSide(
                        color: clearStatusBtnBorderColor, width: 1.0.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r))),
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
                //),
              ),
              horizontalSpaceMedium,
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(117.w, 48.h),
                    textStyle: clearStatusTextStyle,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    primary: Colors.white,
                    onPrimary: bodyColor,
                    side: BorderSide(
                        color: clearStatusBtnBorderColor, width: 1.0.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r))),
                child: Text('Cancel'),
                //),
              ),
            ],
          )
        ]),
      );

//
// BOOKMARK SECTION
//
//EDIT BOOKMARK DIALOGUE
  EditBookmarkDialog(BuildContext context) => Container(
        width: 580,
        height: 420,
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        child: Column(children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Edit Bookmark',
                    style: headline6,
                  ),
                  IconButton(
                      onPressed: Navigator.of(context).pop,
                      icon: Icon(
                        Icons.close,
                        size: 28.sp,
                      ))
                ],
              ),
              verticalSpaceMediumTwo,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Link', style: subtitle2),
                  verticalSpaceSmall,
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      hintText: 'https://www.zuri.chat',
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kcPrimaryColor)),
                    ),
                  ),
                ],
              ),
              verticalSpaceMediumTwo,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name', style: subtitle2),
                  verticalSpaceSmall,
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kcPrimaryColor)),
                      //helperText: 'www.zurichat.com',
                      // hintText: 'Ex. design reference ',
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Container(
                          height: 15,
                          width: 15,
                          child: SvgPicture.asset(
                            SVGAssetPaths.linkIcon,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Last edited by Dan Odin, Today at 6:09PM'),
            ],
          ),
          verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(117.w, 48.h),
                    textStyle: clearStatusTextStyle,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    primary: kcPrimaryColor,
                    onPrimary: bodyColor,
                    side: BorderSide(
                        color: clearStatusBtnBorderColor, width: 1.0.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r))),
                child: Text(
                  'Edit',
                  style: TextStyle(color: Colors.white),
                ),
                //),
              ),
              horizontalSpaceMedium,
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(117.w, 48.h),
                    textStyle: clearStatusTextStyle,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    primary: Colors.white,
                    onPrimary: bodyColor,
                    side: BorderSide(
                        color: clearStatusBtnBorderColor, width: 1.0.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r))),
                child: Text('Cancel'),
                //),
              ),
            ],
          )
        ]),
      );

  DeleteBookmarkDialog(BuildContext context) => Container(
        width: 580.w,
        height: 280.h,
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        child: Column(children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delete Bookmark',
                    style: headline6,
                  ),
                  IconButton(
                      onPressed: Navigator.of(context).pop,
                      icon: Icon(
                        Icons.close,
                        size: 28.sp,
                      ))
                ],
              ),
              verticalSpaceMediumTwo,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Are you sure you want to delete this? If you do,\nIt will be lost for eternity beyond death and time. Unrecoverable!',
                softWrap: true,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          verticalSpaceSmall,
          verticalSpaceMediumTwo,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(117.w, 48.h),
                    textStyle: clearStatusTextStyle,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    primary: kcAccentColor,
                    onPrimary: bodyColor,
                    side: BorderSide(
                        color: clearStatusBtnBorderColor, width: 1.0.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r))),
                child: Text(
                  'Delete',
                  style: TextStyle(color: Colors.white),
                ),
                //),
              ),
              horizontalSpaceMedium,
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(117.w, 48.h),
                    textStyle: clearStatusTextStyle,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    primary: Colors.white,
                    onPrimary: bodyColor,
                    side: BorderSide(
                        color: clearStatusBtnBorderColor, width: 1.0.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r))),
                child: Text('Cancel'),
                //),
              ),
            ],
          )
        ]),
      );

  ActionsBookmarkDialog(BuildContext context) => Container(
        width: 270.w,
        height: 280.h,
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        child: Column(children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Actions',
                    style: headline6,
                  ),
                  IconButton(
                      onPressed: Navigator.of(context).pop,
                      icon: Icon(
                        Icons.close,
                        size: 28.sp,
                      ))
                ],
              ),
              verticalSpaceMediumTwo,
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookmarkActions(
                text: 'Open Link',
                onTap: () {
                  Navigator.pop(context, true);
                  dmViewModel.launchBookmarkedUrl('https://www.zuri.chat');
                },
              ),
              verticalSpaceSmall,
              BookmarkActions(
                text: 'Edit Link',
                onTap: () {
                  Navigator.pop(context, true);
                  showDialog(
                      context: context,
                      builder: (context) =>
                          Dialog(child: EditBookmarkDialog(context)));
                },
              ),
              verticalSpaceSmall,
              BookmarkActions(text: 'Copy Link'),
              verticalSpaceSmall,
              BookmarkActions(
                text: 'Delete Link',
                onTap: () {
                  Navigator.pop(context, true);
                  showDialog(
                      context: context,
                      builder: (context) =>
                          Dialog(child: DeleteBookmarkDialog(context)));
                },
              ),
            ],
          ),
          verticalSpaceSmall,
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     ElevatedButton(
          //       onPressed: () {
          //         Navigator.pop(context, true);
          //       },
          //       style: ElevatedButton.styleFrom(
          //           fixedSize: Size(105.w, 42.h),
          //           textStyle: clearStatusTextStyle,
          //           padding: EdgeInsets.symmetric(horizontal: 16.w),
          //           primary: Colors.white,
          //           onPrimary: bodyColor,
          //           side: BorderSide(
          //               color: clearStatusBtnBorderColor, width: 1.0.w),
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(5.r))),
          //       child: Text('Close'),
          //       //),
          //     ),
          //   ],
          // )
        ]),
      );

  BookMarkedItem(
          {required String label,
          required String tip,
          required final String icon,
          required VoidCallback onClicked}) =>
      Tooltip(
        message: tip,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: onClicked,
            child: Container(
              height: 30,
              foregroundDecoration: BoxDecoration(color: Colors.transparent),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: avatarColor4,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      icon,
                      color: bodyColor,
                    ),
                    SizedBox(
                      width: 5.h,
                    ),
                    Text(
                      label,
                      style: boldCaptionStyle,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  BookmarkActions({
    required final String text,
    final IconData? iconData,
    void Function()? onTap,
  }) =>
      MouseRegion(
        onEnter: (_) => dmViewModel.onEntered(true),
        onExit: (_) => dmViewModel.onEntered(false),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            color: dmViewModel.isHover ? kcPrimaryColor : kcBackgroundColor2,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: <Widget>[
                Text(
                  text,
                  style: dmViewModel.isHover ? subtitlec2 : subtitle2,
                ),
                Spacer(),
                Icon(
                  iconData,
                  color: dmViewModel.isHover ? kcBackgroundColor2 : headerColor,
                ),
              ],
            ),
          ),
        ),
      );

  ///PINNED MESSAGES SECTION

  DropDownForPinnedMessages({
    final void Function()? onPressed,
  }) =>
      Material(
          elevation: 3.0,
          child: Container(
            height: 430,
            width: 580,
            color: Color(0XFFF6F6F6),
            child: ListView.builder(
                reverse: true,
                //controller: scrollController,
                itemCount: dmViewModel.pinnedMessages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: BuildPinnedItem(
                      isCancelIconVisble: true,
                      message:
                          dmViewModel.pinnedMessages.elementAt(index).message,
                      userDisplayImageUrl: dmViewModel.pinnedMessages
                          .elementAt(index)
                          .displayImage,
                      userDisplayName: dmViewModel.pinnedMessages
                          .elementAt(index)
                          .displayName,
                      time:
                          dmViewModel.pinnedMessages.elementAt(index).createdAt,
                      onPressed: () {},
                      onPinnedItemClose: () {
                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                    child: DeletePinnedItemDialog(
                                  context,
                                  message: dmViewModel.pinnedMessages
                                      .elementAt(index)
                                      .message,
                                  userDisplayImageUrl: dmViewModel
                                      .pinnedMessages
                                      .elementAt(index)
                                      .displayImage,
                                  userDisplayName: dmViewModel.pinnedMessages
                                      .elementAt(index)
                                      .displayName,
                                  time: dmViewModel.pinnedMessages
                                      .elementAt(index)
                                      .createdAt,
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                    dmViewModel.pinnedMessages.removeAt(index);
                                  },
                                )));
                      },
                    ),
                  );
                }),
          ));

  BuildPinnedItem({
    required final String message,
    required final String userDisplayName,
    required final String userDisplayImageUrl,
    required final bool isCancelIconVisble,
    required final String time,
    final void Function()? onPressed,
    final void Function()? onPinnedItemClose,
  }) =>
      MouseRegion(
        onEnter: (_) => dmViewModel.onEntered(true),
        onExit: (_) => dmViewModel.onEntered(false),
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            width: 369,
            // height: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 33,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(userDisplayImageUrl)),
                            ),
                            //child: Image.network(userDisplayImageUrl),
                          ),
                          horizontalSpaceSmall,
                          Text(
                            userDisplayName,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp,
                                fontFamily: 'Lato'),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: isCancelIconVisble,
                        child: IconButton(
                            onPressed: onPinnedItemClose,
                            icon: Icon(
                              Icons.close,
                              size: 21.sp,
                            )),
                      )
                    ],
                  ),
                  verticalSpaceSmall,
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message,
                        //softWrap: true,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            fontFamily: 'Lato'),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpaceMedium,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Today at ${time}',
                    style: TextStyle(
                        fontFamily: 'Lato',
                        color: lightIconColor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ]),
          ),
        ),
      );

  DeletePinnedItemDialog(
    BuildContext context, {
    required String message,
    required String userDisplayImageUrl,
    required String userDisplayName,
    required String time,
    final void Function()? onPressed,
  })
      //final String message;
      =>
      Container(
        width: 580.w,
        height: 370.h,
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        child: Column(children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Remove Pinned Item',
                    style: headline6,
                  ),
                  IconButton(
                      onPressed: Navigator.of(context).pop,
                      icon: Icon(
                        Icons.close,
                        size: 28.sp,
                      ))
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Are you sure you want to remove this pinned item?',
                softWrap: true,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          verticalSpaceTiny,
          Container(
            width: 550.w,
            // height: 180.h,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: kcBorderColor)),
            child: BuildPinnedItem(
                isCancelIconVisble: false,
                message: message,
                userDisplayName: userDisplayName,
                userDisplayImageUrl: userDisplayImageUrl,
                time: time),
          ),
          verticalSpaceMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(117.w, 48.h),
                    textStyle: clearStatusTextStyle,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    primary: kcAccentColor,
                    onPrimary: bodyColor,
                    side: BorderSide(
                        color: clearStatusBtnBorderColor, width: 1.0.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r))),
                child: Text(
                  'Remove',
                  style: TextStyle(color: Colors.white),
                ),
                //),
              ),
              horizontalSpaceMedium,
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(117.w, 48.h),
                    textStyle: clearStatusTextStyle,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    primary: Colors.white,
                    onPrimary: bodyColor,
                    side: BorderSide(
                        color: clearStatusBtnBorderColor, width: 1.0.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r))),
                child: Text('Cancel'),
                //),
              ),
            ],
          )
        ]),
      );
} // END OF CLASS

