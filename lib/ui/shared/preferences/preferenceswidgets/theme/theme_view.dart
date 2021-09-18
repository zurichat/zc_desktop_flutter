import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferenceswidgets/theme/theme_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';

class ThemeView extends StatelessWidget {
  ScrollController _rightSideBarController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThemeViewModel>.reactive(
      builder: (
        context,
        model,
        child,
      ) =>
          Scaffold(
              body: SingleChildScrollView(
                  controller: _rightSideBarController,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.all(10)),
                        Container(
                            child: padding(
                                context,
                                Text(
                                  model.head1,
                                  style: headline6.copyWith(fontSize: 14.sp),
                                ))),
                        Container(
                            width: 180,
                            padding: EdgeInsets.all(5),
                            child: Row(children: [
                              Container(
                                  child: Checkbox(
                                activeColor: model.activeColor(),
                                value: model.isChecked,
                                onChanged: model.setChecked,
                              )),
                              Expanded(
                                  child: Text(model.body1,
                                      style: bodyStyle.copyWith(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold))),
                            ])),
                        Container(
                            width: 250,
                            padding: EdgeInsets.only(left: 5),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      child: Radio(
                                    groupValue: model.allWorkSpace,
                                    activeColor: model.activeColor(),
                                    value: themeAccross.directMessage,
                                    onChanged: model.setChecked2,
                                  )),
                                  Expanded(
                                      child: Text(model.body2,
                                          style: bodyStyle.copyWith(
                                              fontSize: 14.sp))),
                                ])),
                        Padding(
                            padding: EdgeInsets.only(left: 37),
                            child: Container(
                                width: 360,
                                child: Text(model.body3,
                                    style:
                                        bodyStyle.copyWith(fontSize: 14.sp)))),
                        verticalSpaceMedium,
                        Padding(
                            padding: EdgeInsets.only(
                                top: 10, left: 10, right: 30, bottom: 10),
                            child: containerLight(model)),
                        verticalSpaceSmall,
                        Padding(
                            padding: EdgeInsets.only(
                                top: 10, left: 10, right: 30, bottom: 10),
                            child: containerDark(model)),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              width: 487,
                              child: Divider(
                                color: Theme.of(context).dividerColor,
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(model.head2,
                              style: subheadingStyle.copyWith(
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            width: 394,
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      'Customise the look of your workspace. Feeling adventurous?\n',
                                  style: subheadingStyle.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary)),
                              TextSpan(
                                  text: 'create a custom theme',
                                  style: subheadingStyle.copyWith(
                                      color: Colors.blue)),
                            ])),
                          ),
                        ),
                        verticalSpaceSmall,
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              model.head3,
                              style: bodyStyle.copyWith(
                                  color: Color.fromRGBO(153, 153, 153, 1)),
                            )),
                        Container(
                            padding: EdgeInsets.all(10),
                            width: 500,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Container(
                                        child: Column(
                                  children: [
                                    Container(
                                      width: 370,
                                      height: 150,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  model.lightThmemImg),
                                              fit: BoxFit.fill)),
                                    ),
                                    // subContainer(
                                    //     context,
                                    //     370,
                                    //     model.aubergineChecked,
                                    //     model.aubergineThemeChecked,
                                    //     model.aubergine,
                                    //     Colors.white)
                                  ],
                                ))),
                                horizontalSpaceSmall,
                                Expanded(
                                    child: Column(
                                  children: [
                                    Container(
                                      width: 370,
                                      height: 150,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  model.lightThmemImg2),
                                              fit: BoxFit.fill)),
                                    ),
                                    // subContainer(
                                    //     context,
                                    //     370,
                                    //     model.versatileChecked,
                                    //     model.versatileThemeChecked,
                                    //     model.versatile,
                                    //     Colors.white)
                                  ],
                                )),
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_downward,
                                      color: Colors.blue, size: 20),
                                  Text('Show all classic themes',
                                      style: bodyStyle.copyWith(
                                          fontSize: 14.sp, color: Colors.blue)),
                                ],
                              )),
                        ),
                        verticalSpaceSmall,
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              model.head4,
                              style: bodyStyle.copyWith(
                                  color: Color.fromRGBO(153, 153, 153, 1)),
                            )),
                        Container(
                            padding: EdgeInsets.all(10),
                            width: 500,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Container(
                                        child: Column(
                                  children: [
                                    Container(
                                      width: 370,
                                      height: 150,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(model.coast),
                                              fit: BoxFit.fill)),
                                    ),
                                    subContainer(
                                        context,
                                        370,
                                        model.coastVal,
                                        model.coastChecked,
                                        model.coastName,
                                        Colors.white)
                                  ],
                                ))),
                                horizontalSpaceSmall,
                                Expanded(
                                    child: Column(
                                  children: [
                                    Container(
                                      width: 370,
                                      height: 150,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(model.triadic),
                                              fit: BoxFit.fill)),
                                    ),
                                    subContainer(
                                        context,
                                        370,
                                        model.triVal,
                                        model.triaChecked,
                                        model.triadicName,
                                        Colors.white)
                                  ],
                                )),
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(10),
                            width: 500,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Container(
                                        child: Column(
                                  children: [
                                    Container(
                                      width: 370,
                                      height: 150,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  model.complimentary),
                                              fit: BoxFit.fill)),
                                    ),
                                    subContainer(
                                        context,
                                        370,
                                        model.compliVal,
                                        model.compliChecked,
                                        model.complimentaryName,
                                        Colors.white)
                                  ],
                                ))),
                                horizontalSpaceSmall,
                                Expanded(
                                    child: Column(
                                  children: [
                                    Container(
                                      width: 370,
                                      height: 150,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  AssetImage(model.automatic),
                                              fit: BoxFit.fill)),
                                    ),
                                    subContainer(
                                        context,
                                        370,
                                        model.autoVal,
                                        model.autoChecked,
                                        model.automaticName,
                                        Colors.white)
                                  ],
                                )),
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(10),
                            width: 500,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Container(
                                        child: Column(
                                  children: [
                                    Container(
                                      width: 370,
                                      height: 150,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(model.nocturne),
                                              fit: BoxFit.fill)),
                                    ),
                                    subContainer(
                                        context,
                                        370,
                                        model.nocVal,
                                        model.nocChecked,
                                        model.nocturneName,
                                        Colors.white)
                                  ],
                                ))),
                                horizontalSpaceSmall,
                                Expanded(
                                    child: Column(
                                  children: [
                                    Container(
                                      width: 370,
                                      height: 150,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  AssetImage(model.expensive),
                                              fit: BoxFit.fill)),
                                    ),
                                    subContainer(
                                        context,
                                        370,
                                        model.expVal,
                                        model.expChecked,
                                        model.expensiveName,
                                        Colors.white)
                                  ],
                                )),
                              ],
                            )),
                      ]))),
      viewModelBuilder: () {
        return ThemeViewModel();
      },
    );
  }

  containerLight(ThemeViewModel model) {
    return Container(
      width: 487,
      height: 125,
      padding: EdgeInsets.only(bottom: 0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color.fromRGBO(26, 97, 219, 0.5)),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          ListTile(
            leading: Image(image: AssetImage(model.logoLight)),
            title: Row(children: [
              Text(model.title,
                  style: bodyStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              SizedBox(
                width: 10,
              ),
              Text(model.date(),
                  style:
                      bodyStyle.copyWith(fontSize: 14.sp, color: Colors.black))
            ]),
            subtitle: Container(
                margin: EdgeInsets.only(top: 10),
                child: Text('Look nice today',
                    style: bodyStyle.copyWith(
                        fontSize: 14.sp, color: Colors.black))),
          ),
          Spacer(),
          buildRadio(
            value: toggleBtwTheme.LightTheme,
            groupValue: model.switchLightDark,
            txt: 'Light',
            onChanged: (value) {
              //model.switchBtwLightDark(value);
            },
            color: Color.fromRGBO(26, 97, 219, 0.2),
          )
        ],
      ),
    );
  }

  containerDark(ThemeViewModel model) {
    return Container(
      width: 487,
      height: 125,
      padding: EdgeInsets.only(bottom: 0),
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Color.fromRGBO(26, 97, 219, 0.5)),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          ListTile(
            leading: Image(image: AssetImage(model.logoDark)),
            title: Row(children: [
              Text(model.title,
                  style: bodyStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(
                width: 10,
              ),
              Text(model.date(),
                  style:
                      bodyStyle.copyWith(fontSize: 14.sp, color: Colors.white))
            ]),
            subtitle: Container(
                margin: EdgeInsets.only(top: 10),
                child: Text('Look nice today',
                    style: bodyStyle.copyWith(
                        fontSize: 14.sp, color: Colors.white))),
          ),
          Spacer(),
          buildRadio(
              value: toggleBtwTheme.DarkTheme,
              groupValue: model.switchLightDark,
              txt: 'Dark',
              onChanged: (value) {
                //model.switchBtwLightDark(value);
              },
              color: Colors.white)
        ],
      ),
    );
  }

  buildRadio(
      {required toggleBtwTheme value,
      required Object groupValue,
      void Function(Object? value)? onChanged,
      required String txt,
      required Color color}) {
    return Container(
        height: 50,
        margin: EdgeInsets.all(0),
        decoration: BoxDecoration(
            color: color,
            border:
                Border.all(color: Color.fromRGBO(26, 97, 219, 0.5), width: 0.5),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            horizontalSpaceSmall,
            Radio(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: Colors.green,
            ),
            horizontalSpaceSmall,
            Expanded(
                child: Text(txt,
                    style: bodyStyle.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)))
          ],
        ));
  }
}

Padding padding(BuildContext context, Widget childs) {
  return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 20), child: childs);
}

Container container(
  BuildContext context,
  Color colors,
  String img,
  Color txtColor,
  String theme,
  String title,
  String time,
  bool Checked,
  Color color,
  void Function(bool?)? onChanged,
) {
  return Container(
    width: 487,
    height: 125,
    padding: EdgeInsets.only(bottom: 0),
    decoration: BoxDecoration(
        color: colors,
        border: Border.all(color: Color.fromRGBO(26, 97, 219, 0.5)),
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Column(
      children: [
        ListTile(
          leading: Image(
            image: AssetImage(img),
          ),
          title: Row(children: [
            Text(title,
                style: bodyStyle.copyWith(
                    fontWeight: FontWeight.bold, color: txtColor)),
            SizedBox(
              width: 10,
            ),
            Text(time, style: bodyStyle.copyWith(color: txtColor))
          ]),
          subtitle: Container(
              margin: EdgeInsets.only(top: 10),
              child: Text('Look nice today',
                  style: bodyStyle.copyWith(fontSize: 14.sp, color: txtColor))),
        ),
        Spacer(),
        subContainer(context, 1500, Checked, onChanged, theme, color),
      ],
    ),
  );
}

Container subContainer(BuildContext context, double width, bool Checked,
    void Function(bool?)? onChanged, String them, Color color) {
  return Container(
      width: width,
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(
          color: color,
          border:
              Border.all(color: Color.fromRGBO(26, 97, 219, 0.5), width: 0.5),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        horizontalSpaceSmall,
        Container(
            child: Checkbox(
          fillColor: MaterialStateProperty.all<Color>(Colors.blue),
          shape: CircleBorder(),
          activeColor: Colors.blue,
          value: Checked,
          onChanged: onChanged,
        )),
        horizontalSpaceSmall,
        Expanded(
            child: Text(them,
                style: bodyStyle.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black))),
      ]));
}
