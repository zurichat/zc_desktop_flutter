// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
//import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/bookmark_and_pinned_bar/bookmark_and_pinned_viewmodel.dart';

import '../../const_text_styles.dart';
import '../../const_widgets.dart';

class BookmarkAndPinnedMessagesView extends StatelessWidget {
  BookmarkAndPinnedMessagesView({Key? key}) : super(key: key);

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
                toggleDropdownForAddBookmark(close: true, context: context);
              },
              child: DropDown(
                onPress: () {
                  toggleDropdownForAddBookmark(close: true, context: context);
                },
              ),
            ),
          ),
        ),
      );
    });
  }

  OverlayEntry _buildDropDownForPinnedMessages() {
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
                toggleDropDownForPinnedMessages(
                    isClosed: true, context: context);
              },
              child: DropDownForPinnedMessages(
                onPressed: () {
                  toggleDropDownForPinnedMessages(
                      isClosed: true, context: context);
                },
              ),
            ),
          ),
        ),
      );
    });
  }

  toggleDropdownForAddBookmark({
    bool close = false,
    required BuildContext context,
  }) async {
    final model = BookmarkAndPinnedMessagesViewModel();

    if (model.isDropped || close) {
      this._floatingDropdown.remove();
      model.setIsDropped(false);
    } else {
      this._floatingDropdown = this._buildFloatingDropdown();
      Overlay.of(context)!.insert(this._floatingDropdown);
      model.setIsDropped(true);
    }
  }

  toggleDropDownForPinnedMessages({
    bool isClosed = false,
    required BuildContext context,
  }) async {
    final model = BookmarkAndPinnedMessagesViewModel();

    if (isClosed || model.isDropped) {
      this._floatingPinnedMessagesDropDown.remove();
      model.setIsDropped(false);
    } else {
      this._floatingPinnedMessagesDropDown =
          this._buildDropDownForPinnedMessages();
      Overlay.of(context)!.insert(this._floatingPinnedMessagesDropDown);
      model.setIsDropped(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => RowActions(),
      viewModelBuilder: () => BookmarkAndPinnedMessagesViewModel(),
    );
  }

  RowActions() {
    return ViewModelBuilder<BookmarkAndPinnedMessagesViewModel>.reactive(
        viewModelBuilder: () => BookmarkAndPinnedMessagesViewModel(),
        builder: (context, model, child) => Container(
              color: kcPrimaryLight,
              child: Row(
                children: [
                  //Original Pinned Icon
                  Visibility(
                    visible: model.isMessagePinned,
                    child: RowActionItem(
                      tip: 'Pinned Items',
                      label: '3 Pinned',
                      icon: SVGAssetPaths.pinnedIcon,
                      onClicked: () {
                        model.onPinnedMessage(false);
                        model.displayDecoyForPinnedMessage(true);
                        log('Pinned messages clicked');
                        toggleDropdownForAddBookmark(
                            close: true, context: context);
                        toggleDropDownForPinnedMessages(context: context);
                      },
                    ),
                  ),
                  //Decoy Pinned items button
                  Visibility(
                    visible: model.isDecoyForPinnedMessageVisible,
                    child: RowActionItem(
                      tip: 'Pinned Items',
                      label: '3 Pinned',
                      icon: SVGAssetPaths.pinnedIcon,
                      onClicked: () {
                        model.onPinnedMessage(true);
                        model.displayDecoyForPinnedMessage(false);
                        log('Pinned messages clicked');
                        toggleDropdownForAddBookmark(
                            close: true, context: context);
                        toggleDropDownForPinnedMessages(
                            context: context, isClosed: true);
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
                                  child: ActionsBookmarkDialog(),
                                ));
                      }),
                  Visibility(
                    visible: model.isOriginalBookmarkVisible,
                    child: RowActionItem(
                      //2
                      tip: 'Bookmark a link',
                      label: 'Add a bookmark',
                      icon: SVGAssetPaths.addIcon,
                      onClicked: () {
                        toggleDropdownForAddBookmark(
                            context: context, close: false);
                        toggleDropDownForPinnedMessages(
                            context: context, isClosed: true);
                        model.onPinnedMessage(true);
                        model.displayDecoyForAddBookmark(true);
                        model.displayOriginalBookmark(false);
                        log('Add to bookmarks clicked');
                      },
                    ),
                  ),
                  //Decoy Button=> closes the overlay
                  Visibility(
                    visible: model.isBookmarkDecoyVisible,
                    child: RowActionItem(
                      //Decoy
                      tip: 'Bookmark a link',
                      label: 'Add a bookmark',
                      icon: SVGAssetPaths.addIcon,
                      onClicked: () {
                        model.displayDecoyForAddBookmark(false);
                        model.displayOriginalBookmark(true);
                        toggleDropdownForAddBookmark(
                            context: context, close: true);
                        toggleDropDownForPinnedMessages(
                            context: context, isClosed: true);
                        model.onPinnedMessage(true);
                        log('Add to bookmarks clicked');
                      },
                    ),
                  ),
                ],
              ),
            ));
  }

  RowActionItem({
    required final String icon,
    required final String label,
    required final String tip,
    VoidCallback? onClicked,
  }) =>
      ViewModelBuilder<BookmarkAndPinnedMessagesViewModel>.reactive(
          viewModelBuilder: () => BookmarkAndPinnedMessagesViewModel(),
          builder: (context, model, child) => Tooltip(
                message: tip,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: onClicked,
                    child: Container(
                      height: 30,
                      foregroundDecoration:
                          BoxDecoration(color: Colors.transparent),
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
              ));

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

  DropDown({
    final void Function()? onPress,
  }) =>
      ViewModelBuilder<BookmarkAndPinnedMessagesViewModel>.reactive(
          viewModelBuilder: () => BookmarkAndPinnedMessagesViewModel(),
          builder: (context, model, child) => Material(
                elevation: 3.0,
                child: Container(
                  color: kcBackgroundColor2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      verticalSpaceMedium,
                      AddBookMark(),
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
              ));

  AddBookMark({final void Function()? onPressed}) =>
      ViewModelBuilder<BookmarkAndPinnedMessagesViewModel>.reactive(
          viewModelBuilder: () => BookmarkAndPinnedMessagesViewModel(),
          builder: (context, model, child) => MouseRegion(
                onEnter: (_) => model.onEntered(true),
                onExit: (_) => model.onEntered(false),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop;
                    toggleDropdownForAddBookmark(close: true, context: context);
                    showDialog(
                        context: context,
                        builder: (context) =>
                            Dialog(child: AddBookmarkDialog()));
                    model.onPinnedMessage(false);
                    // view.toggleDropdownForAddBookmarkForAddBookmarkForAddBookmarkForAddBookmark(context: context, close: true);
                    print('AddBookMark Clicked');
                  },
                  child: Container(
                      color:
                          model.isHover ? kcPrimaryColor : kcBackgroundColor2,
                      // width: 250.w,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
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
              ));

  DropDownItem({
    required final String text,
    final IconData? iconData,
    void Function()? onTap,
  }) =>
      ViewModelBuilder<BookmarkAndPinnedMessagesViewModel>.reactive(
          viewModelBuilder: () => BookmarkAndPinnedMessagesViewModel(),
          builder: (context, model, child) => MouseRegion(
                onEnter: (_) => model.onEntered(true),
                onExit: (_) => model.onEntered(false),
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    color: model.isHover ? kcPrimaryColor : kcBackgroundColor2,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        Text(
                          text,
                          style: model.isHover ? subtitlec2 : subtitle2,
                        ),
                        Spacer(),
                        Icon(
                          iconData,
                          color:
                              model.isHover ? kcBackgroundColor2 : headerColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ));

  AddBookmarkDialog() =>
      ViewModelBuilder<BookmarkAndPinnedMessagesViewModel>.reactive(
          viewModelBuilder: () => BookmarkAndPinnedMessagesViewModel(),
          builder: (context, model, child) => Container(
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
                                  borderSide:
                                      BorderSide(color: kcPrimaryColor)),
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
                                  borderSide:
                                      BorderSide(color: kcPrimaryColor)),
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
              ));

//
// BOOKMARK SECTION
//
//EDIT BOOKMARK DIALOGUE
  EditBookmarkDialog() =>
      ViewModelBuilder<BookmarkAndPinnedMessagesViewModel>.reactive(
          viewModelBuilder: () => BookmarkAndPinnedMessagesViewModel(),
          builder: (context, model, child) => Container(
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
                                  borderSide:
                                      BorderSide(color: kcPrimaryColor)),
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
                                  borderSide:
                                      BorderSide(color: kcPrimaryColor)),
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
              ));

  DeleteBookmarkDialog() =>
      ViewModelBuilder<BookmarkAndPinnedMessagesViewModel>.reactive(
          viewModelBuilder: () => BookmarkAndPinnedMessagesViewModel(),
          builder: (context, model, child) => Container(
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
              ));

  ActionsBookmarkDialog() =>
      ViewModelBuilder<BookmarkAndPinnedMessagesViewModel>.reactive(
          viewModelBuilder: () => BookmarkAndPinnedMessagesViewModel(),
          builder: (context, model, child) => Container(
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
                          model.launchBookmarkedUrl('https://www.zuri.chat');
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
                                  Dialog(child: EditBookmarkDialog()));
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
                                  Dialog(child: DeleteBookmarkDialog()));
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
              ));

  BookMarkedItem(
          {required String label,
          required String tip,
          required final String icon,
          required VoidCallback onClicked}) =>
      ViewModelBuilder<BookmarkAndPinnedMessagesViewModel>.reactive(
          viewModelBuilder: () => BookmarkAndPinnedMessagesViewModel(),
          builder: (context, model, child) => Tooltip(
                message: tip,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: onClicked,
                    child: Container(
                      height: 30,
                      foregroundDecoration:
                          BoxDecoration(color: Colors.transparent),
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
              ));

  BookmarkActions({
    required final String text,
    final IconData? iconData,
    void Function()? onTap,
  }) =>
      ViewModelBuilder<BookmarkAndPinnedMessagesViewModel>.reactive(
          viewModelBuilder: () => BookmarkAndPinnedMessagesViewModel(),
          builder: (context, model, child) => MouseRegion(
                onEnter: (_) => model.onEntered(true),
                onExit: (_) => model.onEntered(false),
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    color: model.isHover ? kcPrimaryColor : kcBackgroundColor2,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        Text(
                          text,
                          style: model.isHover ? subtitlec2 : subtitle2,
                        ),
                        Spacer(),
                        Icon(
                          iconData,
                          color:
                              model.isHover ? kcBackgroundColor2 : headerColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ));

/********************************
*
*
*
*
*
*
*
*
//PINNED MESSAGES SECTION
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

  DropDownForPinnedMessages({
    final void Function()? onPressed,
  }) =>
      ViewModelBuilder<BookmarkAndPinnedMessagesViewModel>.reactive(
          viewModelBuilder: () => BookmarkAndPinnedMessagesViewModel(),
          builder: (context, model, child) => Material(
              elevation: 3.0,
              child: Container(
                height: 430,
                width: 580,
                color: Color(0XFFF6F6F6),
                child: ListView.builder(
                    //controller: scrollController,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: BuildPinnedItem(
                          isCancelIconVisble: true,
                          message:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit placerat tincidunt ,consectetur adipiscing elit. Vestibulum sit placerat tincidunt,consectetur adipiscing elit. Vestibulum sit placerat tincidunt',
                          userDisplayImageUrl: 'assets/images/profile.png',
                          userDisplayName: 'DanOdin',
                          onPressed: () {
                            print(index);
                          },
                          onPinnedItemClose: () {
                            print(index);
                            showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                    child: DeletePinnedItemDialog(
                                        message:
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit placerat tincidunt ,consectetur adipiscing elit. Vestibulum sit placerat tincidunt,consectetur adipiscing elit. Vestibulum sit placerat tincidunt',
                                        userDisplayImageUrl:
                                            'assets/images/profile.png',
                                        userDisplayName: 'DanOdin')));
                          },
                        ),
                      );
                    }),
              )));

  BuildPinnedItem({
    required final String message,
    required final String userDisplayName,
    required final String userDisplayImageUrl,
    required final bool isCancelIconVisble,
    final void Function()? onPressed,
    final void Function()? onPinnedItemClose,
  }) =>
      ViewModelBuilder<BookmarkAndPinnedMessagesViewModel>.reactive(
          viewModelBuilder: () => BookmarkAndPinnedMessagesViewModel(),
          builder: (context, model, child) => MouseRegion(
                onEnter: (_) => model.onEntered(true),
                onExit: (_) => model.onEntered(false),
                child: GestureDetector(
                  onTap: onPressed,
                  child: Container(
                    width: 369,
                    height: 200,
                    padding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
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
                                          image:
                                              AssetImage(userDisplayImageUrl)),
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            message,
                            softWrap: true,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                fontFamily: 'Lato'),
                          ),
                        ],
                      ),
                      verticalSpaceSmall,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Today at 6:09PM',
                            style: TextStyle(
                                fontFamily: 'Lato',
                                color: lightIconColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      verticalSpaceMedium,
                    ]),
                  ),
                ),
              ));

  DeletePinnedItemDialog(
          {required String message,
          required String userDisplayImageUrl,
          required String userDisplayName})
      //final String message;
      =>
      ViewModelBuilder<BookmarkAndPinnedMessagesViewModel>.reactive(
          viewModelBuilder: () => BookmarkAndPinnedMessagesViewModel(),
          builder: (context, model, child) => Container(
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
                    height: 180.h,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: kcBorderColor)),
                    child: BuildPinnedItem(
                        isCancelIconVisble: false,
                        message: message,
                        userDisplayName: userDisplayName,
                        userDisplayImageUrl: userDisplayImageUrl),
                  ),
                  verticalSpaceMedium,
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
              ));
} // END OF CLASS

