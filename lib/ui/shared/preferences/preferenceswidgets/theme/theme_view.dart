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
                                  style: headline6.copyWith(fontSize: 16.sp),
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
                                      color: Color.fromRGBO(0, 184, 124, 1))),
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
                                Container(
                                    child: Column(
                                  children: [
                                    Container(
                                      width: 198,
                                      height: 115,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  model.lightThmemImg),
                                              fit: BoxFit.fill)),
                                    ),
                                    bottomContainer(
                                        value: cleanThemes.aubergine,
                                        groupValue: model.cleanTheme,
                                        txt: "Aubergine",
                                        onChanged: model.switchCleanTheme),
                                  ],
                                )),
                                horizontalSpaceSmall,
                                Column(
                                  children: [
                                    Container(
                                      width: 198,
                                      height: 115,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  model.lightThmemImg2),
                                              fit: BoxFit.fill)),
                                    ),
                                    bottomContainer(
                                        value: cleanThemes.versatile,
                                        groupValue: model.cleanTheme,
                                        txt: "Versatile",
                                        onChanged: model.switchCleanTheme),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Theme(
                                data: ThemeData()
                                    .copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                    tilePadding: EdgeInsets.all(0),
                                    childrenPadding: EdgeInsets.all(0),
                                    trailing: null,
                                    title: Row(
                                      children: [
                                        Icon(Icons.arrow_downward,
                                            color:
                                                Color.fromRGBO(0, 184, 124, 1),
                                            size: 20),
                                        Text('Show all classic themes',
                                            style: bodyStyle.copyWith(
                                                fontSize: 14.sp,
                                                color: Color.fromRGBO(
                                                    0, 184, 124, 1))),
                                      ],
                                    ),
                                    children: [
                                      Container(
                                          width: 500,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  child: Column(
                                                children: [
                                                  Container(
                                                    width: 198,
                                                    height: 115,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                model
                                                                    .aubergine2),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                  bottomContainer(
                                                      value: cleanThemes
                                                          .aubergine1,
                                                      groupValue:
                                                          model.cleanTheme,
                                                      txt: "Aubergine",
                                                      onChanged: model
                                                          .switchCleanTheme),
                                                ],
                                              )),
                                              horizontalSpaceSmall,
                                              Column(
                                                children: [
                                                  Container(
                                                    width: 198,
                                                    height: 115,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                model
                                                                    .aubergine3),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                  bottomContainer(
                                                      value: cleanThemes
                                                          .aubergine2,
                                                      groupValue:
                                                          model.cleanTheme,
                                                      txt: "Aubergine",
                                                      onChanged: model
                                                          .switchCleanTheme),
                                                ],
                                              ),
                                            ],
                                          )),
                                    ]))),
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
                                Container(
                                    child: Column(
                                  children: [
                                    Container(
                                      width: 198,
                                      height: 115,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(model.coast),
                                              fit: BoxFit.fill)),
                                    ),
                                    bottomContainer(
                                        value: darkDramaticTheme.coast,
                                        groupValue: model.darkDramaTheme,
                                        txt: "Coast",
                                        onChanged: model.switchDramaticTheme),
                                  ],
                                )),
                                horizontalSpaceSmall,
                                Column(
                                  children: [
                                    Container(
                                      width: 198,
                                      height: 115,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(model.triadic),
                                              fit: BoxFit.fill)),
                                    ),
                                    bottomContainer(
                                        value: darkDramaticTheme.triadic,
                                        groupValue: model.darkDramaTheme,
                                        txt: "Triadic",
                                        onChanged: model.switchDramaticTheme),
                                  ],
                                ),
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(10),
                            width: 500,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    child: Column(
                                  children: [
                                    Container(
                                      width: 198,
                                      height: 115,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  model.complimentary),
                                              fit: BoxFit.fill)),
                                    ),
                                    bottomContainer(
                                        value: darkDramaticTheme.complimentary,
                                        groupValue: model.darkDramaTheme,
                                        txt: "Complimentary",
                                        onChanged: model.switchDramaticTheme),
                                  ],
                                )),
                                horizontalSpaceSmall,
                                Column(
                                  children: [
                                    Container(
                                      width: 198,
                                      height: 115,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  AssetImage(model.automatic),
                                              fit: BoxFit.fill)),
                                    ),
                                    bottomContainer(
                                        value: darkDramaticTheme.automatic,
                                        groupValue: model.darkDramaTheme,
                                        txt: "Automatic",
                                        onChanged: model.switchDramaticTheme),
                                  ],
                                ),
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(10),
                            width: 500,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    child: Column(
                                  children: [
                                    Container(
                                      width: 198,
                                      height: 115,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(model.nocturne),
                                              fit: BoxFit.fill)),
                                    ),
                                    bottomContainer(
                                        value: darkDramaticTheme.nocturne,
                                        groupValue: model.darkDramaTheme,
                                        txt: "Nocturne",
                                        onChanged: model.switchDramaticTheme),
                                  ],
                                )),
                                horizontalSpaceSmall,
                                Column(
                                  children: [
                                    Container(
                                      width: 198,
                                      height: 115,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  AssetImage(model.expensive),
                                              fit: BoxFit.fill)),
                                    ),
                                    bottomContainer(
                                        value: darkDramaticTheme.expensive,
                                        groupValue: model.darkDramaTheme,
                                        txt: "Expensive",
                                        onChanged: model.switchDramaticTheme),
                                  ],
                                ),
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
              model.switchBtwLightDark(value);
            },
            color: Color.fromRGBO(0, 184, 124, 0.42),
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
                model.switchBtwLightDark(value);
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
              focusColor: Colors.green,
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

  bottomContainer({
    required Object value,
    required Object groupValue,
    void Function(Object? value)? onChanged,
    required String txt,
  }) {
    return Container(
        width: 198,
        height: 38,
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border.all(color: Color.fromRGBO(26, 97, 219, 0.5), width: 0.5),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Radio(
            activeColor: Colors.green,
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          horizontalSpaceSmall,
          Text(txt,
              style: bodyStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black))
        ]));
  }
}

Padding padding(BuildContext context, Widget childs) {
  return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 20), child: childs);
}

Container subContainer(BuildContext context, double width, bool Checked,
    void Function(bool?)? onChanged, String them, Color color) {
  return Container(
      width: width,
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(
          color: color,
          border:
              Border.all(color: Color.fromRGBO(203, 203, 203, 1), width: 0.5),
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
