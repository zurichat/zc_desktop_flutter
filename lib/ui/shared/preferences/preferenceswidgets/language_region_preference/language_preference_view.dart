import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../../const_app_colors.dart';

import '../../../const_ui_helpers.dart';
import 'language_preference_viewModel.dart';

class LanguagePreference extends StatelessWidget {
  const LanguagePreference({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _rightSideBarController = ScrollController();

    return ViewModelBuilder<LanguagePreferenceViewModel>.reactive(
      builder: (context, model, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SingleChildScrollView(
          controller: _rightSideBarController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(model.preferencetitles[0],
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w500,
                      color: headerColor)),
              verticalSpaceTiny,
              buildDropDown(
                  kcBackgroundColor2, model.languages, model.dropDownLanguage,
                  (value) {
                model.setSelectedLanguage(value);
              }),
              verticalSpaceSmall,
              SizedBox(
                width: 304.w,
                child: Text(
                  model.subHeadings[0],
                  style: TextStyle(
                    fontFamily: 'Lato',
                    color: leftNavBarColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              verticalSpaceRegular,

              Text(
                model.preferencetitles[1],
                style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                    color: headerColor),
              ),

              ZcCheckBox2(
                  value: model.checkBox1,
                  onChanged: (v) {
                    model.setCheckbox1 = v;
                  },
                  txt: model.checkBoxText[0]),

              verticalSpaceTiny,
              buildDropDown(
                  model.checkBox1 == true ? lightIconColor : kcBackgroundColor2,
                  model.timeZone,
                  model.dropDownTimeZone, (value) {
                model.setSelectedTimeZone(value);
              }),

              SizedBox(
                width: 400.w,
                child: Text(
                  model.subHeadings[1],
                  style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 15,
                  ),
                ),
              ),

              //-----------------------//
              verticalSpaceMedium,
              Text(
                model.preferencetitles[2],
                style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                    color: headerColor),
              ),
              verticalSpaceTiny,

              buildDropDown(kcBackgroundColor2, model.languages,
                  model.dropDownKeyboard, (value) {}),

              verticalSpaceRegular,

              // ------------------ //
              verticalSpaceRegular,
              Text(
                model.preferencetitles[3],
                style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                    color: headerColor),
              ),
              ZcCheckBox2(
                  value: model.checkBox2,
                  onChanged: (v) {
                    model.setcheckBox2 = v;
                  },
                  txt: model.checkBoxText[1])
            ],
          ),
        ),
      ),
      viewModelBuilder: () => LanguagePreferenceViewModel(),
    );
  }
}

buildDropDown(
  Color color,
  List<String> items,
  String value,
  void Function(dynamic)? onChange,
) {
  return Container(
    height: 61.h,
    width: 502.w,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButtonFormField(
          icon: SvgPicture.asset('assets/icons/drop_down_open.svg'),
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
          ),
          isExpanded: true,
          value: value,
          menuMaxHeight: 400,
          onChanged: onChange,
          items: items
              .map<DropdownMenuItem<String>>((String value) => DropdownMenuItem(
                    child: Text(value,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                            color: headerColor)),
                    value: value,
                  ))
              .toList()),
    ),
  );
}

class ZcCheckBox2 extends StatelessWidget {
  const ZcCheckBox2({
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
                    fontSize: 15.sp,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    color: bodyColor))),
      ],
    );
  }
}
