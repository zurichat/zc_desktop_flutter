import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';

class ChannelSearchInputField extends StatelessWidget {
  final String hintPlaceHolder;
  final Color? filledColor;
  final Color borderColor;
  final Color borderFocusColor;
  final ValueChanged<String?>? onSaved;
  final String? label;
  final int? maxLines;
  final Widget? trailing;
  final TextInputType? inputType;
  final bool password;
  final bool isFocus;
  final bool isVisible;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function()? onTrailingTapped;
  final void Function()? onVisibilityTap;
  final ValueChanged<String>? onChanged;

  const ChannelSearchInputField({
    Key? key,
    this.onSaved,
    this.filledColor = kcBackgroundColor2,
    this.borderColor = bodyColor,
    this.borderFocusColor = bodyColor,
    this.isFocus = false,
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
    this.onVisibilityTap,
    this.isVisible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .7,
      height: MediaQuery.of(context).size.height * .05,
      child: TextField(
        onChanged: onChanged,
        keyboardType: keyboardType,
        autofocus: isFocus,
        obscureText: isVisible,
        cursorColor: Theme.of(context).colorScheme.secondary,
        textInputAction: TextInputAction.done,
        maxLines: maxLines ?? 1,
        style: TextStyle(
          color: Color.fromRGBO(153, 153, 153, 1),
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
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
              const EdgeInsets.only(top: 10, left: 15, bottom: 15, right: 15,),
          hintText: hintPlaceHolder,
          hintStyle: TextStyle(
            color: Color.fromRGBO(153, 153, 153, 1),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
            borderSide: BorderSide(color: Color.fromRGBO(153, 153, 153, 0.2)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(153, 153, 153, 0.2)),
          ),
        ),
      ),
    );
  }
}
