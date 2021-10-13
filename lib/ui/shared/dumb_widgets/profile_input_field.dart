import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_text.dart';

class ProfileInputField extends StatefulWidget {
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
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function()? onTrailingTapped;
  final void Function()? onVisibilityTap;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  ProfileInputField({
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
    this.suffixIcon,
  }) : super(key: key);

  @override
  _ProfileInputFieldState createState() => _ProfileInputFieldState();
}

class _ProfileInputFieldState extends State<ProfileInputField> {
  // final GlobalKey actionKey = GlobalKey();
  // late FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // if label is empty, label text will not be visible

        Visibility(
          visible: widget.label == null ? false : true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ZcdeskText.subheading(widget.label ?? ''),
              verticalSpaceSmall,
            ],
          ),
        ),
        verticalSpaceRegular,
        TextFormField(
          validator: widget.validator,
          onChanged: widget.onChanged,
          keyboardType: widget.keyboardType,
          autofocus: false,
          cursorColor: Theme.of(context).colorScheme.secondary,
          textInputAction: TextInputAction.done,
          maxLines: widget.maxLines ?? 1,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            fillColor: widget.filledColor,
            filled: false,
            // labelStyle: headline8,
            errorText: widget.errorText,
            errorStyle: kBodyTextStyle.copyWith(color: kcErrorColor),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            // helperStyle: subtitle2,
            helperText: widget.helperText,
            hintText: widget.hintPlaceHolder,
            hintStyle: preferenceStyleNormal,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Colors.red,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kcDisplayChannelColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: kcSecondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}