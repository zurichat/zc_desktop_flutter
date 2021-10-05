import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_text.dart';

class ZuriDeskInputField extends StatelessWidget {
  final String hintPlaceHolder;
  final Color? filledColor;
  final ValueChanged<String?>? onSaved;
  final String? label;
  final String? helperText;
  final int? maxLines;
  final Widget? trailing;
  final Widget? prefix;
  final TextInputType? inputType;
  final bool password;
  final bool isVisible;
  final String? errorText;
  final Color? focusColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function()? onTrailingTapped;
  final void Function()? onVisibilityTap;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const ZuriDeskInputField(
      {Key? key,
      this.onSaved,
      this.filledColor = kcBackgroundColor2,
      this.hintPlaceHolder = '',
      this.label,
      this.maxLines,
      this.keyboardType,
      this.inputType,
      this.trailing,
      this.prefix,
      this.onTrailingTapped,
      this.password = false,
      this.controller,
      this.onChanged,
      this.errorText,
      this.validator,
      this.onVisibilityTap,
      this.isVisible = false,
      this.helperText,
      this.focusColor = bodyColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // if label is empty, label text will not be visible
        Visibility(
          visible: label == null ? false : true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ZcdeskText.subheading(label ?? ''),
              verticalSpaceRegular,
            ],
          ),
        ),

        Stack(
          children: [
            TextFormField(
              controller: controller,
              validator: validator,
              onChanged: onChanged,
              keyboardType: keyboardType,
              autofocus: false,
              obscureText: isVisible,
              cursorColor: Theme.of(context).colorScheme.secondary,
              textInputAction: TextInputAction.done,
              maxLines: maxLines ?? 1,
              style: subtitle2,
              decoration: InputDecoration(
                labelStyle: headline7,
                fillColor: filledColor,
                filled: false,
                errorText: errorText,
                errorStyle: kBodyTextStyle.copyWith(color: kcErrorColor),
                prefixIcon: prefix,
                prefixStyle: TextStyle(color: focusColor),
                suffixIcon: trailing != null
                    ? GestureDetector(
                        onTap: onTrailingTapped,
                        child: trailing,
                      )
                    : null,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                hintText: hintPlaceHolder,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
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
                  borderRadius: BorderRadius.all(
                      Radius.circular(focusColor == bodyColor ? 4.0 : 10)),
                  borderSide: BorderSide(
                      color: focusColor!,
                      width: focusColor == bodyColor ? 1.0 : 2.0),
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
