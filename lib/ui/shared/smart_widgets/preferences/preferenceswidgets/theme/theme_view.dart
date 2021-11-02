import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/preferences/preferenceswidgets/theme/theme_viewmodel.dart';

class ThemeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScrollController _controller = ScrollController();
    return ViewModelBuilder<ThemeViewModel>.reactive(
      builder: (
        context,
        model,
        child,
      ) =>
          Scrollbar(
              controller: _controller,
              isAlwaysShown: true,
              interactive: true,
              scrollbarOrientation: ScrollbarOrientation.right,
              hoverThickness: 8,
              thickness: 5,
              child: SingleChildScrollView(
                  controller: _controller,
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.all(10)),
                            Container(
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        right: 10, left: 10, top: 20),
                                    child: Text(
                                      model.head1,
                                      style:
                                          headline6.copyWith(fontSize: 16.sp),
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
                                          style: kBodyTextStyle.copyWith(
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
                                              style: kBodyTextStyle.copyWith(
                                                  fontSize: 14.sp))),
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(left: 37),
                                child: Container(
                                    width: 360,
                                    child: Text(model.body3,
                                        style: kBodyTextStyle.copyWith(
                                            fontSize: 14.sp)))),
                            verticalSpaceMedium,
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 10, left: 10, right: 30, bottom: 10),
                                child: ClassicThemeWidgetLight(
                                  model: model,
                                )),
                            verticalSpaceSmall,
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 10, left: 10, right: 30, bottom: 10),
                                child: ClassicThemeWidgetDark(
                                  model: model,
                                )),
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
                                  style: kSubHeadingTextStyle.copyWith(
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
                                          customizeWorkspace,
                                      style: kSubHeadingTextStyle.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                                  TextSpan(
                                      text: customTheme,
                                      style: kSubHeadingTextStyle.copyWith(
                                          color:
                                              Color.fromRGBO(0, 184, 124, 1))),
                                ])),
                              ),
                            ),
                            verticalSpaceSmall,
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  model.head3,
                                  style: kBodyTextStyle.copyWith(
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
                                            BottomContainerWidget(
                                                value: cleanThemes.aubergine,
                                                groupValue: model.cleanTheme,
                                                onChanged: model.switchCleanTheme,
                                                txt: model.aubergine)
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
                                        BottomContainerWidget(
                                            value: cleanThemes.versatile,
                                            groupValue: model.cleanTheme,
                                            onChanged: model.switchCleanTheme,
                                            txt: model.versatile)
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Theme(
                                    data: ThemeData().copyWith(
                                        dividerColor: Colors.transparent),
                                    child: ExpansionTile(
                                        tilePadding: EdgeInsets.all(0),
                                        childrenPadding: EdgeInsets.all(0),
                                        trailing: SizedBox.shrink(),
                                        title: Row(
                                          children: [
                                            Icon(Icons.arrow_downward,
                                                color: Color.fromRGBO(
                                                    0, 184, 124, 1),
                                                size: 20),
                                            Text(classicThemes,
                                                style: kBodyTextStyle.copyWith(
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
                                                        alignment:
                                                            Alignment.center,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    model
                                                                        .aubergine2),
                                                                fit: BoxFit
                                                                    .fill)),
                                                      ),
                                                      BottomContainerWidget(
                                                          value: cleanThemes
                                                              .aubergine1,
                                                          groupValue:
                                                              model.cleanTheme,
                                                          onChanged: model
                                                              .switchCleanTheme,
                                                          txt: model.aubergine)
                                                    ],
                                                  )),
                                                  horizontalSpaceSmall,
                                                  Column(
                                                    children: [
                                                      Container(
                                                        width: 198,
                                                        height: 115,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    model
                                                                        .aubergine3),
                                                                fit: BoxFit
                                                                    .fill)),
                                                      ),
                                                      BottomContainerWidget(
                                                          value: cleanThemes
                                                              .aubergine2,
                                                          groupValue:
                                                              model.cleanTheme,
                                                          onChanged: model
                                                              .switchCleanTheme,
                                                          txt: model.aubergine)
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
                                  style: kBodyTextStyle.copyWith(
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
                                                      image:
                                                      AssetImage(model.coast),
                                                      fit: BoxFit.fill)),
                                            ),
                                            BottomContainerWidget(
                                                value: darkDramaticTheme.coast,
                                                groupValue: model.darkDramaTheme,
                                                onChanged:
                                                model.switchDramaticTheme,
                                                txt: model.coastName)
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
                                                  AssetImage(model.triadic),
                                                  fit: BoxFit.fill)),
                                        ),
                                        BottomContainerWidget(
                                            value: darkDramaticTheme.triadic,
                                            groupValue: model.darkDramaTheme,
                                            onChanged:
                                            model.switchDramaticTheme,
                                            txt: model.triadicName)
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
                                            BottomContainerWidget(
                                                value:
                                                darkDramaticTheme.complimentary,
                                                groupValue: model.darkDramaTheme,
                                                onChanged:
                                                model.switchDramaticTheme,
                                                txt: model.complimentaryName)
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
                                                      model.automatic),
                                                  fit: BoxFit.fill)),
                                        ),
                                        BottomContainerWidget(
                                            value: darkDramaticTheme.automatic,
                                            groupValue: model.darkDramaTheme,
                                            onChanged:
                                            model.switchDramaticTheme,
                                            txt: model.automaticName)
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
                                                          model.nocturne),
                                                      fit: BoxFit.fill)),
                                            ),
                                            BottomContainerWidget(
                                                value: darkDramaticTheme.nocturne,
                                                groupValue: model.darkDramaTheme,
                                                onChanged:
                                                model.switchDramaticTheme,
                                                txt: model.nocturneName)
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
                                                      model.expensive),
                                                  fit: BoxFit.fill)),
                                        ),
                                        BottomContainerWidget(
                                            value: darkDramaticTheme.expensive,
                                            groupValue: model.darkDramaTheme,
                                            onChanged:
                                            model.switchDramaticTheme,
                                            txt: model.expensiveName)
                                      ],
                                    ),
                                  ],
                                )),
                          ])))),
      viewModelBuilder: () {
        return ThemeViewModel();
      },
          onModelReady: (model) => model.fetchAndSetSetting(),
      onDispose: (model) => model.saveSettings(),
    );
  }
}

class ClassicThemeWidgetDark extends StatelessWidget {
  final ThemeViewModel model;
  ClassicThemeWidgetDark({required this.model});
  @override
  Widget build(BuildContext context) {
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
                  style: kBodyTextStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(
                width: 10,
              ),
              Text(model.date(),
                  style: kBodyTextStyle.copyWith(
                      fontSize: 14.sp, color: Colors.white))
            ]),
            subtitle: Container(
                margin: EdgeInsets.only(top: 10),
                child: Text('Look nice today',
                    style: kBodyTextStyle.copyWith(
                        fontSize: 14.sp, color: Colors.white))),
          ),
          Spacer(),
          BuildRadio(
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
}

class ClassicThemeWidgetLight extends StatelessWidget {
  final ThemeViewModel model;

  ClassicThemeWidgetLight({required this.model});

  @override
  Widget build(BuildContext context) {
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
              Text(model.title, style: preferenceStyleBold),
              SizedBox(
                width: 10,
              ),
              Text(model.date(), style: preferenceStyleNormal)
            ]),
            subtitle: Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(lookNiceToday, style: preferenceStyleNormal)),
          ),
          Spacer(),
          BuildRadio(
            value: toggleBtwTheme.LightTheme,
            groupValue: model.switchLightDark,
            txt: light,
            onChanged: (value) {
              model.switchBtwLightDark(value);
            },
            color: Color.fromRGBO(0, 184, 124, 0.42),
          )
        ],
      ),
    );
  }
}

class BottomContainerWidget extends StatelessWidget {
  final Object value;
  final Object groupValue;
  final void Function(Object? value)? onChanged;
  final String txt;
  BottomContainerWidget({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.txt,
  });
  @override
  Widget build(BuildContext context) {
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
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.grey),
              child: Radio(
                activeColor: Colors.green,
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
              )),
          horizontalSpaceSmall,
          Text(txt, style: preferenceStyleBold)
        ]));
  }
}

class BuildRadio extends StatelessWidget {
  final Object value;
  final Object groupValue;
  final void Function(Object? value)? onChanged;
  final String txt;
  final Color color;

  BuildRadio(
      {required this.value,
      required this.groupValue,
      required this.onChanged,
      required this.txt,
      required this.color});

  @override
  Widget build(BuildContext context) {
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
            Theme(
                data: ThemeData(unselectedWidgetColor: Colors.grey),
                child: Radio(
                  focusColor: Colors.green,
                  value: value,
                  groupValue: groupValue,
                  onChanged: onChanged,
                  activeColor: Colors.green,
                )),
            horizontalSpaceSmall,
            Expanded(child: Text(txt, style: preferenceStyleBold))
          ],
        ));
  }
}
