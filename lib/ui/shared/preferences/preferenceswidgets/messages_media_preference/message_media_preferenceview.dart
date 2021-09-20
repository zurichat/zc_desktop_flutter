import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';

import '../../../const_app_colors.dart';
import '../../../const_text_styles.dart';
import '../../../const_ui_helpers.dart';
import 'message_media_preference_viewModel.dart';

class MessageMediaPreferenceView extends StatelessWidget {
  const MessageMediaPreferenceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _rightSideBarController = ScrollController();
    return ViewModelBuilder<MessageMediaPreferenceViewModel>.reactive(
      builder: (context, model, child) => SingleChildScrollView(
        controller: _rightSideBarController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            themeSection(model),
            nameSection(model),
            additionalOptionsSection(model),
            emojiSection(model),
            inLineMediaSection(model),
            bringEmailIntoZuriSection(model),
          ],
        ),
      ),
      viewModelBuilder: () => MessageMediaPreferenceViewModel(),
    );
  }
}

Widget bringEmailIntoZuriSection(MessageMediaPreferenceViewModel model) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          model.messagepreferencetitles[7],
          style: TextStyle(
              fontSize: 16.sp, fontFamily: 'Lato', fontWeight: FontWeight.w500),
        ),
        verticalSpaceSmall,
        SizedBox(
          width: 350,
          child: Text(model.longText[0],
              style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w500)),
        ),
        verticalSpaceMedium,
        PreferenceButton(
          label: 'Get a forward address',
        )
      ],
    ),
  );
}

Widget inLineMediaSection(MessageMediaPreferenceViewModel model) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(model.messagepreferencetitles[6],
            style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500)),
        verticalSpaceSmall,
        ZcCheckBox1(
            onChanged: (v) {
              model.setimageFileUploadZuri = v;
            },
            txt: model.allCcheckBoxText[5],
            value: model.imageFileUploadZuri),
        ZcCheckBox1(
            onChanged: (v) {
              model.setimageFileLinkedWebsite = v;
            },
            txt: model.allCcheckBoxText[6],
            value: model.imageFileLinkedWebsite),
        Transform.scale(
          scale: 0.96,
          child: ZcCheckBox1(
              onChanged: (v) {
                model.setevenLarger2Mb = v;
              },
              txt: model.allCcheckBoxText[7],
              value: model.evenLarger2Mb),
        ),
        verticalSpaceTiny,
        ZcCheckBox1(
            onChanged: (v) {
              model.setshowTextpreview = v;
            },
            txt: model.allCcheckBoxText[8],
            value: model.showTextpreview),
        verticalSpaceSmall,
        Divider(
          color: leftNavBarColor,
          thickness: 1,
        ),
      ],
    ),
  );
}

Widget additionalOptionsSection(MessageMediaPreferenceViewModel model) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          model.messagepreferencetitles[3],
          style: TextStyle(
              fontSize: 16.sp, fontFamily: 'Lato', fontWeight: FontWeight.w500),
        ),
        verticalSpaceSmall,
        ZcCheckBox1(
            onChanged: (v) {
              model.setDiplayCurrentTyping = v;
            },
            txt: model.allCcheckBoxText[0],
            value: model.displayCurrentTyping),
        ZcCheckBox1(
            onChanged: (v) {
              model.setTimeWith = v;
            },
            txt: model.allCcheckBoxText[1],
            value: model.timeWith),
        ZcCheckBox1(
            onChanged: (v) {
              model.setDiplayColorSwatch = v;
            },
            txt: model.allCcheckBoxText[2],
            value: model.displaycolorSwatches),
        verticalSpaceSmall,
        Divider(
          color: leftNavBarColor,
          thickness: 1,
        ),
      ],
    ),
  );
}

class ZcCheckBox1 extends StatelessWidget {
  const ZcCheckBox1({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.txt,
  }) : super(key: key);
  final bool? value;
  final void Function(bool? value)? onChanged;
  final String? txt;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 0.7,
          child: Checkbox(
            value: value!,
            activeColor: kcPrimaryColor,
            onChanged: onChanged!,
          ),
        ),
        horizontalSpaceVeryTiny,
        Flexible(
            child: Text(txt!,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                    color: leftNavBarColor))),
      ],
    );
  }
}

Widget emojiSection(MessageMediaPreferenceViewModel model) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          model.messagepreferencetitles[4],
          style: TextStyle(
              fontSize: 16.sp, fontFamily: 'Lato', fontWeight: FontWeight.w500),
        ),
        verticalSpaceSmall,
        Text(
          model.messagepreferencetitles[5],
          style: headline6.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        verticalSpaceSmall,
        Text(model.longText[1],
            style: kBodyTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w500)),
        verticalSpaceSmall,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
              model.emojiSkin.length,
              (index) => GestureDetector(
                    onTap: () {
                      model.setEmojiSkin = index;
                      print(index);
                    },
                    child: Container(
                      height: 36.h,
                      width: 36.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: model.selectedSkin == index
                                  ? kcPrimaryColor
                                  : leftNavBarColor)),
                      child: Center(
                        child: SvgPicture.asset(
                          model.emojiSkin[index],
                          height: 20.h,
                          width: 20.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )),
        ),
        verticalSpaceSmall,
        ZcCheckBox1(
            value: model.displayEmojiAsText,
            onChanged: (v) {
              model.setDisplayEmojiAsText = v;
            },
            txt: model.allCcheckBoxText[3]),
        verticalSpaceSmall,
        ZcCheckBox1(
            value: model.showJumbomji,
            onChanged: (v) {
              model.setShowJumbomji = v;
            },
            txt: model.allCcheckBoxText[4]),
        verticalSpaceSmall,
        SizedBox(
          width: 400.w,
          child: Text(
              'Display the jumbo versions of emoji (up to 23 at a time!) in messages without text.',
              style: kBodyTextStyle.copyWith(
                  fontSize: 12, fontWeight: FontWeight.w500)),
        ),
        verticalSpaceMedium,
        Text('Here is an Example',
            style: kHeading4TextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w500, color: timeColor)),
        verticalSpaceSmall,
        ReusableContainer(
          image: 'assets/images/People of Brooklyn Avatar 2.png',
          subtitle: "I just reviewed it, I'm ready to provide feedback",
          time: '9:25am',
          title: 'Mark',
          emoji: '',
        ),
        verticalSpaceSmall,
        Divider(
          color: leftNavBarColor,
          thickness: 1,
        ),
      ],
    ),
  );
}

Widget themeSection(MessageMediaPreferenceViewModel model) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(model.messagepreferencetitles[0],
            style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500)),
        buildThemeRadioColumn(model),
        verticalSpaceSmall,
        Text('Here is an Example',
            style: TextStyle(
                fontSize: 13.sp,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500,
                color: bodyColor)),
        verticalSpaceSmall,
        ReusableContainer(
          image: 'assets/images/GroupLogo.png',
          subtitle: 'Feeling great',
          time: '9:25am',
          title: 'Zuri Bot',
          emoji: '',
        ),
        verticalSpaceSmall,
        Divider(
          color: leftNavBarColor,
          thickness: 1,
        ),
      ],
    ),
  );
}

Widget nameSection(MessageMediaPreferenceViewModel model) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(model.messagepreferencetitles[2],
            style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500,
                color: headerColor)),
        buildNameRadioColumn(model),
        verticalSpaceSmall,
        ReusableContainer(
          image: 'assets/images/People of Brooklyn Avatar.png',
          subtitle: 'Hi, i am ',
          time: '9:25am',
          title: 'Zuri',
          emoji: 'assets/images/Vector.svg',
          subtxt: '@zuri',
        ),
        verticalSpaceSmall,
        GestureDetector(
          onTap: () {
            print('Your profile');
          },
          child: RichText(
              softWrap: true,
              text: TextSpan(
                  text: 'To change your full or display name, head to',
                  style: subtitle2.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: timeColor),
                  children: [
                    TextSpan(
                      text: ' your profile.',
                      style: subtitle2.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: kcPrimaryColor),
                    )
                  ])),
        ),
        verticalSpaceSmall,
        Divider(
          color: leftNavBarColor,
          thickness: 1,
        ),
      ],
    ),
  );
}

class ReusableContainer extends StatelessWidget {
  const ReusableContainer({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.image,
    required this.emoji,
    this.subtxt,
  }) : super(key: key);

  final String? title, subtitle;
  final String? time;
  final String? image;
  final String? emoji;
  final String? subtxt;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86.h,
      width: 556.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kcPrimaryColor)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Image.asset(image!),
                SizedBox(
                  width: 10,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            title!,
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                                color: headerColor),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              verticalSpaceTiny,
                              Text(
                                time!,

                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w500),


                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(emoji!),
                          horizontalSpaceTiny,
                          RichText(
                              softWrap: true,
                              text: TextSpan(
                                  text: subtitle!,
                                  style: kHeading4TextStyle.copyWith(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                  children: [
                                    TextSpan(
                                      text: subtxt,
                                      style: subtitle2.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: kcPrimaryColor),
                                    )
                                  ]))
                        ],
                      )
                    ])
              ],
            )
          ],
        ),
      ),
    );
  }
}

buildRadio(
    {required PrefTheme value,
    required Object groupValue,
    void Function(Object? value)? onChanged,
    required String txt}) {
  return Row(
    children: <Widget>[
      Transform.scale(
        scale: 0.7,
        child: Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: Colors.green,
        ),
      ),
      Text(
        txt,
        style: TextStyle(
            fontSize: 12.sp,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w500,
            color: bodyColor),
      )
    ],
  );
}

buildThemeRadioColumn(MessageMediaPreferenceViewModel model) {
  return Column(
    children: [
      buildRadio(
          groupValue: model.themepref,
          value: PrefTheme.Clean,
          txt: 'Clean',
          onChanged: (value) {
            model.setThemePref((value));
          }),
      buildRadio(
          groupValue: model.themepref,
          value: PrefTheme.Compact,
          txt: 'Comapct',
          onChanged: (value) {
            model.setThemePref((value));
          }),
    ],
  );
}

buildNameRadioColumn(MessageMediaPreferenceViewModel model) {
  return Column(
    children: [
      buildRadio(
          groupValue: model.namepref,
          value: PrefTheme.FullandDisplaynames,
          txt: 'Full & display names',
          onChanged: (value) {
            model.setNamePref((value));
          }),
      buildRadio(
          groupValue: model.namepref,
          value: PrefTheme.JustDisplayNames,
          txt: 'Just display names',
          onChanged: (value) {
            model.setNamePref((value));
          }),
    ],
  );
}

enum PrefTheme {
  Clean,
  Compact,
  JustDisplayNames,
  FullandDisplaynames,
}
