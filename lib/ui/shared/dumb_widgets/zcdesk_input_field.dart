import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_text.dart';

class AuthInputField extends StatelessWidget {
  final String hintPlaceHolder;
  final Color? filledColor;
  final ValueChanged<String?>? onSaved;
  final String? label;
  final String? helperText;
  final int? maxLines;
  final Widget? trailing;
  final TextInputType? inputType;
  final bool password;
  final bool isVisible;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function()? onTrailingTapped;
  final void Function()? onVisibilityTap;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const AuthInputField({
    Key? key,
    this.onSaved,
    this.filledColor = kcBackgroundColor2,
    this.hintPlaceHolder = '',
    this.label,
    this.maxLines,
    this.keyboardType,
    this.inputType,
    this.trailing,
    this.onTrailingTapped,
    this.password = false,
    this.controller,
    this.onChanged,
    this.errorText,
    this.validator,
    this.onVisibilityTap,
    this.isVisible = false,
    this.helperText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // if label is empty, label text will not be visible
        Visibility(
          visible: label == null ? false : true,
          child: ZcdeskText.subheading(label ?? ''),
        ),
        verticalSpaceRegular,
        Stack(
          children: [
            TextFormField(
              controller: controller,
              validator: validator,
              onChanged: onChanged,
              keyboardType: keyboardType,
              autofocus: false,
              obscureText: isVisible,
              cursorColor: Theme.of(context).accentColor,
              textInputAction: TextInputAction.done,
              maxLines: maxLines ?? 1,
              style: headline7,
              decoration: InputDecoration(
                labelStyle: headline7,
                fillColor: filledColor,
                filled: false,
                errorText: errorText,
                errorStyle: kBodyTextStyle.copyWith(color: kcErrorColor),
                suffixIcon: trailing != null
                    ? GestureDetector(
                        onTap: onTrailingTapped,
                        child: trailing,
                      )
                    : null,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                hintText: hintPlaceHolder,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: leftNavBarColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: bodyColor),
                ),
              ),
            ),
            if (password)
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: onVisibilityTap,
                        icon: Icon(isVisible
                            ? Icons.visibility_off
                            : Icons.visibility))),
              )
          ],
        ),
      ],
    );
  }
}
